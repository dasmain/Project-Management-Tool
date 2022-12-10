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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True; MultipleActiveResultSets=true");
        public string[] projectname;
        public string[] pdesc;
        public string username = null;
        public string pname;
        public bool admincheck = false;
        public string[] notitext;

        private void CheckAdmin()
        {
            con.Open();
            SqlCommand cmdforAdmin = new SqlCommand("select * from admin where username = '" + username + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmdforAdmin);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                admincheck = true;
            }
            con.Close();
        }

        private void Notifications()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec ShowNotis", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int rows = dt.Rows.Count;

            SqlDataReader dr = cmd.ExecuteReader();
            notitext = new string[rows];
            int m = 0;
            while (dr.Read())
            {
                notitext[m] = dr["NotificationText"].ToString();
                m++;
            }
            dr.Close();
            con.Close();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
            Button2.Text = username + " - Logout";
            CheckAdmin();
            Notifications();
            con.Open();
            SqlCommand cmd = new SqlCommand("select projectname, projectdescription from project inner join teams on project.projectid = teams.projectid inner join teammembers on teams.teamid = teammembers.teamid where username = '" + username + "'", con);
            //SqlCommand cmd = new SqlCommand("select projectname, projectdescription from project");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int rows = dt.Rows.Count;

            SqlDataReader dr = cmd.ExecuteReader();

            //dr.Read();

            projectname = new string[rows];
            pdesc = new string[rows];
            int i = 0;
            while (dr.Read())
            {
                projectname[i] = dr["ProjectName"].ToString();
                pdesc[i] = dr["ProjectDescription"].ToString();
                i++;
            }

        }

        protected void ProceedToPT(object sender, EventArgs e)
        {

            /*string pid = null;
            SqlCommand cmd = new SqlCommand("select projectid from project where projectname = '" + pname + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pid = dr["ProjectID"].ToString();
            }*/
            string url;
            url = "ProjectTasks.aspx?username=" +
                username;
            Response.Redirect(url);
        }

        protected void ProceedToCP(object sender, EventArgs e)
        {
            Response.Redirect("CreateProject.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string url;
            url = "Home.aspx?username=" +
                username;
            Response.Redirect(url);
        }
        protected void ToProjectTasks(object sender, EventArgs e)
        {
            string url;
            url = "ProjectTasks.aspx?username=" +
                username;
            Response.Redirect(url);
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

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageNotifications.aspx?username=" + username);
        }
    }
}