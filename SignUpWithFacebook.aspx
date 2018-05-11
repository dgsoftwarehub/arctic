<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SignUpWithFacebook.aspx.cs" Inherits="SignUpWithFacebook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://connect.facebook.net/en_US/all.js" type="text/javascript"></script>
    <script src="scripts/jquery-1.8.0.min.js" type="text/javascript"></script>

    <script src="scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="scripts/all.js" type="text/javascript"></script>
    <script>
        $("document").ready(function () {
            // Initialize the SDK upon load
            FB.init({
                appId: '150761258876842', // App ID
                channelUrl: '//' + window.location.hostname + '/channel', // Path to your 
                // Channel File
                scope: 'id,name,gender,user_birthday,email', // This to get the user details back 
                // from Facebook
                status: true, // check login status
                cookie: true, // enable cookies to allow the server to access the session
                xfbml: true  // parse XFBML
            });
            // listen for and handle auth.statusChange events
            FB.Event.subscribe('auth.statusChange', OnLogin);
        });


        // This method will be called after the user login into facebook.
        function OnLogin(response) {
            if (response.authResponse) {
                FB.api('/me?fields=id,name,gender,email,birthday', LoadValues);
            }
        }

        //This method will load the values to the labels
        function LoadValues(me) {
            if (me.name) {
                document.getElementById('displayname').innerHTML = me.name;
                document.getElementById('FBId').innerHTML = me.id;
                document.getElementById('DisplayEmail').innerHTML = me.email;
                document.getElementById('Gender').innerHTML = me.gender;
                document.getElementById('DOB').innerHTML = me.birthday;
                document.getElementById('auth-loggedin').style.display = 'block';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="fb-root"></div>
    <!-- This initializes the FB controls-->
    <div class="fb-login-button" autologoutlink="true" scope="user_birthday,email">
        Login with Facebook
    </div>
    <!-- FB Login Button -->
    <!-- Details -->
    <div id="auth-status">
        <div id="auth-loggedin" style="display: none">
            Hi, <span id="displayname"></span>
            <br />
            Your Facebook ID : <span id="FBId"></span>
            <br />
            Your Email : <span id="DisplayEmail"></span>
            <br />
            Your Sex:, <span id="Gender"></span>
            <br />
            Your Date of Birth :, <span id="DOB"></span>
            <br />
        </div>
    </div>
</asp:Content>

