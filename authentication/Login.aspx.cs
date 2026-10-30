using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem.autentication
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupLinkId_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Login where email=@email and password=@password";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@email", emailTextBox.Text);
                cmd.Parameters.AddWithValue("@password", passwordTextBox.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        int id = isItAdmin(Convert.ToInt32(dr[0]));
                        if (0 < id)
                        {
                            Session["email"] = emailTextBox.Text;
                            Session["adminId"] = id;
                            Response.Redirect("../Pages/AdminPage.aspx");
                        }
                        else
                        {
                            loginUser(Convert.ToInt32(dr[0]));
                        }
                    }
                }
                else
                {
                    string fun = "alert";
                    string mess = "alert('Invalid credentials.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), fun, mess, true);
                }

            }
        }

        private void loginUser(int lgi)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from [User] where login_id=@lgi";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@lgi", lgi);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        Session["userId"] = Convert.ToString(dr[0]);
                        Response.Redirect("../default.aspx");
                    }
                }
            }
        }

        private int isItAdmin(int lgi)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Admin where login_id=@lgi";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@lgi", lgi);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                        return Convert.ToInt32(dr[0]);
                }
            }
            return -1;
        }
    }
}