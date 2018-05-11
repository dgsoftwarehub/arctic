<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MailTest.aspx.cs" Inherits="MailTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="TxtEmailID" runat="server"></asp:TextBox>
    <asp:Button ID="BtnSend" runat="server" Text="send mail" OnClick="BtnSend_Click" />
</asp:Content>

