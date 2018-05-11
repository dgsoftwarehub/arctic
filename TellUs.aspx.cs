using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.IO;

public partial class TellUs : System.Web.UI.Page
{
    clsUserProfileVO objUser = new clsUserProfileVO();
    string toaddress;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //   if( Request.Cookies["UId"]==null)
        //    {
        //        Response.Redirect("/Default.aspx");
        //    }

        //}

    }

    protected void btncont_Click(object sender, EventArgs e)
    {
        //Response.Redirect("/thanks.aspx");
        if (FileUpload1.HasFile)
        {

        
        string userID = Request.QueryString["uid"]; 
       
        System.IO.FileInfo fi = new System.IO.FileInfo(FileUpload1.FileName);
        string ext = fi.Extension;
        FileUpload1.SaveAs(Server.MapPath("~/Images/userproofs/") + userID + ext);
        string imagePath = Server.MapPath("~") + "Images\\userproofs\\" + userID + ".jpg";


        toaddress = txtemail.Text.Trim();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_UpdateSignUpAfterTellUS", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@FullName", SqlDbType.VarChar, 100).Value = txtusername.Text.Trim();
        cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = toaddress;
        cmd.Parameters.Add("@Uid", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["uid"]);
        cmd.Parameters.Add("@imagePath", SqlDbType.NVarChar, 100).Value = "";
        cmd.Parameters.Add("@FileName", SqlDbType.VarChar, 100).Value = "";
        SqlParameter s = new SqlParameter("@Success", SqlDbType.Int) { Direction = ParameterDirection.Output };
        cmd.Parameters.Add(s);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd.ExecuteScalar();
        int ret_Success;
        ret_Success = 0;
        if (!(s.Value is DBNull))
        { ret_Success = Convert.ToInt32(s.Value); }
        if (ret_Success != 0)
        {
            //string message = File.ReadAllText("../MailContent/SignUp.HTML");
            SendMail(toaddress, "Thanks For Signing Up to Arctic Cash", "Hello User");
            Response.Cookies["username"].Value = txtusername.Text;
            Response.Redirect("/thanks.aspx?usname= " + txtusername.Text.Trim());
        }
        else
        {
            string message = "Email Already exists";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        //string Error = "";
        //if (SaveData( out Error) == 0)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('" + Error + "');</script>", false);

        //}
        //else
        //{
        //    SendMail();
        //    Response.Cookies["username"].Value = txtusername.Text;
        //    Response.Redirect("/thanks.aspx?usname= " + txtusername.Text);
        //}
        }
    }
    //private int SaveData( out string Error)
    //{
    //    SyncData();
    //    int result = 0;
    //    clsUserProfileBO objUserBo = new clsUserProfileBO();
    //    result = objUserBo.UpdateTellus(objUser, out Error);
    //    return result;
    //}
    //private void SyncData()
    //{

    //    objUser.FirstName = txtusername.Text;
    //    objUser.Email = txtemail.Text;       
    //    objUser.UId = Request.QueryString["usid"];
    //}
    public bool SendMail(string ToAddress, string Subject, string Message)
    {
        try
        {
            string email, password, mailAddress;
            email = System.Configuration.ConfigurationManager.ConnectionStrings["EmailAddressSupport"].ToString();
            password = System.Configuration.ConfigurationManager.ConnectionStrings["EmailPassword"].ToString();
            mailAddress = System.Configuration.ConfigurationManager.ConnectionStrings["EmailDomain"].ToString();
            //Message = File.ReadAllText("~/MailContent/SignUp.HTML");

            SmtpClient ss = new SmtpClient();
            ss.Host = System.Configuration.ConfigurationManager.ConnectionStrings["EmailHost"].ToString(); //"smtpout.secureserver.net";
            ss.Port = System.Convert.ToInt32(System.Configuration.ConfigurationManager.ConnectionStrings["EmailSMTPPort"].ToString()); // 3535;  //  80, 3535, 25, 465 (SSL) , 20, 80
            ss.Timeout = 50000;
            ss.DeliveryMethod = SmtpDeliveryMethod.Network;
            ss.UseDefaultCredentials = false;
            ss.Credentials = new System.Net.NetworkCredential(email, password);

            MailMessage mailMsg = new MailMessage(email, ToAddress, Subject, "<html><head><title></title></head><body>Welcome to Arctic<br/><br/>We're so happy you're here. Thanks for signing up to keep in touch with Arctic.<br/>We are processing your order.<br/><br/>Cheers,<br/>Arctic</body></html>");

            MailAddress copy1 = new MailAddress(System.Configuration.ConfigurationManager.ConnectionStrings["BCCAdd1"].ToString());
            MailAddress copy2 = new MailAddress(System.Configuration.ConfigurationManager.ConnectionStrings["BCCAdd2"].ToString());
            mailMsg.Bcc.Add(copy1);
            mailMsg.Bcc.Add(copy2);

            mailMsg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            mailMsg.IsBodyHtml = true;

            ss.Send(mailMsg);
            //new-------------------------------------------------------------------------------------------------------------- -


            //---------------------------------------------

            return true;
        }
        catch (Exception err)
        {
            Console.Write(err.ToString());
            return false;
        }

    }
    //private bool SendMail()
    //{
    //    bool result;
    //    try
    //    {
    //        string subject = "Welcome";
    //        string Body = "";
    //        string filePath = Server.MapPath("mailcontent/SignUp.html");
    //        using (System.IO.StreamReader reader = System.IO.File.OpenText(filePath))
    //        {
    //            Body = reader.ReadToEnd();
    //        }

    //        CommonClass objcommon = new CommonClass();
    //        string add = "";
    //        result = objcommon.SendMail(add, subject, Body);

    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("Could not send the e-mail - error: " + ex.Message);
    //        result = false;
    //    }
    //    return result;
    //}
}