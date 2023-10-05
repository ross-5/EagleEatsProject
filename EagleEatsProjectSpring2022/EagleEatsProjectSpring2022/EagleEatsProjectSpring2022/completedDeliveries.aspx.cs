using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EagleEatsProjectSpring2022
{
    public partial class completedDeliveries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();
        }
    }
}