using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFoodSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Console.WriteLine("Searching for dish");

        }

        protected void searchDish(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchDish.aspx?search=" + something.Value.ToString());
        }
    }
}