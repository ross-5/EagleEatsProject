using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EagleEatsProjectSpring2022
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                var Parameter = this.SqlDataSource1.InsertParameters;
                Parameter["UserName"].DefaultValue = TextBox1.Text;
                Parameter["Passwd"].DefaultValue = TextBox2.Text;
                Parameter["Address"].DefaultValue = TextBox3.Text;
                Parameter["ReviewScore"].DefaultValue = "0";

                try
                {
                    this.SqlDataSource1.Insert();//insert the new record to the db
                    ResetControls();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }
        private void ResetControls()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Response.Redirect("default.aspx");
        }
    }
}