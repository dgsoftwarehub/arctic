using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Thanks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Response.Cookies["UId"] != null)
            //{
            //    int uid = Convert.ToInt16(Response.Cookies["UId"].Value);
            //    string uname;
            //    clsUserLoginBO bo = new clsUserLoginBO();
            //    bo.SelectUser(uid, out uname);
               //lbl.Text = Request.Cookies["username"].Value;

            lbl.Text= Request.QueryString["usname"];

            //}
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("/login.aspx");
    }
}