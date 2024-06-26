using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

public partial class LoginUsingPattern : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtemail.Text = Request.QueryString["email"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            string qry = "update TempEmail set  email = '" + txtemail.Text + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            int n = cmd.ExecuteNonQuery();
        }
    }

    [WebMethod()]
    public static dynamic ValidLogin(string password)
    {

        LoginUsingPattern l1 = new LoginUsingPattern();

        try
        {


            string email = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            string insertQuery = "select email from TempEmail";
            SqlCommand cmd = new SqlCommand(insertQuery, con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                email = dr.GetString(0);
            }
            con.Close();


            con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            string qry = "select * from UserTable where pattern='" + password + "' and email='" + email + "'";
            cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }
        catch (Exception er)
        {
            return false;
        }



    }
}