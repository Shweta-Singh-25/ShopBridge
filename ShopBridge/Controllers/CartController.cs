using ShopBridge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace ShopBridge.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            ViewBag.Title = "My Cart";
            IEnumerable<clsCart> cart = null;
            IEnumerable<clsCartDiscount> cartDiscount = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("https://localhost:44370/api/");
            string uri = "CartAPI/getCartProducts";
            var data = hc.GetAsync(uri);
            data.Wait();
            var dataread = data.Result;
            if (dataread.IsSuccessStatusCode)
            {
                var results = dataread.Content.ReadAsAsync<List<clsCart>>();
                results.Wait();
                cart = results.Result;
            }
            uri = "CartAPI/getCartDiscount";
            data = hc.GetAsync(uri);
            data.Wait();
            dataread = data.Result;
            if(dataread.IsSuccessStatusCode)
            {
                var result = dataread.Content.ReadAsAsync<List<clsCartDiscount>>();
                result.Wait();
                cartDiscount = result.Result;
            }
            ViewBag.CartDiscount= cartDiscount == null?0:(cartDiscount.Count() == 0 ?0: cartDiscount.Sum(y => Convert.ToDecimal(y.Discount)));
            ViewBag.GrandTotal = cart == null?0:(cart.Count()==0 ?0: cart.Sum(x => Convert.ToDecimal(x.PriceToPay)) - cartDiscount.Sum(y => Convert.ToDecimal(y.Discount)));
            return View(cart);
        }
        /// <summary>
        /// Removes Product from Cart
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("RemoveFromCart/{ID}")]
        public string RemoveFromCart(int ID)
        {
            HttpContent content = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("https://localhost:44370/api/");
            string uri = "CartAPI/removeProductFromCart/?ID=" + ID;
            var data = hc.PostAsync(uri, content);
            data.Wait();
            var dataread = data.Result;
            return "success";
        }
    }
}