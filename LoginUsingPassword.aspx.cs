using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finexo_html_LoginUsingPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnliogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        string insertQuery = "select * from UserTable where email=@email and password=@pwd";

        SqlCommand cmd = new SqlCommand(insertQuery, con);

        cmd.Parameters.AddWithValue("email", txtEmail.Text);
        cmd.Parameters.AddWithValue("pwd", txtpassword.Text);
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            Response.Redirect("Default.aspx?name=" + dr.GetString(1));
        }
        else
        {
            Response.Write("<script>alert('Invalid Email ID Or Password');</script>");
        }
        con.Close();
    }
}