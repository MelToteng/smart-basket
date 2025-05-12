using BarcodeScanning;
using Mopups.Interfaces;
using Plugin.Maui.OCR;
using scanner.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace scanner.ViewModel
{
    public class MainViewModel
    {

        ObservableCollection<Item> ScannedProducts { get; set; }
        public ICommand onAddCommand { get; set; }
        
        public MainViewModel() 
        {
            ScannedProducts = new ObservableCollection<Item>();

            onAddCommand = new Command(onAddCommandClick);
        }

        public void AddScannedProduct(Item item) 
        { 
            ScannedProducts.Add(item);
        }

        private void onAddCommandClick() 
        { 
            
        }
        
    }
}
