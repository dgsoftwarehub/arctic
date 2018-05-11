<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- login -->
     <div class="container-fluid pb-40">
        <div class="row justify-content-center">
            <div class="col-sm-10 text-center ">
                <div class="tellus-form">
                    <h3>REGISTERED CUSTOMERS</h3>
                    <p>
                        If you have an account with us, please log in.</p>
                    <div class="form-group pb-20">
                        <asp:TextBox ID="txtEmail" runat="server"  MaxLength="50" class="form-control line-input" AutoCompleteType="Disabled" placeholder="Username" ></asp:TextBox>

                    </div>
                    <div class="form-group pb-20">
                 <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" class="form-control line-input" placeholder="Password" AutoCompleteType="Disabled" MaxLength="50"></asp:TextBox>

                    </div>
                   
                  <p class="pb-20"> <a class="forgot" href="forgetpassword.aspx">Forgot Your Password?</a>
                     <a class="" href="Signup.aspx">New User</a>
                     </p>
                     
                    <asp:Button ID="btnLogin" class="btn btn-success button-complete-order" runat="server" Text="Login" OnClientClick="return validate()" OnClick="btnLogin_Click"  />
<%--                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClientClick="return validate()" OnClick="btnLogin_Click" />--%>
                    
                </div>
             
               
            </div>
        </div>
    </div>
	<%--<div class="login-page">
        <div class="container">
            <div class="account_grid">
                <div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
                    <h3>NEW CUSTOMERS</h3>
                    <p>
                        By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                    <a class="acount-btn" href="register.html">Create an Account</a>
                </div>
                <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
                    <h3>REGISTERED CUSTOMERS</h3>
                    <p>
                        If you have an account with us, please log in.</p>
                    <div>
                        <span>Email Address<label>*</label></span>
                        <asp:TextBox ID="txtEmail" runat="server"  MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>

                    </div>
                    <div>
                        <span>Password<label>*</label></span>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" AutoCompleteType="Disabled" MaxLength="50"></asp:TextBox>
                    </div>
                    <a class="forgot" href="#">Forgot Your Password?</a>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClientClick="return validate()" OnClick="btnLogin_Click" />
					
			    </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>--%>
<!-- login -->
    <script  type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtEmail.ClientID%>").value == "") {
                alert("Email Id cannot be left blank");
                document.getElementById("<%=txtEmail.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtPwd.ClientID%>").value == "") {
                alert("Password cannot be left blank");
                document.getElementById("<%=txtPwd.ClientID%>").focus();
                return false;
            }
            debugger;
          //return  checkEmail();
        }
       

        function checkEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(document.getElementById("<%=txtEmail.ClientID%>").value)) {
                alert("Please enter a valid email address");
                document.getElementById("<%=txtEmail.ClientID%>").focus();
                return false;
            }
        }
            //    return true;
            //}
            //function checkEmail(event) {
            //    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            //    if (!re.test(event.value)) {
            //        alert("Please enter a valid email address");
            //        return false;
            //    }
            //    return true;
            //}
        
         </script>
</asp:Content>

