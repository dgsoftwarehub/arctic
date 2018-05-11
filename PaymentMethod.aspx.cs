using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentMethod : System.Web.UI.Page
{
    public string CCurrency, AmountinUSD, AmountinCCurrency, AmountTotalInUSD, CustomerName, CustomerEmail, OrderID, fbUserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            lbl_CCurr.Text = Session["AmtInCC"].ToString() + " " + Session["CCurrency"].ToString();
            lbl_AmountinUSD.Text = Session["AmtTotalInUSD"].ToString() + " USD";
            //if (Request.Cookies["Default"] != null && Request.Cookies["BuyerInformation"] != null)
            //{
            //    HttpCookie Cookie = Request.Cookies["Default"];
            //    HttpCookie Cookie2 = Request.Cookies["BuyerInformation"];
            //    string CCurrency = Cookie["CCurrency"].ToString();
            //    string AmountinUSD = Cookie["AmtInUsd"].ToString();
            //    string AmountinCCurrency = Cookie["AmtInCC"].ToString();
            //    string AmountTotalInUSD = Cookie["AmtTotalInUSD"].ToString();
            //    string CustomerName = Cookie2["BuyerFullName"].ToString();
            //    string CustomerEmail = Cookie2["BuyerEmailAddress"].ToString();
            //    string OrderID = Cookie2["OrderID"].ToString();

            //    lbl_CCurr.Text = AmountinCCurrency + " " + Cookie["CCurrency"].ToString();
            //    lbl_AmountinUSD.Text = AmountTotalInUSD + " USD";
            //}
        }
    }
    private bool ValidateControls()
    {
        if (txt_NameonCard.Text.Length <= 3)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter Name');</script>");
            return false;
        }
        if (txt_cardexpirydate.Text.Length <= 5)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter correct date');</script>");
            return false;
        }
        if (txt_CVV.Text.Length < 3)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter DVV number');</script>");
            return false;
        }
        if (cardnumber.Text.Length < 12)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter card number');</script>");
            return false;
        }
        if (txt_billingaddress.Text.Length <= 5)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter correct billing address');</script>");
            return false;
        }
        if (txt_billingcity.Text.Length <= 3)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter correct city name');</script>");
            return false;
        }
        return true;
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {

        
        //if(ValidateControls()==false)
        //{
        //    return;
        //}
        
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var stringChars = new char[8];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];
        }

        var WalletID = new String(stringChars);
        string CCurrency = Session["CCurrency"].ToString();
        string AmountinUSD = Session["AmtInUsd"].ToString();
        string AmountinCCurrency = Session["AmtInCC"].ToString();
        string AmountTotalInUSD = Session["AmtTotalInUSD"].ToString();
        string CustomerName = Session["BuyerFullName"].ToString();
        string CustomerEmail = Session["BuyerEmailAddress"].ToString();
        string OrderID = Session["OrderID"].ToString();
        string userid;
        userid = "NotFound";
        if (Session["fbUserID_UID"]==""||Session["fbUserID_UID"]==null){
        
        }
        else
        {
            userid = Session["fbUserID_UID"].ToString();
        }
        if (userid == "NotFound") {
            if (!(Session["LoggedInUserID"] == "" || Session["LoggedInUserID"] == null))
            {
                userid = Session["LoggedInUserID"].ToString();
            }
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_UpdateOrderID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@userID", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@OrderID", SqlDbType.Int).Value = Convert.ToInt32(OrderID);
        cmd.Parameters.Add("@CustomerName", SqlDbType.VarChar, 100).Value = CustomerName;
        cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = CustomerEmail;
        cmd.Parameters.Add("@AmountinUSD", SqlDbType.VarChar, 100).Value = AmountTotalInUSD;
        //SqlParameter param = cmd.Parameters["@AmountinUSD"];
        //param.Precision = 18;
        //param.Scale = 2;
        cmd.Parameters.Add("@AmountInCCurrency", SqlDbType.VarChar, 100).Value = AmountinCCurrency;
        //SqlParameter param2 = cmd.Parameters["@AmountInCCurrency"];
        //param2.Precision = 10;
        //param2.Scale = 10;
        cmd.Parameters.Add("@TotalAmountInUSD", SqlDbType.VarChar, 100).Value = AmountTotalInUSD;
        //SqlParameter param3 = cmd.Parameters["@TotalAmountInUSD"];
        //param3.Precision = 18;
        //param3.Scale = 2;
        cmd.Parameters.Add("@WalletID", SqlDbType.VarChar, 100).Value = WalletID;
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();

        Session["WalletID"] = WalletID.ToString();
        Session["CardNumber"] = cardnumber.Text.Trim();        
        Response.Redirect("/WalletAddress.aspx");
    }
}