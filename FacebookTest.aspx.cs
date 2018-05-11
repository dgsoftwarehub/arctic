using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class FacebookTest : System.Web.UI.Page
{
    protected void Login(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("id,name,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "967499413405352";
        FaceBookConnect.API_Secret = "7866469b704c1fd2a90c80337765a92e";
        if (IsPostBack)
        {
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                return;
            }

            string code = Request.QueryString["code"];
            //code = "51445ba17925e90423bc9fef4a6bf5fd";
            if (!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me?fields=id,name,email");
                FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);
                pnlFaceBookUser.Visible = true;
                lblId.Text = faceBookUser.Id;
                lblUserName.Text = faceBookUser.UserName;
                lblName.Text = faceBookUser.Name;
                lblEmail.Text = faceBookUser.Email;
                ProfileImage.ImageUrl = faceBookUser.PictureUrl;
                btnLogin.Enabled = false;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    { 
    
    }
}
//public class FaceBookUser
//{
//    public string Id { get; set; }
//    public string Name { get; set; }
//    public string UserName { get; set; }
//    public string PictureUrl { get; set; }
//    public string Email { get; set; }
//}
