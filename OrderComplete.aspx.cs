using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lbl_OrderID.Text = Session["OrderID"].ToString();
                lbl_totalpaid.Text = Session["AmtTotalInUSD"].ToString();
                lbl_AmountCC.Text = Session["AmtInCC"].ToString();
                //if (Request.Cookies["Default"] != null && Request.Cookies["BuyerInformation"] != null)
                //{
                //    HttpCookie cooKie = Request.Cookies["Default"];
                //    HttpCookie cooKie2 = Request.Cookies["BuyerInformation"];
                //    lbl_OrderID.Text = cooKie2["OrderID"].ToString();
                //    lbl_totalpaid.Text = cooKie["AmtTotalInUSD"].ToString();
                //    lbl_AmountCC.Text = cooKie["AmtInCC"].ToString();
                //}
            }
            catch (Exception err)
            {
             
            }
            
        }
    }
    protected void btn_Continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("/DashBoard.aspx");
    }
}