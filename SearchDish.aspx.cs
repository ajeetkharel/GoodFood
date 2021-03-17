using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFoodSystem
{
    public partial class SearchDish : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridviewBind();
        }


        protected void GridviewBind()
        { 
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString);
            con.Open();
            cmd.Connection = con;

            string searched_dish = Request.QueryString["search"];

            cmd.CommandText = @"SELECT R.Restaurant_Name, R.Restaurant_Address, D.Dish_Name, RD.Dish_Rate 
                                FROM Restaurant R Join Restaurant_Dish RD on R.Restaurant_ID = RD.Restaurant_ID
                                Join Dish D on RD.Dish_Code = D.Dish_Code where D.Dish_Name = '" + searched_dish + "'";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("dish");

            using (OracleDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void searchDish(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchDish.aspx?search=" + something.Value.ToString());
        }
    }
}
