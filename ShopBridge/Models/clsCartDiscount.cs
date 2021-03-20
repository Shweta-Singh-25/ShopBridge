using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBridge.Models
{
    public class clsCartDiscount
    {
        public bool IsCartDiscountApplicable { get; set; }
        public string Discount { get; set; }
        public string BasketPriceMargin { get; set; }
        
    }
}