<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BuyerInformation.aspx.cs" Inherits="BuyerInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <script src="scripts/jquery-1.8.0.min.js" type="text/javascript"></script>

    <script src="scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="scripts/all.js" type="text/javascript"></script>
    <script type="text/javascript">
        function validateform() {
            var x = document.getElementById("ContentPlaceHolder1_TxtFullName").value
            var y = document.getElementById("ContentPlaceHolder1_TxtEmailAddress").value
            var z = document.getElementById("ContentPlaceHolder1_fu_BuyerPhoto").value
            if (x == "" || y == "") {
                alert("Full Name and Email Address are mandatory")
                return false;
            }
            if (z == "") {
                alert("Please upload Image")
                return false;
            }
            var fbUserID = getCookie("userid");
            if (fbUserID == "" || fbUserID == null) {
                alert("Logging in with facebook is mandatory!");
                return false;
            }
        }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(";");
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                c = c.split("=")
                if (c[0] == " userid") {
                    var returnvar = "Yes"
                }                   
            }
            return returnvar;
        }
        
    </script>
<style>
.button-complete-order {
min-width: 420px;
margin: 25px auto;
display: table;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '286708451862090',
                cookie: true,
                scope: 'id,name,gender,user_birthday,email',
                xfbml: true,
                version: 'v2.12'
            });

            FB.AppEvents.logPageView();

        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));



        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        function statusChangeCallback(response) {
            if (response.status == "connected") {
                FB.api('/me', { locale: 'en_US', fields: 'id, name, email' }, LoadValues);
            }
        };
        function LoadValues(me) {
            document.cookie = "username = " + me.name;
            document.cookie = "userid = " + me.id;
            document.cookie = "useremail = " + me.email;
        }
</script>




    <div class="container pt-30 pb-50">
        <div class="row justify-content-center">
            <div class="col-xl-8">



                <div class="stepwizard pb-30 text-center">
                    <a href="#step-1" class="btn btn-circle complete">1</a>
                    <a href="#step-2" class="btn btn-circle btn-active">2</a>
                    <a href="#step-3" class="btn btn-circle" disabled="disabled">3</a>
                    <a href="#step-4" class="btn btn-circle btn-last" disabled="disabled">4</a>
                </div>
                <!--stepwizard-->

                <div class="transparent-box">
                    <div class="row">
                        <div class="col-sm-6 text-left">Purchase Amount</div>
                        <div class="col-sm-6 text-right"><span class="cryptocurrency"><asp:Label ID ="lbl_CCurr" runat="server"></asp:Label></span><asp:Label ID ="lbl_AmountinUSD" runat="server"></asp:Label></div>
                    </div>
                </div>
                <!--transparent-box-->

                <h3 class="pt-30">2. Buyer’s Information</h3>
                <p class="text-size-20 pb-40">We need this information in order to process the order</p>


                <%--<form class="ajax-load buyers-information" action="funding-instrument.html">--%>

                    <div class="form-group label-text-left label-up  pb-50">
                        <label class="label-text-left">Full Name</label>
                        <asp:TextBox ID="TxtFullName" placeholder="" runat="server" class="form-control line-input" ></asp:TextBox>
                    </div>


                    <div class="form-group label-text-left label-up  pb-50">
                        <label class="label-text-left">Email</label>
                        <asp:TextBox ID="TxtEmailAddress" placeholder="" runat="server" class="form-control line-input" ></asp:TextBox>
                    </div>


                    <div class="row pb-60">
                        <div class="col-sm-8 text-left">
                            <h3>Upload a Photo ID </h3>
                            <p class="text-size-20 pb-10">
                                Information that contains your name like your driver’s license or passport.
                            </p>
                        </div>
                        <div class="col-sm-4 text-right">
                            <label class="fileContainer">
                                UPLOAD
                                <asp:FileUpload  ID="fu_BuyerPhoto" class="inputfile"  runat="server" />
                                
                            </label>
                        </div>
                    </div>

                <div>
                    <fb:login-button scope="public_profile,email" autologoutlink="true" onlogin="checkLoginState();">
                            </fb:login-button>
                </div>


                    
                    <p class="pb-20 pt-10 text-center">
                        <%--<button type="submit" class="btn btn-success button-complete-order fb-login-button">Continue</button>--%></p>
                        <asp:Button ID="BtnSubmit" runat="server" OnClientClick=" return validateform();" class="btn btn-success button-complete-order" Text="Continue" OnClick="BtnSubmit_Click" />
                    <p class="pb-20 text-center"><a href="order.aspx" class="ajax-load back-link">BACK</a></p>


                <%--</form>--%>


            </div>
        </div>
    </div>
</asp:Content>

