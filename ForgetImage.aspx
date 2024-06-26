<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgetImage.aspx.cs" Inherits="ForgetImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <form runat="server">
        <center>
            <div style="width: 60%; text-align: center;">
                <div class="image-container">
                    <div class="container">
                        <h2><b>Forget Image Password</b></h2>
                        <br />
                        <div class="col-lg-10">
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
                        </div>
                        <br />
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
                                <br />
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
                </div>
            </div>

            <asp:HiddenField ID="hfImageCode" runat="server" />
            <asp:Label ID="lblextra" runat="server" Font-Bold="True" Text="Label"></asp:Label><br />
            <asp:Label ID="lblimg" runat="server" Font-Bold="True" Text="img"></asp:Label><br />
            <asp:HiddenField ID="hfClickedImageCode" runat="server" />

            <div class="form-group form-button">
                <asp:Button ID="btnsubmit" runat="server" class="btn btn-info" Width="20%" Text="Change Password" OnClick="btnsubmit_Click"  />
            </div>
            <a href="Login.aspx">Go To Login!</a>
        </center>
        <br />
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
                    url: "ForgetImage.aspx/SetImageCode",
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
    </form> 
</asp:Content>

