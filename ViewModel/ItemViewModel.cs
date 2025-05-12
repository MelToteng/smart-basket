using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace scanner.ViewModel
{
    public class ItemViewModel:INotifyPropertyChanged
    {
        public ItemViewModel()
        {
                
        }

        public event PropertyChangedEventHandler? PropertyChanged;
    }
}
