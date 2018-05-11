using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WalletAddress : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try
            {
                lbl_Card.Text = Session["CardNumber"].ToString();
                WalletID.Text = Session["WalletID"].ToString();
                lbl_CCAmt.Text = Session["AmtInCC"].ToString();
                lbl_AmountinUSD.Text = Session["AmtTotalInUSD"].ToString();
                //if (Request.Cookies["PaymentMethod"] != null && Request.Cookies["Default"] != null)
                //{
                //    HttpCookie cookie1 = Request.Cookies["PaymentMethod"];
                //    HttpCookie cookie2 = Request.Cookies["Default"];
                //    lbl_Card.Text = cookie1["CardNumber"].ToString();
                //    WalletID.Text = cookie1["WalletID"].ToString();
                //    lbl_CCAmt.Text = cookie2["AmtInCC"].ToString();
                //    lbl_AmountinUSD.Text = cookie2["AmtTotalInUSD"].ToString();
                //}
                //else {
                //    lbl_Card.Text = "";
                //    WalletID.Text = "";
                //    lbl_CCAmt.Text = "";
                //    lbl_AmountinUSD.Text = "";
                //}
            }
            catch (Exception err)
            {
            }
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {

        Response.Redirect("/OrderComplete.aspx");
    }
}