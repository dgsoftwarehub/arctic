using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    private bool validateControls()
    {
        if (txtusd.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertmesg", "<script language=javascript>alert('Enter Amount');</script>");
            txtusd.Focus();
            return false;
        }
        return true;
    }
    protected void btnpurchase_Click(object sender, EventArgs e)
    {
        int TotalAmount;
        TotalAmount = 0;
        
        //if (validateControls() == false)
        //    return;

        TotalAmount = Convert.ToInt32(txtusd.Text) + ((System.Convert.ToInt32(txtusd.Text) * 2) / 100);
        Session["AmtInUsd"] = Convert.ToString(txtusd.Text);
        Session["AmtInCC"] = Convert.ToString(txtcoin.Text);
        Session["CCurrency"] = Convert.ToString(ddrCurrrency.SelectedValue);
        Session["AmtTotalInUSD"] = TotalAmount.ToString();
        Response.Redirect("/Order.aspx");
    }
    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string name)
    {
        return "Hello " + name + Environment.NewLine + "The Current Time is: "
            + DateTime.Now.ToString();
    }

    [WebMethod]
    private void FillCoinsLivePrice(string type)
    {
        double amt = 0;
        string bRate = "";
        string dRate = "";
        string eRate = "";
        string lRate = "";
        string mRate = "";
        try
        {



            //ClsBlockIOAPI obj = new ClsBlockIOAPI();
            dynamic parsedObject;
            parsedObject = GetBitcoinPriceAsPerCountry("https://api.coinmarketcap.com/v1/ticker/");
            string aa = parsedObject.GetType().ToString();
            int length = 0;
            if (parsedObject == null)
                return;

            foreach (dynamic entry in parsedObject)
            {
                length++;
            }
            int i = 0;
            foreach (dynamic entry in parsedObject)
            {
                string name = entry.name; // "test"0000000000000000
                dynamic value = entry.price_usd; // { inner: "text-value" }
                string CompleteString = System.Convert.ToString(value);
                switch (name)
                {
                    case "Bitcoin":

                        //lblBitCoin.Text = "$" + CompleteString;
                        bRate = CompleteString;
                        if (ddrCurrrency.SelectedIndex==0 && type =="Doller")
                        {

                        }
                        //lblbitqty.Text = Convert.ToString(0);
                        break;
                    //case "Ethereum":
                    //    lblEthereumcoin.Text = "$" + CompleteString;
                    //    eRate = CompleteString;
                    //    lblEthereumqty.Text = Convert.ToString(0);
                    //    break;
                    case "Litecoin":
                        //lblLitecoin.Text = "$" + CompleteString;
                        lRate = CompleteString;
                        //lbllitqty.Text = Convert.ToString(0);
                        break;
                    case "Dash":
                        dRate = CompleteString;
                        //lblDashcoin.Text = "$" + CompleteString;
                        //lbldashqty.Text = Convert.ToString(0);
                        break;
                    //case "Monero":
                    //    mRate = CompleteString;
                    //    lblMoneroCoin.Text = "$" + CompleteString;
                    //    lblmoneroqty.Text = Convert.ToString(0);
                    //    break;
                    default:
                        break;
                }



            }
            //clsPurchaseCoinBO objbo = new clsPurchaseCoinBO();
            //int uid = Convert.ToInt16(Request.Cookies["UId"].Value);
            //DataTable dt;
            //dt = objbo.LoadEwallets(uid);
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        if (dr["bitcoin"].ToString() != "0.00000000")
        //        {
        //            lblbitqty.Text = dr["bitcoin"].ToString();
        //            amt = amt + Convert.ToDouble(bRate) * Convert.ToDouble(dr["bitcoin"].ToString());
        //        }
        //        if (dr["litecoin"].ToString() != "0.00000000")
        //        {

        //            lbllitqty.Text = dr["litecoin"].ToString();
        //            amt = amt + Convert.ToDouble(lRate) * Convert.ToDouble(dr["litecoin"].ToString());
        //        }
        //        if (dr["Ethereum"].ToString() != "0.00000000")
        //        {
        //            lblEthereumqty.Text = dr["Ethereum"].ToString();
        //            amt = amt + Convert.ToDouble(eRate) * Convert.ToDouble(dr["Ethereum"].ToString());
        //        }
        //        if (dr["dash"].ToString() != "0.00000000")
        //        {
        //            lbldashqty.Text = dr["dash"].ToString();
        //            amt = amt + Convert.ToDouble(dRate) * Convert.ToDouble(dr["dash"].ToString());
        //        }
        //        if (dr["monero"].ToString() != "0.00000000")
        //        {
        //            lblmoneroqty.Text = dr["monero"].ToString();
        //            amt = amt + Convert.ToDouble(mRate) * Convert.ToDouble(dr["monero"].ToString());
        //        }
        //    }
        //    lblValue.Text = "$" + Convert.ToString(amt);
        }


        catch (Exception err)
        {
            string str = err.Message;
        }
    }


    public dynamic GetBitcoinPriceAsPerCountry(string pUrl)
    {


        string result = GetResultFromGetRequest(pUrl);
        if (result == "")
        {
            return null;
        }
        dynamic stuff = Newtonsoft.Json.JsonConvert.DeserializeObject(result);
        dynamic parsedObject = Newtonsoft.Json.JsonConvert.DeserializeObject(result);
        return parsedObject;


    }
    public string GetResultFromGetRequest(string URL)
    {
        StringBuilder sb = new StringBuilder();
        byte[] buf = new byte[8192];
        //do get request
        HttpWebRequest request = (HttpWebRequest)
            WebRequest.Create(URL);
        request.Timeout = 5000;


        HttpWebResponse result;
        try
        {
            result = (HttpWebResponse)request.GetResponse();
        }
        catch (WebException ex)
        {
            result = ex.Response as HttpWebResponse;
        }

        try
        {
            String responseString;

            using (Stream stream = result.GetResponseStream())
            {
                StreamReader reader = new StreamReader(stream, Encoding.UTF8);
                responseString = reader.ReadToEnd();
            }
            return responseString;
        }
        catch (Exception err)
        {
            return "";
        }

    }

    
}