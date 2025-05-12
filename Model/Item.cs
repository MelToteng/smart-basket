using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace scanner.Model
{
    [Table("Item")]
    public class Item {

        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Barcode { get; set; }
        //public Blob Image { get; set; }
        public string? ImageUrl {  get; set; }  
        public decimal EstimatedCost { get; set; }

        public Item()
        {
                
        }

    }
}
