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
    public partial class CreateProject : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5BPJHU0\SQLEXPRESS;Initial Catalog=PMTool;Integrated Security=True");
        string projectname = null;
        string pdescription = null;
        string projectcode = null;
        string manager = null;
        string pid = null;
        string tid = null;

        private void AddGroup()
        {
            con.Close();
            con.Open();
            SqlCommand forgroup = new SqlCommand("insert into groups values ('" + pid + "')", con);
            forgroup.ExecuteNonQuery();
            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed7_Click(object sender, EventArgs e)
        {
            projectname = Pname.Text;
            pdescription = PDesc.Text;
            projectcode = PCode.Text;
            manager = Upm.Text;

            con.Open();
            SqlCommand cmd = new SqlCommand("insert into project Values ('" + projectname + "','" + pdescription + "','" + projectcode + "', 0)", con);
            cmd.ExecuteNonQuery();
            SqlCommand cmd3 = new SqlCommand("select projectid from project where projectname = '" + projectname + "'", con);
            SqlDataReader dr = cmd3.ExecuteReader();
            while (dr.Read())
            {
                pid = dr["projectid"].ToString();
            }
            dr.Close();
            SqlCommand cmd2 = new SqlCommand("insert into projectmanager values ('" + pid + "','" + manager + "')", con);
            cmd2.ExecuteNonQuery();
            AddIntoTeam();
            AddGroup();
            con.Close();

        }
        private void AddIntoTeam()
        {
            con.Close();
            con.Open();
            SqlCommand inteam = new SqlCommand("insert into teams values ('" + pid + "')", con);
            inteam.ExecuteNonQuery();
            SqlCommand forteamid = new SqlCommand("select teamid from teams where projectid = '" + pid + "'", con);
            SqlDataReader dataread = forteamid.ExecuteReader();
            while (dataread.Read())
            {
                tid = dataread["teamid"].ToString();
            }
            dataread.Close();
            SqlCommand inteammem = new SqlCommand("insert into teammembers values('" + manager + "', '" + tid + "')", con);
            inteammem.ExecuteNonQuery();
        }
    }
}