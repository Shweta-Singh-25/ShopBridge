using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBridge.Models
{
    public class clsProduct
    {
        public int ID { get; set; }
        public string Product { get; set; }
        public string ProductDesc { get; set; }
        public string ProductStatus { get; set; }
    }
}