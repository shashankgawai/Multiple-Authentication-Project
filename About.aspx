<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- about section -->
  <section class="about_section layout_padding">
    <div class="container  ">
      <div class="heading_container heading_center">
        <h2>
          About <span>Us</span>
        </h2>
        <p>
          Secure Authentication Service: Passwords, Pattern Locks, and Image Locks for Enhanced Account Security
        </p>
      </div>
      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="images/about-img.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <h3>
              We Are Multiple Authentication
            </h3>
            <p>
              Our Secure Authentication Service offers a comprehensive approach to account security by providing users with 
                multiple authentication options. With traditional password authentication, users can ensure their accounts are safeguarded 
                with robust encryption and hashing techniques. Moreover, our service introduces the convenience of pattern locks, allowing users 
                to authenticate with a unique gesture drawn on a grid, offering an intuitive alternative to passwords.
            </p>
            <p>
              Additionally, for those seeking an even higher level of security, we offer image locks, where users can select 
                or upload an image and perform a specific action on it for authentication. This multi-layered approach 
                not only enhances account security but also provides users with flexibility and choice in how they access their 
                accounts, ensuring peace of mind in an increasingly digital world.
            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->
</asp:Content>

