<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrap" style="">
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 text-center">
            <form class="contact-form">
                <h3>Contact</h3>
                <div class="form-group pb-20">
                    <asp:TextBox ID="txt_FullName" class="form-control line-input" runat="server" />
                </div>
                
                <div class="form-group pb-20">
                    <asp:TextBox class="form-control line-input" ID="txt_Subject" runat="server" />
                </div>
                
                <div class="form-group pb-40">
                    <asp:TextBox class="form-control line-input" ID="txt_Message" runat="server" TextMode="MultiLine" />
                </div>
                
                <asp:Button Text="Send Message" ID="btn_SendMessage" class="btn btn-success button-send" runat="server" OnClick="btn_SendMessage_Click" />
            </form>
        </div>
    </div>
</div>
</div>
</asp:Content>

