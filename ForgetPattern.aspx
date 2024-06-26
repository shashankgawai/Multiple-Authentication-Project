<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgetPattern.aspx.cs" Inherits="ForgetPattern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<link href="css11/styles.css" rel="stylesheet" />--%>
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


    <br />
    <form method="POST" class="register-form" id="Form1" runat="server">
        <div style="width: 100%; text-align: center;">
            <div style="display: inline-block;">
                <center>
                    <h2><b>Forget Pattern Password</b></h2>
                    <br />

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-envelope" style="font-size: 24px;"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-question" style="font-size: 24px;"></i></span>
                            <asp:DropDownList ID="ddlquestion" CssClass="form-control" runat="server">
                                <asp:ListItem>** Select Security Question **</asp:ListItem>
                                <asp:ListItem>What is your Favourite Pet Name?</asp:ListItem>
                                <asp:ListItem>What is your Favourite Bike Name?</asp:ListItem>
                                <asp:ListItem>What is your Favourite City Name?</asp:ListItem>
                                <asp:ListItem>What is your Favourite Dish Name?</asp:ListItem>
                                <asp:ListItem>What is your Favourite Book Name?</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-pencil" style="font-size: 24px;"></i></span>
                            <asp:TextBox ID="txtanswer" runat="server" placeholder="Enter Your Answer" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div id="gesturepwd" style="background-image: url(img/Lock.jpg); height: 150px; width: 150px;"></div>
                    <p id="errmessage">authentication invalid...</p>
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
                                    url: 'ForgetPattern.aspx/ValidLogin',
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
                                            document.getElementById('<%=lblPattern.ClientID %>').innerHTML = passwd;
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
                </center>
                <asp:Label ID="lblPattern" runat="server" Text="00"></asp:Label><br />
                <br />
                <div class="form-group form-button">
                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-info" Width="40%" Text="Change Pattern" OnClick="btnsubmit_Click" />
                </div>
                <a href="Login.aspx">Go To Login!</a>

            </div>
        </div>
    </form>
</asp:Content>

