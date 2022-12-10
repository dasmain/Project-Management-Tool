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
    public partial class Login : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        public string username;
        public string password;
        private void UpdateLoggedin()
        {
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("update loggedin set logged = '1' where username = '" + username + "'" , con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        private bool CheckLogin()
        {
            username = Uname2.Text;
            bool returnlog = false;
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("select logged from loggedin where username = '" + username + "'", con);

            SqlDataReader dr = cmd.ExecuteReader();

            //dr.Read();
            while (dr.Read())
            {
                 if(dr["logged"].ToString().Equals("1"))
                {
                    returnlog = true;
                }
                 else if (dr["logged"].ToString().Equals("0"))
                {
                    returnlog = false;
                }
            }
            dr.Close();
            con.Close();
            return returnlog;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserLogin(object sender, EventArgs e)
        {
            username = Uname2.Text;
            password = forPassword2.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from users where Username = @username and Password = @password", con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (CheckLogin() == false)
                {
                    UpdateLoggedin();
                    string url;
                    url = "Home.aspx?username=" +
                        username;
                    Response.Redirect(url);
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "USER IS LOGGED IN ALREADY. PLEASE TRY AGAIN LATER.";
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
            }
        }
    }
}