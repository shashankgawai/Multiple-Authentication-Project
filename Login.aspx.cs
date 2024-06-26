using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
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


            Response.Redirect("User/Dashboard.aspx?email=" + dr.GetString(2));
        }
        else
        {
            Response.Write("<script>alert('Invalid Email ID Or Password');</script>");
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         if(txtEmail.Text == "")
        {
            string script = @"<script>
                                Swal.fire({
                                  title: 'Opps...!',
                                  text: 'please enter Email!',
                                  icon: 'error'
                                });
                             </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, false);
        }
        else
          Response.Redirect("LoginUsingPattern.aspx?email=" + txtEmail.Text);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text == "")
        {
            string script = @"<script>
                                Swal.fire({
                                  title: 'Opps...!',
                                  text: 'please enter Email!',
                                  icon: 'error'
                                });
                             </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, false);
        }
        else
            Response.Redirect("LoginUsingImage.aspx?email=" + txtEmail.Text);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("FutureScope.aspx");
    }
}