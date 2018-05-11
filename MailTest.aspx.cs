using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class MailTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSend_Click(object sender, EventArgs e)
    {
        string email, password, mailAddress, ToAddress, Subject="test subject", Message="test message";
        email = System.Configuration.ConfigurationManager.ConnectionStrings["EmailAddressSupport"].ToString();
        password = System.Configuration.ConfigurationManager.ConnectionStrings["EmailPassword"].ToString();
        mailAddress = System.Configuration.ConfigurationManager.ConnectionStrings["EmailDomain"].ToString();
        ToAddress = TxtEmailID.Text;


        SmtpClient ss = new SmtpClient();
        ss.Host = System.Configuration.ConfigurationManager.ConnectionStrings["EmailHost"].ToString(); //"smtpout.secureserver.net";
        ss.Port = System.Convert.ToInt32(System.Configuration.ConfigurationManager.ConnectionStrings["EmailSMTPPort"].ToString()); // 3535;  //  80, 3535, 25, 465 (SSL) , 20, 80
        ss.Timeout = 50000;
        ss.DeliveryMethod = SmtpDeliveryMethod.Network;
        ss.UseDefaultCredentials = false;
        ss.Credentials = new System.Net.NetworkCredential(email, password);

        MailMessage mailMsg = new MailMessage(email, ToAddress, Subject, Message);

        MailAddress copy1 = new MailAddress(System.Configuration.ConfigurationManager.ConnectionStrings["BCCAdd1"].ToString());
        MailAddress copy2 = new MailAddress(System.Configuration.ConfigurationManager.ConnectionStrings["BCCAdd2"].ToString());
        mailMsg.Bcc.Add(copy1);
        mailMsg.Bcc.Add(copy2);

        mailMsg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
        mailMsg.IsBodyHtml = true;

        ss.Send(mailMsg);
    }
}