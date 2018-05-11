<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"  EnableEventValidation="false" CodeFile="OrderComplete.aspx.cs" Inherits="OrderComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container pt-30 pb-50">
<div class="row justify-content-center">
<div class="col-xl-10 text-center">
<p class="pb-20"><img src="images/thumbs-up.png" alt=""/></p>
<h1 class="text-size-30 pb-20">ORDER COMPLETE</h2>

<p class="pb-20"><button type="submit" class="btn btn-success button-track-order">TRACK ORDER</button></p>


<h2 class="text-size-30">Order REF: #<asp:Label ID="lbl_OrderID" Text="" runat="server" /></h2>
<p class="text-size-20 pb-20">Congrats! Your order went through.<br/>If you don’t receive your order within 2 hours please contact our support email.</p>
<p class="text-size-20 pb-10">YOU ARE BUYING</p>
<p class="text-size-50">
    <asp:Label ID="lbl_AmountCC" Text="" runat="server" /></p>
<div class="order-list"><label>Total</label><div class="hr-line"><hr></div><span>
    <asp:Label ID="lbl_totalpaid" Text="" runat="server" /></span></div>
<div class="order-list"><label>Arrival Estimate</label><div class="hr-line"><hr></div><span>45 Minutes</span></div>

<form class="ajax-load buyers-information" action="nowallet.html">
<p class="pb-20"><asp:Button ID="btn_Continue" class="btn btn-success button-complete-order" Text="Continue" runat="server" OnClick="btn_Continue_Click" /></p>
<a href="WalletAddress.aspx" class="ajax-load back-link">BACK</a>
</form>


</div>
</div>
</div>
</asp:Content>

