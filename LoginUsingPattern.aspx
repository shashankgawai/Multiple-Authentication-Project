<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginUsingPattern.aspx.cs" Inherits="LoginUsingPattern" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css11/styles.css" rel="stylesheet" />
    <link href="styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/style.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.gesture.password/1.0.1/jquery.gesture.password.min.js"></script>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/gesture.min.js"></script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"853c62f1ccaf31f3","version":"2024.2.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>

    <form id="form1" runat="server">
        <div class="main" style="padding: 0;">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form" style="float: left; width: 100%;">
                            <center>
                            <h1 class="form-title" style="color:white;"><b>Sign In Using Pattern</b></h1>
                            </center>
                            <div style="width: 100%; text-align: center;">



                                <div style="display: inline-block;">

                                    <div class="form-group">
                                        <label for="txtemail"><i class="bi bi-envelope" style="font-size: 24px;"></i></label>
                                        &nbsp;
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="*" ControlToValidate="txtemail" SetFocusOnError="True" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>

                                    <div id="gesturepwd" style="background-image: url(img/Lock.jpg); height: 150px; width: 150px;"></div>

                                    <p id="errmessage">authentication invalid...</p>
                                    <br /><br />
                                    <script>
                                        $("#gesturepwd").GesturePassword({
                                            backgroundColor: "transparent",
                                            color: "#FFFFFF",
                                            roundRadii: 30,
                                            pointRadii: 12,
                                            space: 30,
                                            width: 270,
                                            height: 270,
                                            lineColor: "#ECF0F1",
                                            zindex: 100
                                        });

                                        $("#errmessage").hide();

                                        $("#gesturepwd").on("hasPasswd", function (e, passwd) {
                                            debugger;
                                            if (passwd != '') {
                                                $.ajax({
                                                    type: 'POST',
                                                    url: 'LoginUsingPattern.aspx/ValidLogin',
                                                    data: "{'password':'" + passwd + "'}",
                                                    contentType: "application/json; charset=utf-8",
                                                    dataType: 'json',
                                                    success: function (response) {
                                                        debugger;
                                                        var result = response.d;
                                                        if (result == true) {
                                                            $("#gesturepwd").trigger("passwdRight");
                                                            setTimeout(function () {
                                                                // alert("Pattern is correct")
                                                            }, 500);
                                                        }
                                                        else {
                                                            $("#gesturepwd").trigger("passwdWrong");
                                                        }
                                                        if (result == true) {
                                                            // Get the email value from the TextBox
                                                            var email = $("#<%= txtemail.ClientID %>").val();
                                                            // Redirect to the Dashboard page with the email appended to the URL
                                                            window.location.href = "User/Dashboard.aspx?email=" + email;
                                                        }
                                                        if (result == false) {
                                                            $("#errmessage").show();
                                                        }
                                                        console.log(lstdtl);
                                                    },

                                                    error: function (response) {
                                                        $("#gesturepwd").trigger("passwdWrong");
                                                        var msg = jQuery.parseJSON(response.responseText);
                                                        console.log("Message: " + msg.Message);
                                                        console.log("StackTrace: " + msg.StackTrace);
                                                        console.log("ExceptionType: " + msg.ExceptionType);
                                                    },
                                                });
                                            }
                                            else {
                                                $("#gesturepwd").trigger("passwdWrong");
                                            }
                                        });
                                    </script>

                                    &nbsp;<br />
                                    <br />
                                    <asp:Label ID="lblPattern" runat="server" Text="-"></asp:Label>
                                    <a href="ForgetPattern.aspx" style="color:black">Forget Pattern ?</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</asp:Content>

