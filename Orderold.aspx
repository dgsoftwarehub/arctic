<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Orderold.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			
				<div class="text-center new-order"> New Order</div>
				<div class="order-details text-center">
					<div class="order-value">
						<asp:Label ID="lblamt" runat="server" Text="Label"></asp:Label>
						<a class="small-text">USD</a>
						<i class="fa fa-question-circle" aria-hidden="true" >
							<div class="toolbox">
								<p>Order: <span><asp:Label ID="lblorder" runat="server" ></asp:Label></span></p>
								<p>Arctic Fee: <span><asp:Label ID="lblorderFee" runat="server" ></asp:Label></span></p>
								<p>Total: <span><asp:Label ID="lblTotal" runat="server" ></asp:Label></span></p>
							</div>
						</i>
					</div>
					<div class="order-sep">To</div>
					<div class="order-value">
						<asp:Label ID="lblcoin" runat="server" Text="Label"></asp:Label>
						<a class="small-text"><asp:Label ID="lblcoinType" runat="server" Text="Label"></asp:Label></a>
					</div>
				</div>
				<div class="text-center middle-text">
					Does this look right?<br>
					If so, please complete the following for purchase.
					<ul class="check-list">
						<li class="checked"><i class="fa fa-circle" aria-hidden="true"></i> Identification Check</li>
						<li><i class="fa fa-circle fa-1x" aria-hidden="true"></i> Funding Source</li>
					</ul>
                     <asp:Button ID="btnback" class="btn btn-success small" runat="server" Text="Back" OnClick="btnback_Click"  />
                    <asp:Button ID="btnCompleteOrder" class="btn btn-success small" runat="server" Text="Complete Order" OnClick="btnCompleteOrder_Click" />
<%--					<button type="submit" class="btn btn-success small">Complete Order</button>--%>
				</div>
			
		</div>
	</div>
</div>
     
</asp:Content>

