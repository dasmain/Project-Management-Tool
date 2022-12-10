using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


namespace LoginSignup
{
    public partial class Project_Tasks : System.Web.UI.Page
    {
        string username = null;
        string todo = null;
        public string[] projectname;
        public string[] taskname;
        public string[] taskid;
        public string[] tuname;
        public string[] priority;
        string selected = null;
        public string[] showstat;
        public bool isPM = false;
        public bool admincheck = false;
        public string[] notitext;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        private void SetDropDown()
        {

            if (!this.IsPostBack)
            {
                ArrayList customers = new ArrayList();

                for (int i = 0; i < projectname.Length; i++)
                {
                    customers.Add(projectname[i]);
                }

                //Add blank item at index 0.
                DropDownList1.Items.Insert(0, new ListItem("Select Project", "Select Project"));
                //Loop and add items from ArrayList.
                foreach (object customer in customers)
                {
                    DropDownList1.Items.Add(new ListItem(customer.ToString(), customer.ToString()));
                }
            }

        }
        private void ShowTasks()
        {
            selected = DropDownList1.SelectedValue;
            SqlCommand cmd2 = new SqlCommand("select * from tasks inner join project on project.projectid = tasks.ProjectID where projectname = '" + selected + "'", con);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            int rows2 = dt2.Rows.Count;
            SqlDataReader dr2 = cmd2.ExecuteReader();
            taskname = new string[rows2];
            taskid = new string[rows2];
            tuname = new string[rows2];
            showstat = new string[rows2];
            priority = new string[rows2];
            int j = 0;
            while (dr2.Read())
            {
                taskname[j] = dr2["taskname"].ToString();
                taskid[j] = dr2["taskid"].ToString();
                tuname[j] = dr2["username"].ToString();
                showstat[j] = dr2["status"].ToString();
                priority[j] = dr2["priority"].ToString();
                j++;
            }
            dr2.Close();
        }
        private void Notifications()
        {
            string forSelect = DropDownList1.SelectedValue;
            string proid = "NULL";
            con.Close();
            con.Open();
            SqlCommand forpid = new SqlCommand("select projectid from project where projectname = '" + forSelect + "'", con);
            SqlDataAdapter da2 = new SqlDataAdapter(forpid);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            SqlDataReader dr2 = forpid.ExecuteReader();
            while (dr2.Read())
            {
                proid = dr2["projectid"].ToString();
            }
            dr2.Close();
            SqlCommand cmd = new SqlCommand("exec ShowNotisProject " + proid, con);
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

        }
        private void ShowProjects()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select projectname, projectdescription from project inner join teams on project.projectid = teams.projectid inner join teammembers on teams.teamid = TeamMembers.teamid where username = '" + username + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int rows = dt.Rows.Count;
            SqlDataReader dr = cmd.ExecuteReader();

            projectname = new string[rows];
            int i = 0;
            while (dr.Read())
            {
                projectname[i] = dr["ProjectName"].ToString();
                i++;
            }
            dr.Close();
        }
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

        private void CheckPM()
        {
            con.Close();
            con.Open();
            SqlCommand cmdforPM = new SqlCommand("select * from projectmanager inner join project on projectmanager.projectid = project.projectid where username = '" + username + "' and projectname = '" + selected + "'", con);
            cmdforPM.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmdforPM);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                isPM = true;
            }
            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
            Button2.Text = username + " - Logout";

            CheckAdmin();
            ShowProjects();
            ShowTasks();
            SetDropDown();
            Notifications();
        }

        protected void SetValue(object sender, EventArgs e)
        {
            ShowTasks();
            Notifications();
            CheckPM();

        }
        protected void BackToHome(object sender, EventArgs e)
        {
            string url;
            url = "Home.aspx?username=" +
                username;
            Response.Redirect(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            todo = "addtask";
            string url;
            url = "TaskManager.aspx?username=" +
                username + "&todo=" + todo;
            Response.Redirect(url);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            todo = "deletetask";
            string url;
            url = "TaskManager.aspx?username=" +
                username + "&todo=" + todo;
            Response.Redirect(url);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            todo = "updatetask";
            string url;
            url = "TaskManager.aspx?username=" +
                username + "&todo=" + todo;
            Response.Redirect(url);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string url;
            url = "ManageMembers.aspx?username=" + username + "&projectname=" + selected;
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

        protected void GoToChats(object sender, EventArgs e)
        {
            string url;
            url = "GroupChat.aspx?username=" + username + "&projectname=" + selected;
            Response.Redirect(url);
        }
    }
}