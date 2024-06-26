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

public partial class ForgetImage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected string ImageCode { get; set; }

    [WebMethod]
    public static void SetImageCode(string imageCode)
    {
        ((ForgetImage)HttpContext.Current.Handler).ImageCode = imageCode;
        SqlConnection con;
        SqlCommand cmd;
        con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        con.Open();
        cmd.CommandText = "SELECT COUNT(*) AS row_count FROM Img_Auth";
        cmd.Connection = con;
        Object obj = cmd.ExecuteScalar();
        string rowcount = obj.ToString();

        if (Convert.ToInt32(rowcount) < 3)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con1.Open();
            string updateQuery1 = "Insert Into Img_Auth (img_key) Values (@img)";
            SqlCommand cmd1 = new SqlCommand(updateQuery1, con1);
            cmd1.Parameters.AddWithValue("@img", imageCode);
            cmd1.ExecuteNonQuery();

            con1.Close();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con1.Open();
            string updateQuery1 = "DELETE FROM Img_Auth;";
            SqlCommand cmd1 = new SqlCommand(updateQuery1, con1);
            cmd1.ExecuteNonQuery();

            con1.Close();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        StringBuilder concatenatedKeys = new StringBuilder();
        con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        con.Open();
        cmd.CommandText = "SELECT img_key FROM Img_Auth";
        cmd.Connection = con;

        using (SqlDataReader dr1 = cmd.ExecuteReader())
        {
            while (dr1.Read())
            {
                concatenatedKeys.Append(dr1.GetString(0));
            }
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
            cmd1.CommandText = "Update UserTable Set img_key=@img_key Where email=@email";
            cmd1.Parameters.AddWithValue("@img_key", concatenatedKeys.ToString());
            cmd1.Parameters.AddWithValue("@email", dr.GetString(0).ToString());
            cmd1.Connection = con1;
            int n = cmd1.ExecuteNonQuery();
            if (n > 0)
            {
                string script = @"<script>
                                Swal.fire({
                                  title: 'Image Password Change Successfully!',
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