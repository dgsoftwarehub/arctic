using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    private bool ValidateControls() { 
        if(txt_FullName.Text.Length<=3){
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter Name');</script>");
            return false;
        }
        if(txt_Subject.Text.Length<=5){
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter Subject');</script>");
        return false;
        }
        if (txt_Message.Text.Length <= 10)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter Proper Message');</script>");
            return false;
        }
        return true;
    }
    protected void btn_SendMessage_Click(object sender, EventArgs e)
    {
        if (ValidateControls() == false) {
            return;
        }
    }
}