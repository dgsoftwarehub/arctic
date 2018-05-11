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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_LoginCheck", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = txtEmail.Text.Trim();
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = txtPwd.Text.Trim();
        SqlParameter s = new SqlParameter("@Status", SqlDbType.Int) { Direction = ParameterDirection.Output };
        cmd.Parameters.Add(s);
        SqlParameter UserID = new SqlParameter("@userID", SqlDbType.Int) { Direction = ParameterDirection.Output };
        cmd.Parameters.Add(UserID);
        SqlParameter IsAdmin = new SqlParameter("@isAdmin", SqlDbType.VarChar,1) { Direction = ParameterDirection.Output };
        cmd.Parameters.Add(IsAdmin);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd.ExecuteScalar();
        int ret_Success;
        string isadmin = "";
        ret_Success = 0;
        if (!(s.Value is DBNull))
        {
            ret_Success = Convert.ToInt32(s.Value);
            if (ret_Success == 1)
            {
                Session["LoggedInUserID"] = UserID.Value.ToString();
                HttpCookie Uid = new HttpCookie("Uid");
                Uid["UserName"] = txtEmail.Text.Trim();
                Uid.Expires.Add(new TimeSpan(0, 1, 0));
                Response.Cookies.Add(Uid);
                if (!(IsAdmin.Value is DBNull)) {
                    Session["isAdmin"] = IsAdmin.Value.ToString();
                    isadmin = IsAdmin.Value.ToString();
                }
                if (isadmin == "0")
                {
                    Response.Redirect("/Default.aspx");
                }
                else
                {
                    Response.Redirect("~/Admin/Admin.aspx");
                }
            }
            else
            {
                string message = "Login failed";
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
    }
    //protected void btnLogin_Click(object sender, EventArgs e)
    //{        
    //    int Usid=0;
    //    bool IsAdmin = false;
    //    string amt="";
    //    clsUserLoginBO objLoginDBo = new clsUserLoginBO();
    //   if(! objLoginDBo.IsLoginExist(txtEmail.Text, txtPwd.Text,out Usid,out IsAdmin ))
    //    {
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Wrong User or Password');</script>", false);
    //    }
    //    else
    //    {
    //        Response.Cookies["UId"].Value = Convert.ToString(Usid);
    //        Response.Cookies["uname"].Value = Convert.ToString(txtEmail.Text);
    //        //HttpCookie cookie = new HttpCookie("Credentials");
    //        //cookie.Values.Add("UId", Convert.ToString(Usid));// your x value


    //        if (IsAdmin)
    //        {
    //            Response.Redirect("Admin/AdminHome.aspx");
    //        }
    //        else
    //        {
    //            //if (!string.IsNullOrWhiteSpace(Request.QueryString["amount"].ToString()))
    //            //{
    //            //  amt  = Request.QueryString["amount"].ToString();
                   
    //                Response.Redirect("User/Wallet.aspx");
    //           // }
    //           //else
    //           // {
    //           //     Response.Redirect("User/Wallet.aspx?amount=" + amt);
    //           // }
    //        }
    //    }
    //}
}