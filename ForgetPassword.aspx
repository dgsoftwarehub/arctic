<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid pb-40">
        <div class="row">
            <div class="col-sm-10 text-center ">
                <div class="tellus-form">
                    <h3>Forget Password</h3>
                    <%--<p>
                        If you have an account with us, please log in.</p>--%>
                    <div class="form-group pb-20">
                        <asp:TextBox ID="txtuname" runat="server"  class="form-control line-input" placeholder="User Name" AutoCompleteType="Disabled" MaxLength="50"></asp:TextBox>


                    </div>
                    <div class="form-group pb-20">
                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" class="form-control line-input" AutoCompleteType="Disabled" placeholder="Email"></asp:TextBox>

                    </div>

                   
                    <asp:Button ID="btnLogin" class="btn btn-success button-complete-order" runat="server" Text="Submit" OnClientClick="return validate()" OnClick="btnLogin_Click"  />
                    <%--                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClientClick="return validate()" OnClick="btnLogin_Click" />--%>
                </div>
               

            </div>
        </div>
    </div>
    <script  type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtuname.ClientID%>").value == "") {
                alert("User Name cannot be left blank");
                document.getElementById("<%=txtuname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtEmail.ClientID%>").value == "") {
                alert("Email Id cannot be left blank");
                document.getElementById("<%=txtEmail.ClientID%>").focus();
                return false;
            }
            
            debugger;
          return  checkEmail();
        }
       

        function checkEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(document.getElementById("<%=txtEmail.ClientID%>").value)) {
                alert("Please enter a valid email address");
                document.getElementById("<%=txtEmail.ClientID%>").focus();
                return false;
            }
        }
           
        
         </script>
</asp:Content>

