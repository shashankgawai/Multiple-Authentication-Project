<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- service section -->

  <section class="service_section layout_padding">
    <div class="service_container">
      <div class="container ">
        <div class="heading_container heading_center">
          <h2>
            Our <span>Services</span>
          </h2>
          <p>
            Secure Authentication Service: Passwords, Pattern Locks, and Image Locks for Enhanced Account Security
          </p>
        </div>
        <div class="row">
          <div class="col-md-4 ">
            <div class="box ">
              <div class="img-box">
                <img src="images/s2.png" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Using Password
                </h5>
                <p>
                  Login using email and password involves users providing their email address and associated password to access their accounts securely. It's a widely used authentication method requiring robust security measures like encryption and password hashing.
                </p>
                <a href="">
                  Read More
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="box ">
              <div class="img-box">
                <img src="images/pattern1.png" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Using Pattern
                </h5>
                <p>
                  Pattern login involves users drawing a predetermined pattern on a grid of dots or points to authenticate. It's a visual and intuitive method offering an alternative to traditional passwords, albeit potentially less secure due to pattern predictability.
                </p>
                <a href="">
                  Read More
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="box ">
              <div class="img-box">
                <img src="images/imagelock.png" alt="">
              </div>
              <div class="detail-box">
                <h5>
                   Using Image
                </h5>
                <p>
                  Image login requires users to select or upload an image, then perform a specific action such as tapping or drawing on it to authenticate. It offers a visually engaging and potentially more secure alternative to traditional password-based authentication methods.
                </p>
                <a href="">
                  Read More
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="btn-box">
          <a href="">
            View All
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- end service section -->
</asp:Content>

