using scanner.Model.Enum;
using SQLite;

namespace scanner.Model
{
    [Table("ListItems")]
    public class ListItem
    {
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }

        public ListMode ListType { get; set; }

        public int ItemId { get; set; }

        public int Quantity { get; set; }

        public decimal UnitPrice { get; set; } = 0M;
        public DateTime DateAdded { get; set; }= DateTime.Now;

        public ListItem()
        {
                
        }

    }

    
}
