using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EagleEatsProjectSpring2022
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = TextBox1.Text;
            string password = TextBox2.Text;
            int currentId;
            string connectionstring = ConfigurationManager.ConnectionStrings["EagleEatsDBConnectionString"].ConnectionString;
            string query = "SELECT [User_Id], [UserName], [Passwd] FROM [User] WHERE (([UserName] = @UserName) AND ([Passwd] = @Passwd))";
            using(var conn = new SqlConnection(connectionstring))
            {
                var cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@Passwd", password);
                try
                {
                    conn.Open();
                    using(var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        if(reader.HasRows)
                        { 
                            if(reader.Read())
                            {
                                currentId = (int)reader["User_Id"];
                                Session["U_Id"] = currentId.ToString();
                                Response.Redirect("PlaceOrder.aspx");
                            }
                        }
                        else
                        {
                            TextBox3.Text = "Login failed, try again.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    TextBox3.Text = "Login failed, try again.";
                }
            }
        }
    }
}