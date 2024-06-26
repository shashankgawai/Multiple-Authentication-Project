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

public partial class Registration : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected string ImageCode { get; set; }

    [WebMethod]
    public static void SetImageCode(string imageCode)
    {
        ((Registration)HttpContext.Current.Handler).ImageCode = imageCode;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string pattern = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        string insertQuery = "select pattern from TempPattern";
        SqlCommand cmd = new SqlCommand(insertQuery, con);
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            pattern = dr.GetString(0);
        }
        con.Close();

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
        insertQuery = @"INSERT INTO UserTable (name,email,mobile,aadhar,password,pattern,img_key,question,answer) 
                    VALUES (@name,@email,@mobile,@aadhar,@password,@pattern,@img_key,@question,@answer)";
        cmd = new SqlCommand(insertQuery, con);
        cmd.Parameters.AddWithValue("@name", txtName.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@mobile", txtMobileNumber.Text);
        cmd.Parameters.AddWithValue("@aadhar", txtAadharCard.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        cmd.Parameters.AddWithValue("@pattern", pattern);
        cmd.Parameters.AddWithValue("@img_key", concatenatedKeys.ToString());
        cmd.Parameters.AddWithValue("@question", ddlquestion.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@answer", txtanswer.Text);
        cmd.Connection = con;
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