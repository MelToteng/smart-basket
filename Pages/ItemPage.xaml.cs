using Microsoft.Maui.Controls.Internals;
using Mopups.Services;
using Newtonsoft.Json.Linq;
using Plugin.Maui.OCR;
using scanner.Model;
using scanner.Model.Enum;
using scanner.Services.DB;
using System.Net;

namespace scanner.Pages;

public partial class ItemPage
{
    private Item product;
    private bool _isReadOnly;
    IOcrService? ocrService;
    IRepository<Item> itemRepository;
    IRepository<ListItem> listRepository;

    ListMode listMode;

    public ItemPage(IRepository<ListItem> _listRepository, ListMode _listMode, IRepository<Item> _itemRepository, string barcode = "")
    {
        InitializeComponent();

        initializeConstants(_listRepository, _itemRepository, _listMode);

        FindItem(null,barcode);

        AllowCaptureBarcodeManually();
    }

    public ItemPage(IRepository<ListItem> _listRepo, IRepository<Item> _itemRepository, int? itemId, ListMode _listMode)
    {
        InitializeComponent();

        initializeConstants(_listRepo,_itemRepository,_listMode);
        
        FindItem(itemId, null);

        AllowCaptureBarcodeManually();
    }


    protected override async void OnAppearing()
    {
        if (ocrService != null) await ocrService.InitAsync();
    }

