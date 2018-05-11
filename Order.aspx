<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container pt-30 pb-50">
        <div class="row justify-content-center">
            <div class="col-xl-8">



                <div class="stepwizard pb-30 text-center">
                    <a href="#step-1" class="btn btn-circle">1</a>
                    <a href="#step-2" class="btn btn-circle" disabled="disabled">2</a>
                    <a href="#step-3" class="btn btn-circle" disabled="disabled">3</a>
                    <a href="#step-4" class="btn btn-circle btn-last" disabled="disabled">4</a>
                </div>
                <!--stepwizard-->

                <div class="transparent-box">
                    <div class="row">
                        <div class="col-sm-6 text-left">Purchase Amount</div>
                        <div class="col-sm-6 text-right"><span class="cryptocurrency"><asp:Label ID="LblBTC" runat="server" ></asp:Label>  </span><asp:Label ID="LblUSD" runat="server" ></asp:Label> USD</div>
                    </div>
                </div>
                <!--transparent-box-->

                <h3 class="pt-30">1. Purchase Information</h3>
                <p class="text-size-20 pb-40">Review your order information before moving on to next step.</p>

                <p class="text-size-20 text-center">YOU ARE BUYING</p>
                <p class="text-size-50 text-center"><asp:Label ID="LblBTC2" runat="server" ></asp:Label></p>

                <div class="order-list">
                    <label>Service Fee</label><div class="hr-line">
                        <hr />
                    </div>
                    <span>$<asp:Label ID="LblServiceFee" runat="server" ></asp:Label></span></div>
                <div class="order-list">
                    <label>Subtotal</label><div class="hr-line">
                        <hr />
                    </div>
                    <span>$<asp:Label ID="LblSubTotal" runat="server" ></asp:Label></span></div>
                <div class="order-list">
                    <label>Total</label><div class="hr-line">
                        <hr />
                    </div>
                    <span>$<asp:Label ID="LblTotal" runat="server" ></asp:Label></span></div>
                <div class="ajax-load" >
                    <p class="pb-20 pt-20 text-center">
                    <asp:Button ID="BtnCompleteOrder" class="btn btn-success button-complete-order" runat="server" Text="Continue to payment" OnClick="BtnCompleteOrder_Click" />
                </div>
                <p class="pb-20 text-center">
                    <a href="default.aspx" class="ajax-load back-link">BACK</a>

                </p>


            </div>
        </div>
    </div>
</asp:Content>

