using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    //string USD, BTC, Total, Cur;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //if (Request.Cookies["Default"] != null)
                //{

                    LblUSD.Text = Session["AmtInUsd"].ToString();
                    LblBTC.Text = Session["AmtInCC"].ToString() + " " + Session["CCurrency"].ToString();
                    LblBTC2.Text = Session["AmtInCC"].ToString() + " " + Session["CCurrency"].ToString();
                    LblSubTotal.Text = Session["AmtInUsd"].ToString();
                    Int32 ServiceFee = 0;
                    ServiceFee = (System.Convert.ToInt32(LblUSD.Text) * 2) / 100;
                    LblServiceFee.Text = ServiceFee.ToString();
                    LblTotal.Text = Session["AmtTotalInUSD"].ToString();

                    //HttpCookie Cookie = Request.Cookies["Default"];
                    //LblUSD.Text = Cookie["AmtInUsd"].ToString();
                    //LblBTC.Text = Cookie["AmtInCC"].ToString() + " " + Cookie["CCurrency"].ToString();
                    //LblBTC2.Text = Cookie["AmtInCC"].ToString() + " " + Cookie["CCurrency"].ToString();
                    //LblSubTotal.Text = Cookie["AmtInUsd"].ToString();
                    //Int32 ServiceFee = 0;
                    //ServiceFee = (System.Convert.ToInt32(LblUSD.Text) * 2) / 100;
                    //LblServiceFee.Text = ServiceFee.ToString();
                    //LblTotal.Text = Cookie["AmtTotalInUSD"].ToString();
                //}
                //else
                //{
                //    LblUSD.Text = "0";
                //    LblBTC.Text = "0";
                //    LblBTC2.Text = "0";
                //    LblSubTotal.Text = "0";
                //    LblServiceFee.Text = "0";
                //    LblTotal.Text = "0";
                //}
            }
            catch(Exception err)
            { }
        }
    }
    protected void btnCompleteOrder_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["UId"] != null)
        {
            if (Convert.ToString(Request.Cookies["UId"].Value) != "")
            {
                Response.Redirect("User/Wallet.aspx");
                //Response.Redirect("User/Wallet.aspx?amount="+ lblamt.Text);
            }
            else
            {
                Response.Redirect("/Login.aspx");
                //Response.Redirect("/Login.aspx?amount=" + lblamt.Text);
            }
        }
        else
        {
            Response.Redirect("/Login.aspx");
        }
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("/default.aspx");
    }

    protected void BtnCompleteOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("/BuyerInformation.aspx");
    }
}