using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class BuyerInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lbl_CCurr.Text = Session["AmtInCC"].ToString() + Session["CCurrency"].ToString();
                lbl_AmountinUSD.Text = Session["AmtInUsd"].ToString() + " USD";
            }
            catch (Exception err)
            { }
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        #region fbCode
        string fbUserID = Request.Cookies["userid"].Value.ToString();
        string fbUserName = Request.Cookies["username"].Value.ToString();
        string fbUserEmail = Request.Cookies["useremail"].Value.ToString();

        string conString;
        conString = System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ToString();
        SqlConnection mycon = new SqlConnection(conString);
        mycon.Open();
        SqlCommand mycommand = new SqlCommand("spfbUserRegister", mycon);
        mycommand.CommandType = CommandType.StoredProcedure;
        mycommand.Parameters.Add(new SqlParameter("@fbUserID", fbUserID));
        mycommand.Parameters.Add(new SqlParameter("@fbUserName", fbUserName));
        mycommand.Parameters.Add(new SqlParameter("@fbUserEmail", fbUserEmail));
        SqlParameter p = new SqlParameter("@returnUserid", SqlDbType.Int);
        p.Direction = ParameterDirection.Output;
        mycommand.Parameters.Add(p);
        mycommand.ExecuteScalar();
        string userid = p.Value.ToString();
        mycon.Close();
        mycommand.Dispose();

        if (fu_BuyerPhoto.HasFile)
        {
            System.IO.FileInfo fi = new System.IO.FileInfo(fu_BuyerPhoto.FileName);
            string ext = fi.Extension;
            fu_BuyerPhoto.SaveAs(Server.MapPath("~/Images/userproofs/") + userid + ext);
        }

        Session["fbUserID_UID"] = userid;


        #endregion
        Random r = new Random();
        int OrderID = r.Next(1, 10000);
        Session["OrderID"] = OrderID.ToString();
        Session["BuyerEmailAddress"] = TxtEmailAddress.Text.Trim();
        Session["BuyerFullName"] = TxtFullName.Text.Trim();
        Response.Redirect("/PaymentMethod.aspx");
    }
}
