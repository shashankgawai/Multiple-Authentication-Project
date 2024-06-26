using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Dashboard : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        con.Open();
        cmd.CommandText = @"Select * From UserTable Where email=@email";
        cmd.Parameters.AddWithValue("@email", Request.QueryString["email"]);
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string name = dr.GetString(1).ToString();
            string email = dr.GetString(2).ToString();
            string aadhaar = dr.GetString(4).ToString();
            string mobile = dr.GetString(3).ToString();

            lblname.Text = name;
            lblemail.Text = email;
            lblmobile.Text = mobile;
            lblaadhaar.Text = aadhaar;
        }
        dr.Close();
        con.Close();
    }
}