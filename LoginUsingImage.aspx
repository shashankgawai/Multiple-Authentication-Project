<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginUsingImage.aspx.cs" Inherits="LoginUsingImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div style="width: 100%; text-align: center;">
            <br />
            <h2><b>Image Password</b></h2>
            <center>
                <asp:TextBox ID="txtemail" CssClass="form-control" Width="600px" placeholder="Enter email" runat="server"></asp:TextBox>
            </center>
            <div style="display: inline-block;">
                <br />
                
                <div class="container" style="margin-left:100px">
                    <center>
                        <br />
                        <div class="row">
                            <!-- First row of images -->
                            <div class="col-2 image-container">
                                <a href="#" class="image-link" data-image-code="key1" data-user-id="username">
                                    <img src="imgpass/image1.jpg" alt="Image 1" class="img-fluid">
                                </a>
                            </div>
                            <!-- Add other image containers similarly -->
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
                        <!-- Second row of images --><div class="space" style="height: 20px;"></div>
                        <div class="row">
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
                    </center>
                </div>
                    
            </div><br />
            <asp:Label ID="lblimg" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <a href="ForgetImage.aspx">Forget Image Password?</a>
        </div>

        <!-- Hidden field to store the clicked image code -->
        <asp:HiddenField ID="hfClickedImageCode" runat="server" />

        <!-- Bootstrap JS (optional, only needed if you want to use Bootstrap JavaScript features) -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Script for shuffling images -->
        <script>
            $(document).ready(function () {
                // Function to shuffle the first 10 images without repetition
                function shuffleImages() {
                    var imageContainers = $(".image-container").toArray().slice(0, 10); // Select the first 10 images
                    var currentIndex = imageContainers.length;
                    var temporaryValue, randomIndex;

                    // While there remain elements to shuffle
                    while (0 !== currentIndex) {

                        // Pick a remaining element
                        randomIndex = Math.floor(Math.random() * currentIndex);
                        currentIndex -= 1;

                        // Swap it with the current element
                        temporaryValue = imageContainers[currentIndex];
                        imageContainers[currentIndex] = imageContainers[randomIndex];
                        imageContainers[randomIndex] = temporaryValue;
                    }

                    // Replacing the first 10 image containers with the shuffled ones
                    $(".container .row").empty();
                    $(imageContainers).appendTo(".container .row");

                    // Separate the first 10 images into two rows
                    var firstRow = $("<div class='row'></div>");
                    var secondRow = $("<div class='row'></div>");
                    $(imageContainers.slice(0, 5)).appendTo(firstRow);
                    $(imageContainers.slice(5, 10)).appendTo(secondRow);
                    $(".container").empty().append(firstRow).append("<div class='space' style='height: 20px;'></div>").append(secondRow); // Clear and append the rows
                }

                shuffleImages(); // Call the function on page load
            });
        </script>  

        <script>
            $(document).ready(function () {
                $(".image-link").click(function (e) {
                    e.preventDefault();
                    var imageCode = $(this).data("image-code");
                    $("#<%= hfClickedImageCode.ClientID %>").val(imageCode); // Set hidden field value to image code

                    // Optionally, you can display the clicked image code in a label
                    $("#<%= lblimg.ClientID %>").text(imageCode);

                    // Send AJAX request to set the imageCode value in the code-behind
                    $.ajax({
                        type: "POST",
                        url: "LoginUsingImage.aspx/SetImageCode",
                        data: JSON.stringify({ imageCode: imageCode }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log("Image code set successfully on the server-side.");
                            var result = response.d;
                            if (result == true) {
                                var email = $("#<%= txtemail.ClientID %>").val();
                                window.location.href = "User/Dashboard.aspx?email=" + email;
                            }
                            if (result == false) {

                            }
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