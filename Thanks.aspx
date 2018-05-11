<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="Thanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid min-height">
    <div class="row pt-40 pb-40">
        <div class="col-sm-12 text-center">
            <div class="thanks-block">
                    <h1>Thanks,
                <asp:Label Text="" id="lbl" runat="server" /></h1>
                    <h2 class="pb-30">Alomst done, we're verifying your account</h2>
                   <%-- <button type="submit" class="btn btn-success small">Continue</button>--%>
                <asp:Button ID="btnsubmit" class="btn btn-success button-complete-order" runat="server" Text="Continue" OnClick="btnsubmit_Click" />
            </div>
           
        </div>
    </div>
</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</asp:Content>

