using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ShopBridge.Models;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace ShopBridge.Controllers
{
    
    public class CartAPIController : ApiController
    {
        
        public IHttpActionResult getCartProducts()
        {
            List<clsCart> cart = new List<clsCart>();
            try { 
            string dbconn = ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(dbconn);
            string sqlquery = "[GetCartProductDetails]";
            sqlconn.Open();
            SqlCommand sqlcmd = new SqlCommand(sqlquery, sqlconn);
            SqlDataReader sdr = sqlcmd.ExecuteReader();
            while (sdr.Read())
            {
                cart.Add(new clsCart()
                {
                    ID = Convert.ToInt32(sdr.GetValue(0)),
                    Product = sdr.GetValue(1).ToString(),
                    ProductDesc = sdr.GetValue(2).ToString(),
                    UnitsAdded= Convert.ToInt32(sdr.GetValue(3)),
                    IsDiscountApplicable = sdr.GetValue(4).ToString(),
                    OriginalPrice=sdr.GetValue(5).ToString(),
                    ProductDiscount=sdr.GetValue(6).ToString(),
                    PriceToPay=sdr.GetValue(7).ToString()
                    
                });
            }
            }
            catch (Exception e)
            {
                return Ok("Error" + e.Message);
            }
            return Ok(cart);
        }
        /// <summary>
        /// Check if Basket Discount applies and return Discount
        /// </summary>
        /// <returns></returns>
        
        public IHttpActionResult getCartDiscount()
        {
            List<clsCartDiscount> cartDiscount = new List<clsCartDiscount>();
            try { 
            string dbconn = ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(dbconn);
            string sqlquery = "[GetCartDiscount]";
            sqlconn.Open();
            SqlCommand sqlcmd = new SqlCommand(sqlquery, sqlconn);
            SqlDataReader sdr = sqlcmd.ExecuteReader();
            while (sdr.Read())
            {
                cartDiscount.Add(new clsCartDiscount()
                {
                    IsCartDiscountApplicable = sdr.GetBoolean(0),
                    Discount = sdr.GetValue(1).ToString(),
                    BasketPriceMargin = sdr.GetValue(2).ToString()

                });
            }
            }
            catch (Exception e)
            {
                return Ok("Error" + e.Message);
            }
            return Ok(cartDiscount);
        }

        /// <summary>
        /// Remove Products from Cart
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpPost]
        public IHttpActionResult removeProductFromCart(int ID)
        {
            try
            {
                string dbconn = ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(dbconn);
                string sqlquery = "[RemoveProductFromCart]";
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sqlquery, sqlconn);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Add(new SqlParameter("@ProductID", ID));
                
                SqlDataReader sdr = sqlcmd.ExecuteReader();
            }
            catch (Exception e)
            {
                return Ok("Error" + e.Message);
            }
            return Ok("success");
        }
    }
}
