<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MultupleImgReg.aspx.cs" Inherits="MultupleImgReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <center>
            <div style="width: 70%; text-align: center;">
                <div class="image-container">
                    <div class="container">
                        <h3>Image Password</h3>
                        <div style="display: inline-block;">
                            <div class="container">
                                <div class="row">
                                    <!-- First row of images -->
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image1" data-user-id="username">
                                            <img src="imgpass/image1.jpg" alt="Image 1" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image2" data-user-id="username">
                                            <img src="imgpass/image2.jpg" alt="Image 2" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image3" data-user-id="username">
                                            <img src="imgpass/image3.jpg" alt="Image 3" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image4" data-user-id="username">
                                            <img src="imgpass/image4.jpg" alt="Image 4" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image5" data-user-id="username">
                                            <img src="imgpass/image5.jpg" alt="Image 5" class="img-fluid">
                                        </a>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Second row of images -->
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image6" data-user-id="username">
                                            <img src="imgpass/image6.jpg" alt="Image 6" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image7" data-user-id="username">
                                            <img src="imgpass/image7.jpg" alt="Image 7" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image8" data-user-id="username">
                                            <img src="imgpass/image8.jpg" alt="Image 8" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image9" data-user-id="username">
                                            <img src="imgpass/image9.jpg" alt="Image 9" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-2 image-container">
                                        <a href="#" class="image-link" data-image-code="image10" data-user-id="username">
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
            <br />
            <asp:Button ID="Button1" class="form-submit btn btn-primary" runat="server" Text="Register" OnClick="Button1_Click" /><br />
        </center>
    </form>

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
                  url: "MultupleImgReg.aspx/SetImageCode",
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