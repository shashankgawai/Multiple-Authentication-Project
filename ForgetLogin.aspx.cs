using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ForgetLogin : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        con.Open();
        cmd.CommandText = @"Select email From UserTable Where 
                    email=@email And question=@que And answer=@ans";
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@que", ddlquestion.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@ans", txtanswer.Text);
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            SqlConnection con1;
            SqlCommand cmd1;
            con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            cmd1 = new SqlCommand();
            con1.Open();
            cmd1.CommandText = "Update UserTable Set password=@pass Where email=@email";
            cmd1.Parameters.AddWithValue("@pass", txtpassword.Text);
            cmd1.Parameters.AddWithValue("@email", dr.GetString(0).ToString());
            cmd1.Connection = con1;
            int n = cmd1.ExecuteNonQuery();
            if (n > 0)
            {
                string script = @"<script>
                                Swal.fire({
                                  title: 'Password Change Successfully!',
                                  text: 'Click Ok to Continue!',
                                  icon: 'success'
                                });
                             </script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, false);
            }
        }
        else
        {
            string script = @"<script>
                                Swal.fire({
                                  title: 'Please Enter the valid Answer or email!',
                                  text: 'Click Ok to Continue!',
                                  icon: 'error'
                                });
                             </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, false);
        }

    }
}