    private async void AddButton_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(NameEntry.Text))
        {
            await DisplayAlert("Required", "Atleast the name of the product should be captured", "ok");

            return;

        }

        if (product.Id != 0)
        {
            itemRepository.Update(product);

            var listItem = listRepository.Get(x => x.ItemId == product.Id).FirstOrDefault();

            if (listItem != null)
            {


                int quantity = 0;

                int.TryParse(QuantityField.Text, out quantity);

                if (listItem.UnitPrice != product.EstimatedCost)
                {
                    listItem.UnitPrice = product.EstimatedCost;
                }

                listItem.Quantity = quantity;

                listRepository.Update(listItem);

            }

        }
        else await AddNewProduct();

        await MopupService.Instance.PopAsync();
    }

    private void initializeConstants(IRepository<ListItem> _listRepo, IRepository<Item> _itemRepository, ListMode _listMode) 
    {
        itemRepository = _itemRepository;

        listRepository = _listRepo;

        listMode = _listMode;

        product = new Item();

        BindingContext = new Item();

    }

    private async Task AddNewProduct()
    {
        GetProductData();

        AddItem();

        var listItem = listRepository.Get(x => x.ItemId == product.Id && x.ListType==listMode);

        if (listItem is not null)
        {

            int quantity = 0;

            int.TryParse(QuantityField.Text, out quantity);

            var newListItem = new ListItem()
            {
                ItemId = product.Id,
                ListType = listMode,
                UnitPrice = product.EstimatedCost,
                Quantity = quantity
            };

            listRepository.Save(newListItem);

        }
        else
            await DisplayAlert("Information", "Item already exists in budget", "ok");
    }

    private void GetProductData()
    {
        product = new Item();

        int id = 0;

        int.TryParse(ProductIdEntry.Text, out id);

        if (id > 0)
            product.Id = id;

        product.Barcode = BarcodeEntry.Text;
        product.Name = NameEntry.Text;
        product.Description = DescriptionEntry.Text;

        decimal eCost = 0M;

        decimal.TryParse(EstimatedCostEntry.Text, out eCost);

        product.EstimatedCost = eCost;
    }

    private void AddItem()
    {
        var exists = itemRepository.Get(i => i.Barcode == product.Barcode && i.Name == product.Name && i.Description == product.Description).Count > 0;

        if (!exists)
        {
            itemRepository.Save(product);
        }
    }

    private void CancelButton_Clicked(object sender, EventArgs e)
    {
        MopupService.Instance.PopAsync();
    }

    //private async void captureOcr_Clicked(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        var result = await MediaPicker.Default.CapturePhotoAsync();

    //        if (result != null)
    //        {
    //            using var imageStream = await result.OpenReadAsync();

    //            var imageasBytes = new byte[imageStream.Length];

    //            await imageStream.ReadAsync(imageasBytes);

    //            var ocrResult = await ocrService.RecognizeTextAsync(imageasBytes);

    //            if (!ocrResult.Success)
    //            {
    //                await DisplayAlert("ocr result", "text not detected", "ok");

    //                return;
    //            }

    //            await DisplayAlert("ocr result", ocrResult.AllText, "ok");
    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //        await DisplayAlert("error", ex.Message, "ok");
    //    }
    //}

    private void AllowCaptureBarcodeManually()
    {
        bool display = string.IsNullOrEmpty(BarcodeEntry.Text) ? true : false;

        BarcodeEntry.IsVisible = display;
        ProductBarcodeEntryLabel.IsVisible = display;
    }

    private void MakeFieldsEdtiable(bool isReadOnly)
    {
        NameEntry.IsReadOnly = isReadOnly;
        DescriptionEntry.IsReadOnly = isReadOnly;
        EstimatedCostEntry.IsReadOnly = isReadOnly;
    }

    private async void FindItem(int? itemId, string? barcode) 
    {
        var item = FindItemWithIdLocally(itemId);

        int? _itemId = item is not null ? item.Id : null;


        item= item ?? await FindItemWithBarcode(barcode); 

        if (item is not null)
        {
            BarcodeEntry.Text = item.Barcode is not null? item.Barcode:barcode;
            NameEntry.Text = item.Name is not null? item.Name : string.Empty;
            DescriptionEntry.Text = item.Description is not null ? item.Description : string.Empty;
            EstimatedCostEntry.Text=item.EstimatedCost.ToString();

            _itemId = item.Id > 0 ? item.Id : _itemId.Value;

            if (itemId.HasValue) ProductIdEntry.Text = itemId.Value.ToString() ;

            if (_itemId.HasValue) ProductIdEntry.Text = _itemId.Value.ToString();

            int? quantity = GetItemQuantityBasedOnList(_itemId ?? item.Id);

            QuantityField.Text=(quantity.HasValue?quantity:0).ToString();

            AddButton.Text = "Save";

        }

        if (!string.IsNullOrEmpty(barcode))
            BarcodeEntry.Text = barcode;

    }

    private Item? FindItemWithIdLocally(int? id)
    {
        if (!id.HasValue) return null;


        return itemRepository.Get(id.Value);

    }

    public async Task<Item?> FindItemWithBarcode(string? barcode) 
    {
        if (barcode is null)
            return null;
        
        var item = FindItemLocallyWithBarcode(barcode);

        if(item is null)
        {
            item= await FindItemOnlineWithBarcode(barcode);
        }

        return item;
    }
    public async Task<Item?> FindItemOnlineWithBarcode(string barcode)
    {
        try
        {
            if (string.IsNullOrEmpty(barcode))
                return null;

            string url1 = $"https://world.openfoodfacts.org/api/v0/product/{product.Barcode}.json";
            string url2 = $"https://world.openbeautyfacts.org/api/v3/product/{product.Barcode}.json";

            HttpClient client = new HttpClient();
            HttpResponseMessage response = await client.GetAsync(url1);

            if (response.StatusCode != HttpStatusCode.OK)
                return null;

            string responseBody = await response.Content.ReadAsStringAsync();

            JObject json = JObject.Parse(responseBody);

            int status = Convert.ToInt32(json["status"]);

            if (status == 0)
            {
                response = await client.GetAsync(url2);

                responseBody = await response.Content.ReadAsStringAsync();

                json = JObject.Parse(responseBody);

                string result = json["status"].ToString();

                status = result.Equals("failure") ? 0 : 1;
            }


            if (status == 1)
            {
                Item? _product = new Item();

                _product.Name = json["generic_name_en"] != null ? json["generic_name_en"].ToString() : "";
                _product.Description = json["product_name_en"] != null ? json["product_name_en"].ToString() + $" " +
                $"{json["product_quantity"].ToString()} {json["product_quantity_unit"].ToString()}" : "";

                return product;
            }

            return null;


        }
        catch (HttpRequestException e)
        {
            throw;
        }
    }

    private Item? FindItemLocallyWithBarcode(string? barcode) 
    {
        try
        {
            if (barcode == null) return null;

            return itemRepository.Get(x => x.Barcode == barcode).FirstOrDefault();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private int? GetItemQuantityBasedOnList(int? itemId) 
    {
        try
        {
            if (!itemId.HasValue)
                return null;

            int? quantity = null;

            var listItem = listRepository.Get(x => x.ItemId == itemId).FirstOrDefault();

            quantity = listItem is not null ? listItem.Quantity : null;

            return quantity;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

}