using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;

public partial class SignUp : System.Web.UI.Page
{
    //clsUserProfileVO objUser;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_UserSignUp", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Uname", SqlDbType.VarChar, 50).Value = txtuname.Text.Trim();
        cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 50).Value = txtpwd.Text.Trim();
        cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = txtaddress.Text.Trim();
        cmd.Parameters.Add("@DOB", SqlDbType.Date).Value = DateTime.Parse(txtdob.Text.Trim(),CultureInfo.InvariantCulture);
        cmd.Parameters.Add("@SSN", SqlDbType.Int).Value = Convert.ToInt16(txtssn.Text);
        SqlParameter s = new SqlParameter("@Success", SqlDbType.Int) { Direction = ParameterDirection.Output };
        cmd.Parameters.Add(s);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd.ExecuteScalar();
        int ret_Success;
        ret_Success = 0;
        if(!(s.Value is DBNull))
        { ret_Success = Convert.ToInt32(s.Value); }
        if (ret_Success != 0)
        {
            Response.Redirect("/TellUs.aspx?uid=" + ret_Success.ToString());
        }
        else
        {
            string message = "UserName Already exists";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
    private void ClearFields()
    {
       
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Login.aspx");
    }
}