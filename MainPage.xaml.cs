using BarcodeScanning;
using Microsoft.Maui.Graphics;
using Mopups.Interfaces;
using Plugin.Maui.OCR;
using scanner.Controls;
using scanner.Model;
using scanner.Model.Enum;
using scanner.Pages;
using scanner.Services.DB;
using System.Collections.ObjectModel;

namespace scanner
{
    public partial class MainPage : ContentPage
    {
        public bool scan = false;
        double totalCost;
        private readonly BarcodeDrawable _drawable = new();

        IRepository<Item> itemRepository;
        IRepository<ListItem> listRepository;

        IPopupNavigation popupNavigation;
        IOcrService ocrService;

        ListMode listMode;
        ObservableCollection<ListItem> ScannedProducts { get; set; }

        public MainPage(IPopupNavigation popupNavigation, IOcrService _ocr, IRepository<ListItem> _listRepository, IRepository<Item> _itemRepository)
        {
            InitializeComponent();
            ScannedProducts = new ObservableCollection<ListItem>();


            this.popupNavigation = popupNavigation;
            itemRepository = _itemRepository;
            listRepository = _listRepository;

            ocrService = _ocr;

            listMode = ListMode.Budget;

            totalCost = 0;

            UpdateFloatingButtonView();
            UpdateList();
        }

        protected override async void OnAppearing()
        {
            await Methods.AskForRequiredPermissionAsync();
            base.OnAppearing();


            Graphics.Drawable = _drawable;
        }

        protected override void OnDisappearing()
        {
            base.OnDisappearing();
            Barcode.CameraEnabled = false;
        }

        private void OnScanButtonClicked(object sender, EventArgs e)
        {
            PopupMenu.IsVisible = !PopupMenu.IsVisible;

            CloseOrOpenCamera();
        }

        private void CloseOrOpenCamera()
        {
            barcodeView.IsVisible = !barcodeView.IsVisible;

            if (barcodeView.IsVisible)
            {
                Barcode.CameraEnabled = true;
                CloseButton.IsVisible = true;
            }
            else
            {
                Barcode.CameraEnabled = false;
                CloseButton.IsVisible = false;
            }
        }

        private void CameraView_OnDetectionFinished(object sender, OnDetectionFinishedEventArg e)
        {
            var barcodeResults = e.BarcodeResults;

            if (barcodeResults is not null && barcodeResults.Length > 0)
            {
                _drawable.barcodeResults = barcodeResults;

                Graphics.Invalidate();

                CloseOrOpenCamera();

                var barcode = barcodeResults[0].RawValue;

                popupNavigation.PushAsync(new ItemPage(listRepository, listMode, itemRepository, barcode));


            }
        }

        private class BarcodeDrawable : IDrawable
        {
            public BarcodeResult[]? barcodeResults;
            public void Draw(ICanvas canvas, RectF dirtyRect)
            {
                canvas.StrokeSize = 5;
                canvas.StrokeColor = Colors.Green;
                var scale = 1 / canvas.DisplayScale;
                canvas.Scale(scale, scale);

                if (barcodeResults is not null)
                {
                    foreach (var barcode in barcodeResults)
                    {
                        canvas.DrawRectangle(barcode.PreviewBoundingBox);
                    }
                }
            }
        }

        private async void AddButton_Clicked(object sender, EventArgs e)
        {
            
                var popupPage = new ItemPage(listRepository, listMode, itemRepository);

                popupPage.Disappearing += (s, args) =>
                {

                    UpdateList();
                };

                PopupMenu.IsVisible = !PopupMenu.IsVisible;

                await popupNavigation.PushAsync(popupPage);
            
        }

