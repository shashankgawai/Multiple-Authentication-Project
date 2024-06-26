using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;

public partial class ForgetPattern : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod()]
    public static dynamic ValidLogin(string password)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        string qry = "update TempPattern set  pattern = '" + password + "'";
        SqlCommand cmd = new SqlCommand(qry, con);
        int n = cmd.ExecuteNonQuery();

        if (n > 0)
            return true;
        else
            return true;
    }



    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string pattern = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        string insertQuery = "select pattern from TempPattern";
        SqlCommand cmd = new SqlCommand(insertQuery, con);
        cmd.Connection = con;
        SqlDataReader dr1 = cmd.ExecuteReader();

        if (dr1.Read())
        {
            pattern = dr1.GetString(0);
        }
        con.Close();

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
            cmd1.CommandText = "Update UserTable Set pattern=@pattern Where email=@email";
            cmd1.Parameters.AddWithValue("@pattern", pattern);
            cmd1.Parameters.AddWithValue("@email", dr.GetString(0).ToString());
            cmd1.Connection = con1;
            int n = cmd1.ExecuteNonQuery();
            if (n > 0)
            {
                string script = @"<script>
                                Swal.fire({
                                  title: 'Pattern Change Successfully!',
                                  text: 'Click Ok to Continue!',
                                  icon: 'success'
                                });
                             </script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, false);
            }
            con1.Close();
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
        con.Close();
    }
}