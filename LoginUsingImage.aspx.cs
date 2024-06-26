using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.Text;

public partial class LoginUsingImage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected string ImageCode { get; set; }

    [WebMethod]
    public static dynamic SetImageCode(string imageCode)
    {
        var page = (LoginUsingImage)HttpContext.Current.Handler;
        ((LoginUsingImage)HttpContext.Current.Handler).ImageCode = imageCode;

        string email = "";
        using (var con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]))
        {
            con1.Open();
            using (var cmd1 = new SqlCommand("SELECT email FROM TempEmail", con1))
            {
                using (var dr = cmd1.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        email = dr.GetString(0);
                    }
                }
            }
        }

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

        using (var con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]))
        {
            con1.Open();
            using (var cmd1 = new SqlCommand("SELECT img_key FROM UserTable WHERE img_key=@ik AND email=@email", con1))
            {
                cmd1.Parameters.AddWithValue("@ik", concatenatedKeys.ToString());
                cmd1.Parameters.AddWithValue("@email", email);
                using (var dr1 = cmd1.ExecuteReader())
                {
                    if (dr1.Read())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con1.Open();
        string updateQuery1 = "DELETE FROM Img_Auth;";
        SqlCommand cmd1 = new SqlCommand(updateQuery1, con1);
        cmd1.ExecuteNonQuery();

        con1.Close();

        if (!IsPostBack)
        {
            txtemail.Text = Request.QueryString["email"];
            using (var con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]))
            {
                con.Open();
                using (var cmd = new SqlCommand("UPDATE TempEmail SET email = @email", con))
                {
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}