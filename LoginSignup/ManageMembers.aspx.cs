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
    public partial class ManageMembers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        string pmanager;
        bool allow = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void CheckforManager(string projectid)
        {
            con.Open();
            SqlCommand checkm = new SqlCommand("select pmid from projectmanager where projectid = '" + projectid + "' and username = '" + pmanager + "'", con);
            checkm.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(checkm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                allow = true;
            }
            con.Close();
        }
        protected void AddMembers(object sender, EventArgs e)
        {
            pmanager = Request.QueryString["username"];
            string setuname = Uname.Text;
            string projectid = Pid.Text;
            string tid = null;
            CheckforManager(projectid);
            if (allow)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select teamid from teams where projectid = '" + projectid + "'", con);
                SqlDataReader dataread = cmd.ExecuteReader();
                while (dataread.Read())
                {
                    tid = dataread["teamid"].ToString();
                }
                dataread.Close();
                SqlCommand forMemInsert = new SqlCommand("insert into teammembers values ('" + setuname + "','" + tid + "')", con);
                forMemInsert.ExecuteNonQuery();
                con.Close();


                //

                string url;
                url = "ProjectTasks.aspx?username=" +
                    pmanager;
                Response.Redirect(url);
            }
            else
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "You are not the project manager.";
            }

        }
        protected void DeleteMembers(object sender, EventArgs e)
        {
            try
            {

                string setuname = Uname.Text;
                SqlCommand forMemDelete = new SqlCommand("delete from teammembers where username = '" + setuname + "'", con);
                forMemDelete.ExecuteNonQuery();
                con.Close();

                //

                string url;
                url = "ProjectTasks.aspx?username=" +
                    pmanager;
                Response.Redirect(url);
            }
            catch
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "You are not the project manager.";
            }
        }
    }
}