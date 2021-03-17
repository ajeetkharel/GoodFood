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
    public partial class CustomerDetails : System.Web.UI.Page
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
            cmd.CommandText = "SELECT Customer_ID, Customer_Name, Customer_Contact, Customer_Email, Total_Points FROM Customer";
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

            string CustomerName = (row.Cells[2].Controls[0] as TextBox).Text;

            string CustomerContact = (row.Cells[3].Controls[0] as TextBox).Text;

            string CustomerEmail = (row.Cells[4].Controls[0] as TextBox).Text;


            string constr = ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString;

            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand("update customer set customer_name = '" + CustomerName + "', Customer_Contact = '" + CustomerContact + "', Customer_Email = '" + CustomerEmail + "' where CustomerID = '" + ID + "'"))
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
                using (OracleCommand cmd = new OracleCommand("DELETE FROM Customer WHERE Customer_ID = '" + ID + "'"))
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

        protected void insertCustomer(object sender, EventArgs e)
        {
            string customer_name = customerName.Value.ToString();
            string customer_contact = customerContact.Value.ToString();
            string customer_email = customerEmail.Value.ToString();
            string customer_address = customerAddress.Value.ToString();
            string total_points = totalPoints.Value.ToString();
            string constr = ConfigurationManager.ConnectionStrings["GoodFoodConnectionString"].ConnectionString;
            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand(String.Format("INSERT INTO Customer VALUES ('{0}', '{1}', '{2}', '{3}', '{4}')", customerName, customerContact, customerEmail, customerAddress, totalPoints)))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            customerName.Value = "";
            customerContact.Value = "";
            customerEmail.Value = "";
            customerAddress.Value = "";
            totalPoints.Value = "";

            this.BindGrid();
        }
    }
}