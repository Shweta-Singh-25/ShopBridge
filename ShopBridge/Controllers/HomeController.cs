using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBridge.Models;
using System.Net.Http;

namespace ShopBridge.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            IEnumerable<clsProduct> prod = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("https://localhost:44370/api/");
            var data = hc.GetAsync("ProductAPI/getProducts");
            data.Wait();
            var dataread = data.Result;
            if (dataread.IsSuccessStatusCode)
            {
                var results = dataread.Content.ReadAsAsync<List<clsProduct>>();
                results.Wait();
                prod = results.Result;
            }
            return View(prod);
        }
        /// <summary>
        /// Adds Product to Cart
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="unitsAdded"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("AddToCart/{ID}/{unitsAdded}")]
        public string AddToCart(int ID, int unitsAdded)
        {
            HttpContent content = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("https://localhost:44370/api/");
            string uri = "ProductAPI/addProductToCart/?ID="+ID+"&unitsAdded="+unitsAdded;
            var data = hc.PostAsync(uri,content);
            data.Wait();
            var dataread = data.Result;
            return "success";
        }

        
        
    }
}
