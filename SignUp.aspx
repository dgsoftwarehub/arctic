<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--  <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 text-center ">
                <div class="verify-form">
                    <h3>Verify your account with some basic credientials, lets start here.</h3>
                    <div class="form-group">
                        <asp:TextBox ID="txtuname" runat="server" class="form-control" placeholder="Username" MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" class="form-control"  MaxLength="50" placeholder="Password"></asp:TextBox>
                        <asp:TextBox ID="txtcpwd" runat="server" TextMode="Password" class="form-control" MaxLength="50"  placeholder="Confirm Password"></asp:TextBox>
                         <div class="clearfix"></div>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtaddress" runat="server" class="form-control" placeholder="Address" MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtdob" runat="server" TextMode="DateTime" onblur="validateDate(this)" MaxLength="10" class="form-control" placeholder="D.O.B"></asp:TextBox>
                        <asp:TextBox ID="txtssn" runat="server" class="form-control" placeholder="Last (4) SSN" MaxLength="4" AutoCompleteType="Disabled"></asp:TextBox>

                        <div class="clearfix"></div>
                    </div>
                    <asp:Button ID="btnContinue" class="btn btn-success small" runat="server" Text="Signup" OnClick="btnContinue_Click" />
                </div>
                <p class="copyright">2017 Copyright Arctic &amp; Co.</p>
            </div>
        </div>
    </div>--%>


<div class="container-fluid pb-40">
    <div class="row">
        <div class="col-sm-12 text-center">
            <div class="verify-form">
                <h3 class="pb-40">Verify your account with some basic credientials, lets start here.</h3>
                <div class="form-group pb-20">
                    <asp:TextBox ID="txtuname" type="type" runat="server" class="form-control line-input" placeholder="Username" MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>
                </div>
                <div class="form-group pb-20">
                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" class="form-control line-input" MaxLength="50" placeholder="Password"></asp:TextBox>
               </div>
               <div class="form-group pb-20"> <asp:TextBox ID="txtcpwd" runat="server" TextMode="Password" class="form-control line-input" MaxLength="50" placeholder="Confirm Password"></asp:TextBox>
                </div>
                
                <div class="form-group pb-20">
                    <asp:TextBox ID="txtaddress" runat="server" class="form-control line-input" placeholder="Address" MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>
                </div>
                <div class="form-group pb-20">
                    <asp:TextBox ID="txtdob" runat="server" TextMode="DateTime" AutoCompleteType="Disabled" MaxLength="10" class="form-control line-input" placeholder="D.O.B"></asp:TextBox></div>
                    <div class="form-group pb-20">
                    <asp:TextBox ID="txtssn" runat="server" class="form-control line-input" placeholder="Last (4) SSN" MaxLength="4" AutoCompleteType="Disabled"></asp:TextBox>
                  
                </div>
              

                <p class="pb-20 pt-20 text-center"><asp:Button ID="btnContinue" class="btn btn-success button-complete-order" runat="server" Text="Signup" OnClientClick="return validate()" OnClick="btnContinue_Click" /></p>
                
                
               <p class="pb-20 text-center">   <asp:Button ID="btnback" class="back-link" runat="server" Text="Back" OnClick="btnback_Click"  />
              
                  
                  </p>
            </div>
           
        </div>
    </div>
    
    </div>
    
    
    <script type="text/javascript">


        function validate() {
            debugger;
            if (document.getElementById("<%=txtuname.ClientID%>").value == "") {
                alert("User Name cannot be left blank");
                document.getElementById("<%=txtuname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtpwd.ClientID%>").value == "") {
                alert("Password cannot be left blank");
                document.getElementById("<%=txtpwd.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtcpwd.ClientID%>").value == "") {
                alert("Confirm Password cannot be left blank");
                document.getElementById("<%=txtcpwd.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=txtpwd.ClientID%>").value != document.getElementById("<%=txtcpwd.ClientID%>").value) {
                alert("Confirm Password Does not match");
                document.getElementById("<%=txtcpwd.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtssn.ClientID%>").value == "") {
                alert("SSNo cannot be left blank");
                document.getElementById("<%=txtssn.ClientID%>").focus();
                return false;
            }

            return validateDate();
        }


        function validateDate() {

            debugger;
            var monthDays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

            var dateValue = document.getElementById("<%=txtdob.ClientID%>").value;// elementRef.value;

            if (dateValue.length != 10) {
                alert('Entry must be in the format mm-dd-yyyy.');
                document.getElementById("<%=txtdob.ClientID%>").value = "";
     document.getElementById("<%=txtdob.ClientID%>").focus();
     return false;
 }

            // mm/dd/yyyy format... 
    var valueArray = dateValue.split('-');

    if (valueArray.length != 3) {
        alert('Entry must be in the format mm-dd-yyyy.');
        document.getElementById("<%=txtdob.ClientID%>").value = "";
        document.getElementById("<%=txtdob.ClientID%>").focus();
        return false;
    }

    var monthValue = parseFloat(valueArray[0]);
    var dayValue = parseFloat(valueArray[1]);
    var yearValue = parseFloat(valueArray[2]);

    if ((isNaN(monthValue) == true) || (isNaN(dayValue) == true) || (isNaN(yearValue) == true)) {
        alert('Non-numeric entry detected\nEntry must be in the format mm-dd-yyyy.');
        document.getElementById("<%=txtdob.ClientID%>").value = "";
        document.getElementById("<%=txtdob.ClientID%>").focus();
        return false;
    }

    if (((yearValue % 4) == 0) && (((yearValue % 100) != 0) || ((yearValue % 400) == 0)))
        monthDays[1] = 29;
    else
        monthDays[1] = 28;

    if ((monthValue < 1) || (monthValue > 12)) {
        alert('Invalid month entered\nEntry must be in the format mm-dd-yyyy.');
        document.getElementById("<%=txtdob.ClientID%>").value = "";
        document.getElementById("<%=txtdob.ClientID%>").focus();
        return false;
    }

    var monthDaysArrayIndex = monthValue - 1;
    if ((dayValue < 1) || (dayValue > monthDays[monthDaysArrayIndex])) {
        alert('Invalid day entered\nEntry must be in the format mm-dd-yyyy.');
        document.getElementById("<%=txtdob.ClientID%>").value = "";
        document.getElementById("<%=txtdob.ClientID%>").focus();
        return false;
    }

    return true;
}
    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
</asp:Content>

