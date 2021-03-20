using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBridge.Models
{
    public class clsCart :clsProduct
    {
        //public int ProductID { get; set; }
        public int UnitsAdded { get; set; }
        public string IsDiscountApplicable { get; set; }
        public string ProductDiscount { get; set; }
        public string OriginalPrice { get; set; }
        public string PriceToPay { get; set; }
    }
}