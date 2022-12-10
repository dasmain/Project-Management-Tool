using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace LoginSignup
{
    public partial class Signup : System.Web.UI.Page
    {
        string username;
        private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        private void AddLogged()
        {
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into loggedin values('" + username + "', 0)", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed7_Click(object sender, EventArgs e)
        {
            try
            {


                username = Uname.Text;
                string fname = Fname.Text;
                string lname = Lname.Text;
                string mail = mailID.Text;
                string pasw = forPassword.Text;
                if (forPassword.Text != forConfirmPassword.Text)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "ERROR: Passwords do not match. Please retry.";
                    return;
                }

                con.Open();
                SqlCommand cmd = new SqlCommand("insert into users Values ('" + username + "','" + fname + "','" + lname + "','" + mail + "','" + pasw + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //if (true)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "ERROR: Signup Failed, please retry.";
            }
        }
    }
}