        private async void DeleteAllButton_Clicked(object sender, EventArgs e)
        {
            try
            {
                var list = listRepository.Get(x => x.ListType == listMode);

                Parallel.ForEach(list, item => {

                    listRepository.Delete(item);

                    UpdateList();
                });
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void UpdateFloatingButtonView()
        {

             if (PopupMenu.IsVisible) { 
                FloatingActionButtonIcon.Glyph = "\uf077";
                FloatingActionButtonIcon.FontFamily = "FontAwesomeSolid";
                ToolTipProperties.SetText(FloatingActionButton, "Close Menu");

                if (listMode == ListMode.Buy)
                {
                    AddManuallyBtn.IsVisible = false;
                }
            }
            else
            {
                FloatingActionButtonIcon.Glyph = "+";
                ToolTipProperties.SetText(FloatingActionButton, "Add Product");
            }
        }

        private void UpdateList()
        {
            var items = PopulateItems(listRepository.Get(x => x.ListType == listMode).ToList());

            Lists.ItemsSource = items;

            totalCostLabel.Text = items.Aggregate(0M, (sum, item) => sum + item.Cost, sum => $"Total Cost:{sum}");
        }

        private List<dynamic> PopulateItems(List<ListItem> listItems)
        {
            var items = new List<dynamic>();

            Parallel.ForEach(listItems, itemList =>
            {
                var item = itemRepository.Get(itemList.ItemId);

                var itemDisplay = new
                {
                    Id = itemList.ItemId,
                    item.Name,
                    Discription = item.Description,
                    item.ImageUrl,
                    Cost = itemList.Quantity > 0 ? itemList.UnitPrice * itemList.Quantity : itemList.UnitPrice
                };

                if (item is not null)
                    items.Add(itemDisplay);
            });

            return items;
        }

        private void UpdateModeUI()
        {
            // Update tab appearance
            if (listMode == ListMode.Budget)
            {
                // Budget Mode is selected
                ManageModeFrame.BackgroundColor = Colors.White;
                ManageModeButton.TextColor = Color.FromArgb("#0066FF");

                BuyModeFrame.BackgroundColor = Colors.Transparent;
                BuyModeButton.TextColor = Colors.White;

            }
            else
            {
                // Buy Mode is selected
                BuyModeFrame.BackgroundColor = Colors.White;
                BuyModeButton.TextColor = Color.FromArgb("#0066FF");

                ManageModeFrame.BackgroundColor = Colors.Transparent;
                ManageModeButton.TextColor = Colors.White;

            }

            //update action button
            UpdateFloatingButtonView();

            // Notify that IsManageMode property has changed to update button visibility
            //OnPropertyChanged(nameof(IsManageMode));

            //// Force refresh of the collection view to update button visibility
            //var items = Items.ToList();
            //Items.Clear();
            //foreach (var item in items)
            //{
            //    Items.Add(item);
            //}
        }

        private void onEditClicked(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var itemId = (int)button.CommandParameter;


            var popupPage = new ItemPage(listRepository, itemRepository, itemId, listMode);

            popupPage.Disappearing += (s, args) =>
            {

                UpdateList();
            };

            popupNavigation.PushAsync(popupPage);
        }

        private void onDeleteClicked(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var itemId = (int)button.CommandParameter;

            var item=listRepository.Get(x=>x.ItemId==itemId).FirstOrDefault();

            listRepository.Delete(item);

            UpdateList();
        }

        private async void OnFloatingActionButtonClicked(object sender, EventArgs e)
        {
          
                if (!PopupMenu.IsVisible)
                {
                    await PopupMenu.FadeTo(1, 300, Easing.CubicIn);
                    await PopupMenu.ScaleTo(1, 300, Easing.CubicOut);
                }
                else
                {
                    await PopupMenu.FadeTo(0, 300, Easing.CubicOut);
                    await PopupMenu.ScaleTo(0.8, 300, Easing.CubicIn);
                }

                PopupMenu.IsVisible = !PopupMenu.IsVisible;

                UpdateFloatingButtonView();
            
        }

        private void OnManageModeClicked(object sender, EventArgs e)
        {
            if (listMode != ListMode.Budget)
            {
                listMode = ListMode.Budget;
                UpdateModeUI();
            }

            UpdateList();
        }

        private void OnBuyModeClicked(object sender, EventArgs e)
        {
            if (listMode != ListMode.Buy)
            {
                listMode = ListMode.Buy;
                UpdateModeUI();
            }

            UpdateList();
        }
    }

}
