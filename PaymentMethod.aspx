<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PaymentMethod.aspx.cs" Inherits="PaymentMethod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validateform() {
            var x = document.getElementById("ContentPlaceHolder1_txt_NameonCard").value
            var y = document.getElementById("ContentPlaceHolder1_txt_cardexpirydate").value
            var z = document.getElementById("ContentPlaceHolder1_txt_CVV").value
            var xy = document.getElementById("ContentPlaceHolder1_cardnumber").value
            var yz = document.getElementById("ContentPlaceHolder1_txt_billingaddress").value
            var zx = document.getElementById("ContentPlaceHolder1_txt_billingcity").value
            if (x == "" || y == "" || z=="" || xy == "" || yz == "" || zx == "") {
                alert("All Fields are mandatory.")
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container pt-30 pb-50">
<div class="row justify-content-center">
<div class="col-xl-8">



<div class="stepwizard pb-30 text-center">
<a href="#step-1" class="btn btn-circle complete">1</a>
<a href="#step-2" class="btn btn-circle complete">2</a>
<a href="#step-3" class="btn btn-circle btn-active">3</a>
<a href="#step-4" class="btn btn-circle btn-last" disabled="disabled">4</a>
</div><!--stepwizard-->

<div class="transparent-box">
<div class="row">
<div class="col-sm-6 text-left">Purchase Amount</div>
<div class="col-sm-6 text-right"><span class="cryptocurrency"><asp:Label ID ="lbl_CCurr" runat="server"></asp:Label></span><asp:Label ID ="lbl_AmountinUSD" runat="server"></asp:Label></div>
</div>
</div><!--transparent-box-->

<h3 class="pt-30">3. Payment Method</h3>
<p class="text-size-20 pb-40">Add in your payment method for this order.</p>


<form class="ajax-load buyers-information" action="wallet.html">

<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">Type</label>
<select class="form-control line-input" id="card-type" name="card-type">
<option>Credit</option>
<option>Debit</option>
</select>
</div>


<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">Name on the card</label>
    <asp:TextBox class="form-control line-input" id="txt_NameonCard" runat="server" />
</div>



<div class="row">
<div class="col-sm-6">
<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">Expiration Date</label>
    <asp:TextBox class="form-control line-input" id="txt_cardexpirydate" runat="server" />
</div>
</div>
<div class="col-sm-6">
<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">CVV</label>
    <asp:TextBox class="form-control line-input" id="txt_CVV" runat="server" />
</div>
</div>
</div>


<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">Card Number</label>
    <asp:TextBox ID ="cardnumber" class="form-control credit-card-input line-input" runat="server" />
</div>


<h3 class="pb-30">Billing Address</h3>


<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">Billing Address</label>
    <asp:TextBox class="form-control line-input" id="txt_billingaddress" runat="server" />
</div>


<div class="form-group label-text-left label-up  pb-30">
<label class="label-text-left">City</label>
    <asp:TextBox class="form-control line-input" id="txt_billingcity"  runat="server" />
</div>


<div class="form-group label-text-left label-up pb-30">
<label class="label-text-left">State</label>
<select class="form-control line-input" id="billing-state" name="billing-state">
<option>ALABAMA</option>
<option>ALASKA</option>
<option>ARIZONA</option>
<option>ARKANSAS</option>
<option>CALIFORNIA</option>
<option>COLORADO</option>
<option>CONNECTICUT</option>
<option>DELAWARE</option>
<option>FLORIDA</option>
<option>GEORGIA</option>
<option>HAWAII</option>
<option>IDAHO</option>
<option>ILLINOIS</option>
<option>INDIANA</option>
<option>IOWA</option>
<option>KANSAS</option>
<option>KENTUCKY</option>
<option>LOUISIANA</option>
<option>MAINE</option>
<option>MARYLAND</option>
<option>MASSACHUSETTS</option>
<option>MICHIGAN</option>
<option>MINNESOTA</option>
<option>MISSISSIPPI</option>
<option>MISSOURI</option>
<option>MONTANA</option>
<option>NEBRASKA</option>
<option>NEVADA</option>
<option>NEW HAMPSHIRE</option>
<option>NEW JERSEY</option>
<option>NEW MEXICO</option>
<option>NEW YORK</option>
<option>NORTH CAROLINA</option>
<option>NORTH DAKOTA</option>
<option>OHIO</option>
<option>OKLAHOMA</option>
<option>OREGON</option>
<option>PENNSYLVANIA</option>
<option>RHODE ISLAND</option>
<option>SOUTH CAROLINA</option>
<option>SOUTH DAKOTA</option>
<option>TENNESSEE</option>
<option>TEXAS</option>
<option>UTAH</option>
<option>VERMONT</option>
<option>VIRGINIA</option>
<option>WASHINGTON</option>
<option>WEST VIRGINIA</option>
<option>WISCONSIN</option>
<option>WYOMING</option>
</select>

</div>

<p class="pb-20 pt-10 text-center">
    <%--<button type="submit" class="btn btn-success button-complete-order">COMPLETE ORDER</button>--%>
    <asp:Button ID="BtnSubmit" class="btn btn-success button-complete-order" runat="server" Text="COMPLETE ORDER" OnClientClick="return validateform();"  OnClick="BtnSubmit_Click" />
</p>
<p class="pb-20 text-center"><a href="BuyerInformation.aspx" class="ajax-load back-link">BACK</a></p>


</form>


</div>
</div>
</div>
</asp:Content>

