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

public partial class MultupleImgReg : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected string ImageCode { get; set; }

    [WebMethod]
    public static void SetImageCode(string imageCode)
    {
        ((MultupleImgReg)HttpContext.Current.Handler).ImageCode = imageCode;
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
        SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con1.Open();
        string updateQuery1 = "DELETE FROM Img_Auth;";
        SqlCommand cmd1 = new SqlCommand(updateQuery1, con1);
        cmd1.ExecuteNonQuery();

        con1.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
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
        con.Open();
        string insertQuery = "INSERT INTO UserTable (img_key) VALUES (@img_key)";
        cmd = new SqlCommand(insertQuery, con);
        cmd.Parameters.AddWithValue("@img_key", concatenatedKeys.ToString());
        int n = cmd.ExecuteNonQuery();

        if (n > 0)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Write("<script>alert('Check All Data');</script>");
        }
    }
}