using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFoodSystem
{
    public partial class DishDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Dish_Code, Dish_Name, Local_Name FROM DISH";
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

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string ID = Convert.ToString(GridView1.DataKeys[e.RowIndex].Values[0]);

            string DishName = (row.Cells[2].Controls[0] as TextBox).Text;

            string LocalName = (row.Cells[3].Controls[0] as TextBox).Text;
            
            string constr = ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString;

            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand("update dish set Dish_Name = '" + DishName + "', Local_Name = '" + LocalName + "' where Dish_Code = '" + ID + "'"))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = Convert.ToString(GridView1.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString;
            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand("DELETE FROM Dish WHERE Dish_Code = '" + ID + "'"))
                {

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }

        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void insertDish(object sender, EventArgs e)
        {
            string dish_code = dishCode.Value.ToString();
            string dish_name = dishName.Value.ToString();
            string local_name = localName.Value.ToString();
            string constr = ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString;
            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand(String.Format("INSERT INTO DISH VALUES ('{0}', '{1}', '{2}')", dish_code, dish_name, local_name)))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            dishCode.Value = "";
            dishName.Value = "";
            localName.Value = "";

            this.BindGrid();
        }
    }
}