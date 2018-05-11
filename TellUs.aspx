<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TellUs.aspx.cs" Inherits="TellUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 text-center ">
                <div class="tellus-form">
                    <h3>Tell us about you.</h3>
                    <div class="form-group">
                        <asp:TextBox ID="txtusername" runat="server" class="form-control" AutoCompleteType="Disabled" placeholder="Full Legal Name"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtemail" runat="server" class="form-control" AutoCompleteType="Disabled" placeholder="Email"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <button class="form-control facebook">Login with Facebook</button>
                    </div>
                    <div class="form-group">
                         <asp:FileUpload ID="FileUpload1" class="form-control   " runat="server"  />
                        <%--<asp:Button ID="upload" class="form-control uploadid" OnClientClick="return fireFileClick();" runat="server" Text="Upload" />--%>
                        <%--<button class="form-control uploadid">Upload ID</button>
                    <asp:FileUpload ID="upload" runat="server" class="form-control uploadid" s    />--%>
                    </div>
                    <asp:Button ID="btncont" class="btn btn-success small" OnClientClick="return validate();" runat="server" Text="Continue" OnClick="btncont_Click" />
                </div>
                <p class="copyright">2017 Copyright Arctic &amp; Co.</p>
                <%--<input runat="server" id="File1" type="file" style="visibility: hidden;" önchange="myFunction(this);" />--%>
                <%--<input id="Text1" type="text" runat="server" hidden="hidden" />--%>
                                        <%--<asp:TextBox ID="Text1"  runat="server" class="form-control" placeholder="Email"></asp:TextBox>--%>

               

            </div>
        </div>
    </div>
    <script  type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtusername.ClientID%>").value == "") {
                alert("User name cannot be left blank");
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID%>").value == "") {
                alert("Email Id cannot be left blank");
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
            if (checkEmail() == false)
            {
                return false;
            }
            debugger;
            return validateimage();
        }
       

        function checkEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(document.getElementById("<%=txtemail.ClientID%>").value)) {
                alert("Please enter a valid email address");
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
        }
        function validateimage() {

            debugger;
            var array = ['jpg'];

            var xyz = document.getElementById("ContentPlaceHolder1_FileUpload1");

            var Extension = xyz.value.substring(xyz.value.lastIndexOf('.') + 1).toLowerCase();

            if (array.indexOf(Extension) <= -1) {

                alert("Please Upload only jpg flle");

                return false;

            }

        }
        </script>
    <%--<script type="text/javascript">
        function fireFileClick() {
          
            var objfile = document.getElementById("<%= File1.ClientID %>");
            objfile.click();

            return false;
        }
        function myFunction(objfile) {
            debugger;
            var objTextBox = document.getElementById("<%= Text1.ClientID %>");
            objTextBox.value = objfile.value;
            
        }
    </script>--%>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
</asp:Content>

