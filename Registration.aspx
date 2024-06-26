<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <script src="gesture.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <link href="styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.gesture.password/1.0.1/jquery.gesture.password.min.js"></script>
    <%--   <link href="css11/bootstrap.min.css" rel="stylesheet" />--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-0Uw/FB3TKLdM9SAs5bLP/g5Hgahfowdm+KxUCW3MBDmGBk7XRGdBJ9prJ8JNJKoSftvJefFXpiCC6L6lDTiYAA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .image-container {
            display: inline-block;
            margin: 0 auto;
        }

            .image-container .row {
                margin-bottom: 10px;
            }

            .image-container .col-2 {
                padding: 0;
            }
    </style>

    <%-- <link href="css11/styles.css" rel="stylesheet" />--%>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/gesture.min.js"></script>
    <div class="main" style="padding: 0;">
        <form runat="server">
            <center>
                <br />
                <section class="signup">
                    <%--<div class="container">--%>
                    <div class="signup-content">
                        <div class="signup-form mx-auto" style="max-width: 700px;">
                            <h1 class="form-title"><b>Sign up</b></h1><br />
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-user" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessage="*" ControlToValidate="txtName" SetFocusOnError="True" Text="*" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-envelope" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="*" ControlToValidate="txtemail" SetFocusOnError="True" Text="*" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-phone" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ErrorMessage="*" ControlToValidate="txtMobileNumber" SetFocusOnError="True" Text="*" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-id-card" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtAadharCard" runat="server" CssClass="form-control" placeholder="Aadhar Card"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAadharCard" runat="server" ErrorMessage="*" ControlToValidate="txtAadharCard" SetFocusOnError="True" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-lock" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" SetFocusOnError="True" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-key" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtconfpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Repeat your password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvConfPassword" runat="server" ErrorMessage="*" ControlToValidate="txtconfpassword" SetFocusOnError="True" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="txtconfpassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match." ForeColor="#FF3300" Display="Dynamic"></asp:CompareValidator>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlquestion" SetFocusOnError="True" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-pencil" style="font-size: 24px;"></i></span>
                                    <asp:TextBox ID="txtanswer" runat="server" CssClass="form-control" placeholder="Enter Answer of above question"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtanswer" SetFocusOnError="True" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <hr style="color:black; border-width: 3px;" />
                    <br />
                    <div style="width: 100%; text-align: center;">
                        <div style="display: inline-block;">
                            <center>
                                <h2><b>Pattern Password</b></h2><br />
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
                                                url: 'Registration.aspx/ValidLogin',
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
                            <hr width="1550px" style="color:black; border-width: 3px;" />
                            <br />
                            <center>
                                <div style="width: 60%; text-align: center;">
                                    <div class="image-container">
                                        <div class="container">
                                            <h2><b>Image Password</b></h2><br />
                                            <div style="display: inline-block;">
                                                <div class="container">
                                                    <div class="row">
                                                        <!-- First row of images -->
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key1" data-user-id="username">
                                                                <img src="imgpass/image1.jpg" alt="Image 1" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key2" data-user-id="username">
                                                                <img src="imgpass/image2.jpg" alt="Image 2" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key3" data-user-id="username">
                                                                <img src="imgpass/image3.jpg" alt="Image 3" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key4" data-user-id="username">
                                                                <img src="imgpass/image4.jpg" alt="Image 4" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key5" data-user-id="username">
                                                                <img src="imgpass/image5.jpg" alt="Image 5" class="img-fluid">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <!-- Second row of images -->
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key6" data-user-id="username">
                                                                <img src="imgpass/image6.jpg" alt="Image 6" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key7" data-user-id="username">
                                                                <img src="imgpass/image7.jpg" alt="Image 7" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key8" data-user-id="username">
                                                                <img src="imgpass/image8.jpg" alt="Image 8" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key9" data-user-id="username">
                                                                <img src="imgpass/image9.jpg" alt="Image 9" class="img-fluid">
                                                            </a>
                                                        </div>
                                                        <div class="col-2 image-container">
                                                            <a href="#" class="image-link" data-image-code="key10" data-user-id="username">
                                                                <img src="imgpass/image10.jpg" alt="Image 10" class="img-fluid">
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                            </center>
                            <asp:HiddenField ID="hfImageCode" runat="server" />
                            <asp:Label ID="lblextra" runat="server" Font-Bold="True" Text="Label"></asp:Label><br />
                            <asp:Label ID="lblimg" runat="server" Font-Bold="True" Text="img"></asp:Label><br />
                            <asp:HiddenField ID="hfClickedImageCode" runat="server" />
                            <br />
                            <a href="FutureScope.aspx" class="form-submit btn btn-success">Capture Finguerprint</a><br /><br />
                            <asp:Button ID="Button1" class="form-submit btn btn-primary btn-lg" runat="server" Text="Register" OnClick="Button1_Click" /><br />
                            <a href="Login.aspx" class="signup-image-link">I am already a member<asp:HiddenField ID="HiddenField1" runat="server" />
                            </a>
                            &nbsp;<br />
                            <br />

                        </div>
                    </div>
    </div>
    </div>
        </div>
    </section>
            </center>
    </form>       
</div>

    <!-- Bootstrap JS (optional, only needed if you want to use Bootstrap JavaScript features) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- jQuery (optional, only needed if you want to use jQuery for handling click events) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $(".image-link").click(function (e) {
                e.preventDefault();
                var imageCode = $(this).data("image-code");
                $("#<%= lblimg.ClientID %>").text(imageCode);

                // Send AJAX request to set the imageCode value in the code-behind
                $.ajax({
                    type: "POST",
                    url: "Registration.aspx/SetImageCode",
                    data: JSON.stringify({ imageCode: imageCode }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log("Image code set successfully on the server-side.");
                    },
                    error: function (xhr, status, error) {
                        console.error("Error setting image code on the server-side:", error);
                    }
                });
            });
        });
    </script>


    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-23581568-13');
    </script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"853c62f1ccaf31f3","version":"2024.2.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>


</asp:Content>
