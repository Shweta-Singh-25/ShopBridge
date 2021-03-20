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
    public class ProductAPIController : ApiController
    {
        public IHttpActionResult getProducts()
        {
            
                List<clsProduct> prod = new List<clsProduct>();
            try
            {
                string dbconn = ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(dbconn);
                string sqlquery = "[GetAllProductDetails]";
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sqlquery, sqlconn);
                SqlDataReader sdr = sqlcmd.ExecuteReader();
                while (sdr.Read())
                {
                    prod.Add(new clsProduct()
                    {
                        ID = Convert.ToInt32(sdr.GetValue(0)),
                        Product = sdr.GetValue(1).ToString(),
                        ProductDesc = sdr.GetValue(2).ToString(),
                        ProductStatus = sdr.GetValue(3).ToString()
                    });
                }
            }
            catch (Exception e)
            {
                return Ok("Error" + e.Message);
            }
            return Ok(prod);
        }
        /// <summary>
        /// Add Products to Cart
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="unitsAdded"></param>
        /// <returns></returns>
        [HttpPost]
        public IHttpActionResult addProductToCart([FromUri] clsParameter contents)
        {
            try
            {
                string dbconn = ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(dbconn);
                string sqlquery = "[AddProductToCart]";
                sqlconn.Open();
                SqlCommand sqlcmd = new SqlCommand(sqlquery, sqlconn);
                sqlcmd.CommandType = CommandType.StoredProcedure;

                sqlcmd.Parameters.Add(new SqlParameter("@ProductID", contents.ID));
                sqlcmd.Parameters.Add(new SqlParameter("@UnitsAdded", contents.unitsAdded));
                SqlDataReader sdr = sqlcmd.ExecuteReader();
            }
            catch(Exception e)
            {
                return Ok("Error"+e.Message);
            }
            return Ok("success");
        }
    }
}
