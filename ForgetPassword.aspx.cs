using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        clsUserLoginBO objbo = new clsUserLoginBO();
        string result = "";
        string Error = "";
        result= objbo.GetPassword(txtEmail.Text, txtuname.Text, out Error);
        if (!string.IsNullOrWhiteSpace(result))
        {
            if (SendMail(txtuname.Text, result))
            {
                Response.Redirect("/forgetmail.aspx");
            }  
            else
            {

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Wrong User Name or Email');</script>", false);

        }
    }
    private bool SendMail(string UserName,string Password)
    {
        bool result;
        try
        {
            string subject = "Welcome";
            string Body = "";
            string filePath = Server.MapPath("mailcontent/Forget.html");
            using (System.IO.StreamReader reader = System.IO.File.OpenText(filePath))
            {
                Body = reader.ReadToEnd();
            }
            string message;
            message = Body;
            message = message.Replace("#UserName", UserName);
            message = message.Replace("#Password", Password);
            CommonClass objcommon = new CommonClass();
            string add = "";
            result = objcommon.SendForgetMail(txtEmail.Text , subject, message);

        }
        catch (Exception ex)
        {
            Response.Write("Could not send the e-mail - error: " + ex.Message);
            result = false;
        }
        return result;
    }
}