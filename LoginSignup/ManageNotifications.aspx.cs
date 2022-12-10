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
    public partial class ManageNotifications : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True; MultipleActiveResultSets=true");
        string username;

        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
        }

        protected void AddNotis(object sender, EventArgs e)
        {
            try
            {
                string pid;
                string notiT = NotiText.Text;
                if (ProjectID.Text == "" || ProjectID.Text == null)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into notifications values ('" + notiT + "', NULL", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                else
                {
                    pid = ProjectID.Text;

                    con.Open();
                    SqlCommand cmd = new SqlCommand("exec AddNotis " + pid + ",'" + notiT + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }


                //

                string url;
                url = "Home.aspx?username=" +
                    username;
                Response.Redirect(url);
            }
            catch
            {
                Label6.ForeColor = System.Drawing.Color.Red;
                Label6.Text = "Notification was not added. Try again.";
            }
        }
    }
}