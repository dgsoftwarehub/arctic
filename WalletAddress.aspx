<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WalletAddress.aspx.cs" Inherits="WalletAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container pt-30 pb-50">
<div class="row justify-content-center">
<div class="col-xl-8">



<div class="stepwizard pb-30 text-center">
<a href="#step-1" class="btn btn-circle complete">1</a>
<a href="#step-2" class="btn btn-circle complete">2</a>
<a href="#step-3" class="btn btn-circle complete">3</a>
<a href="#step-4" class="btn btn-circle btn-last btn-active">4</a>
</div><!--stepwizard-->

<div class="transparent-box">
<div class="row">
<div class="col-sm-6 text-left ending-card-text">Purchase Amount <br/><span><asp:Label ID="lbl_Card" runat="server"></asp:Label></span> </div>
<div class="col-sm-6 text-right"><span class="cryptocurrency"><asp:Label ID="lbl_CCAmt" runat="server"></asp:Label></span><asp:Label ID="lbl_AmountinUSD" runat="server"></asp:Label></div>
</div>
</div><!--transparent-box-->

<h3 class="pt-30">4. Wallet Address</h3>
<p class="text-size-20 pb-40">Please double check this address, we are not responsible<br/>for funds sent to the incorrect address.</p>


<form class="ajax-load buyers-information" action="order-complete.html">

<div class="form-group label-text-left label-up  pb-0">
<label class="label-text-left">Wallet Address </label>

<span data-toggle="popover" data-placement="right" data-trigger="hover" title="About Wallet" data-html="true" data-content="Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. <a href='#'>Link to Wallet</a>">
 &nbsp; ?
</span>
    <asp:TextBox ID="WalletID" runat="server" />  
</div>
<P class="pb-50"><small>Note: Do not share Wallet Address</small></P>


<p class="pb-20 pt-10 text-center">
    <%--<button type="submit" class="btn btn-success button-complete-order">COMPLETE ORDER</button>--%>
    <asp:Button ID="BtnSubmit" class="btn btn-success button-complete-order" runat="server" Text="COMPLETE ORDER" OnClick="BtnSubmit_Click" />
</p>
<p class="pb-20 text-center"><a href="PaymentMethod.aspx" class="ajax-load back-link">BACK</a></p>


</form>


</div>
</div>
</div>

<script>
$(function () {
  $('[data-toggle="popover"]').popover()
})
</script>
</asp:Content>

