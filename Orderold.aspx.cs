using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          lblamt.Text=  Request.QueryString["usd"].ToString();
            lblcoin.Text = Request.QueryString["btc"].ToString();
            lblcoinType.Text = Request.QueryString["cur"].ToString();
            lblorder.Text = "$" + lblamt.Text;
            lblorderFee.Text = "$" + 8;
            if (!string.IsNullOrWhiteSpace(lblamt.Text))
            {
                lblTotal.Text = "$" + Convert.ToString(Convert.ToDouble(lblamt.Text) + Convert.ToDouble(8));

            }
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
}