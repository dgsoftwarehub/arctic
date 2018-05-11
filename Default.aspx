<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validateform() {
            var x = document.getElementById("ContentPlaceHolder1_txtusd").value;
            if (x == "") {
                alert("Please enter amount");
                //var xx = document.createElement("Label")
                //xx.innerHTML = "*"
                //xx.style.color = "Red"
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="hero">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <h2 class="main-title">Introducing the easiest way to buy<span> and sell cryptocurrency using a credit or debit card.</span></h2>
                    <div class="currency-form">
                        <div class="row justify-content-center align-items-center">
                            <div class="col-lg-5 col-md-12 col-sm-12">
                                <div class="input-group">
                                    <asp:TextBox ID="txtusd" CssClass="form-control" vale="Amount in Purchase" runat="server" placeholder="" onkeypress="return isNumberKey(event,this)" AutoCompleteType="Disabled"></asp:TextBox>
                                    <span class="input-group-addon">USD</span>
                                </div>
                            </div>
                            <!--col-lg-5-->
                            <div class="col-lg-2 col-md-12 col-sm-12">
                                <img src="images/icon-transfer.png" />
                            </div>
                            <!--col-lg-2-->
                            <div class="col-lg-5 col-md-12 col-sm-12">
                                <div class="input-group">
                                    <%--<label for="input-usd">BTC</label>--%>
                                    <asp:TextBox ID="txtcoin" runat="server" class="form-control" vale="Amount in Crytocurrency" onkeypress="return isNumberKey(event,this)" AutoCompleteType="Disabled" placeholder=""></asp:TextBox>
                                    <%--<input type="text" class="form-control" id="input-btc" placeholder=""/>--%>
                                    <span class="input-group-addon">
                                        <div class="selectdiv">
                                            <label>
                                                <asp:DropDownList ID="ddrCurrrency" runat="server" CssClass="ddcurrncy">
                                                    <asp:ListItem>BTC</asp:ListItem>
                                                    <asp:ListItem>LTC</asp:ListItem>
                                                    <asp:ListItem>DASH</asp:ListItem>
                                                    <asp:ListItem>XRP</asp:ListItem>
                                                </asp:DropDownList>
                                            </label>
                                        </div>
                                    </span>
                                </div>
                            </div>
                            <!--col-lg-5-->
                        </div>
                        <!--row-->

                        <asp:Button ID="btnpurchase" class="btn btn-success" runat="server" Text="Purchase  Instantly" onclientclick="return validateform()" OnClick="btnpurchase_Click" />
                    </div>
                    <%--				<button type="submit" class="btn btn-success" onclick="">Purchase  Instantly</button>--%>
                </div>
            </div>
        </div>
    </section>
    <section class="featured-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                    <img src="images/featured-icon-1.png" alt="" />
                    <h2>Decide how much<br />
                        you want to buy</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. tin cidunt nec dolor volutpat aliquet.</p>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                    <img src="images/featured-icon-2.png" alt="" />
                    <h2>Add to your<br />
                        existing wallet</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. tin cidunt nec dolor volutpat aliquet.</p>
                </div>


                <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                    <img src="images/featured-icon-3.png" alt="" />
                    <h2>Pay using your<br />
                        Credit or Debit card</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. tin cidunt nec dolor volutpat aliquet.</p>
                </div>

            </div>
        </div>
    </section>
    <script type="text/javascript">


        $(document).ready(function () {
            $("#ContentPlaceHolder1_ddrCurrrency").change(function () {
                httpGetUsd("https://api.coinmarketcap.com/v1/ticker/");
            });
        })

        $(document).ready(function () {
            $("#ContentPlaceHolder1_txtcoin").keyup(function () {

                debugger;
                httpGetUsd("https://api.coinmarketcap.com/v1/ticker/");
            });
        })
        function httpGetUsd(theUrl) {
            debugger;
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", theUrl, false); // false for synchronous request
            xmlHttp.send(null);


            //get live price
            var lblbit = '';
            var lbllit = '';
            var lbldash = '';
            var lblripple = '';
            for (var i = 0; i < 15; i++) {

                rate = obj[i].price_usd;
                if (obj[i].id == "bitcoin") {
                    lblbit = rate ;
                }
                if (obj[i].id == "litecoin") {
                    lbllit = rate ;
                }
                if (obj[i].id == "dash") {
                    lbldash = rate ;
                }
                if (obj[i].id == "ripple") {
                    lblripple = rate ;
                }
            }
            //--------------------




            var obj = $.parseJSON(xmlHttp.responseText);
            var rate;
            if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "BTC") {

                rate = lblbit;
            }
            else if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "LTC") {

                rate = lbllit;
            }
            if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "DASH") {

                rate = lbldash;
            }
            if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "XRP") {

                rate = lblripple;
            }
            //if (obj[0].symbol="BTC") 
            //{
            var x = ($("#ContentPlaceHolder1_txtcoin").val()) / rate
            $("#ContentPlaceHolder1_txtusd").val(x);
            
        }


        $(document).ready(function () {
            $("#ContentPlaceHolder1_txtusd").keyup(function () {

                debugger;
                httpGet("https://api.coinmarketcap.com/v1/ticker/");
            });
        })

        $(document).ready(function () {
            $("#ContentPlaceHolder1_ddrCurrrency").change(function () {

                debugger;
                httpGet("https://api.coinmarketcap.com/v1/ticker/");
            });
        })


        function httpGet(theUrl) {

            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", theUrl, false); // false for synchronous request
            xmlHttp.send(null);
            //var getContact = JSON.parse(xmlHttp.responseText);
            //document.write(getContact.name + ", " + getContact.USD.buy);
            //return xmlHttp.responseText
            var obj = $.parseJSON(xmlHttp.responseText);
            debugger;

            //get live price
            var lblbit = '';
            var lbllit = '';
            var lbldash = '';
            var lblripple = '';
            for (var i = 0; i < 15; i++) {

                rate = obj[i].price_usd;
                if (obj[i].id == "bitcoin") {
                    lblbit = rate;
                }
                if (obj[i].id == "litecoin") {
                    lbllit = rate;
                }
                if (obj[i].id == "dash") {
                    lbldash = rate;
                }
                if (obj[i].id == "ripple") {
                    lblripple = rate;
                }
            }
            //--------------------




            var obj = $.parseJSON(xmlHttp.responseText);
            var rate;
            if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "BTC") {

                rate = lblbit;
            }
            else if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "LTC") {

                rate = lbllit;
            }
            if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "DASH") {

                rate = lbldash;
            }
            if ($("#ContentPlaceHolder1_ddrCurrrency").val() == "XRP") {

                rate = lblripple;
            }



            if (rate > 0) {
                var x = (($("#ContentPlaceHolder1_txtusd").val() / rate))
                x = parseFloat(x).toFixed(8);
                if (x > 0) {
                    $("#ContentPlaceHolder1_txtcoin").val(x);
                }
                else {
                    $("#ContentPlaceHolder1_txtcoin").val();
                }
            }
            else {
                $("#ContentPlaceHolder1_txtcoin").val();
            }


        }

        function isNumberKey(evt, obj) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            var value = obj.value;
            var dotcontains = value.indexOf(".") != -1;
            if (dotcontains)
                if (charCode == 46) return false;
            if (charCode == 46) return true;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        /*added by Vipan*/
        $('.currency-form').floatinglabel({ ignoreId: ['ignored'] });

    </script>
</asp:Content>

