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
    public partial class GroupChat : System.Web.UI.Page
    {
        public string username;
        string projectname;
        string groupid;
        public string[] sentby;
        public string[] messgtxt;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        private void GetGroupID()
        {
            con.Close();
            con.Open();
            SqlCommand forgid = new SqlCommand("select groupid from groups inner join project on groups.projectid = project.projectid where projectname = '" + projectname + "'", con);
            SqlDataAdapter da2 = new SqlDataAdapter(forgid);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            SqlDataReader dr2 = forgid.ExecuteReader();
            while (dr2.Read())
            {
                groupid = dr2["groupid"].ToString();
            }
            dr2.Close();
        }
       
        private void LoadMessages()
        {
            con.Close();
            con.Open();
            SqlCommand forgid = new SqlCommand("select * from chats where groupid = '" + groupid + "'", con);
            SqlDataAdapter da2 = new SqlDataAdapter(forgid);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            int rows = dt2.Rows.Count;
            SqlDataReader dr2 = forgid.ExecuteReader();
            sentby = new string[rows];
            messgtxt = new string[rows];
            int m = 0;
            while (dr2.Read())
            {
                sentby[m] = dr2["username"].ToString();
                messgtxt[m] = dr2["MessageText"].ToString();
                m++;
            }
            dr2.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"].ToString();
            projectname = Request.QueryString["projectname"].ToString();
            Button2.Text = username + " - Logout";
            GetGroupID();
            LoadMessages();
        }
        private void UpdateLoggedin()
        {
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("update loggedin set logged = '0' where username = '" + username + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateLoggedin();
            Response.Redirect("Login.aspx");
        }

        protected void AddMessage(object sender, EventArgs e)
        {
            string msgtxt = TextBox1.Text;
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("exec AddMessage '" + msgtxt + "', " + groupid + ",'" + username + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            LoadMessages();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string url;
            url = "ProjectTasks.aspx?username=" + username;
            Response.Redirect(url);
        }
    }
}