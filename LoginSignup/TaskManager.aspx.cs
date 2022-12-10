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
    public partial class TaskManager : System.Web.UI.Page
    {
        string username = null;
        public string todo = null;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            username = Request.QueryString["username"];
            todo = Request.QueryString["todo"];
        }

        protected void AddTasks(object sender, EventArgs e)
        {
            try
            {
                string taskname = Tname.Text;
                string tstat = forSetStatus.SelectedValue;
                string projectid = Pid.Text;
                string uname = Uai.Text;
                string priority = SetPriority.SelectedValue;
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tasks values ('" + taskname + "','" + tstat + "','" + projectid + "','" + uname + "','" + priority + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();

                //

                string url;
                url = "ProjectTasks.aspx?username=" +
                    username;
                Response.Redirect(url);
            }
            catch
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "ERROR: Failed to add a new task, please try again.";
            }
        }

        protected void UpdateTasks(object sender, EventArgs e)
        {
            try
            {
                string tid = forTaskID.Text;
                string taskname = UpdateTName.Text;
                string tstat = forUpdateStatus.SelectedValue;
                string projectid = UpdatePid.Text;
                string uname = UpdateUai.Text;
                string priority = UpdatePriority.SelectedValue;
                con.Open();
                SqlCommand cmd = new SqlCommand("update tasks set taskname = '" + taskname + "', status = '" + tstat + "', projectid = '" + projectid + "', username = '" + uname + "', priority = '" + priority + "' where taskid = '" + tid + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                //

                string url;
                url = "ProjectTasks.aspx?username=" +
                    username;
                Response.Redirect(url);
            }
            catch
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "ERROR: Failed to add a new task, please try again.";
            }
        }

        protected void DeleteTask(object sender, EventArgs e)
        {
            string tid = TaskID.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tasks where taskid = '" + tid + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}