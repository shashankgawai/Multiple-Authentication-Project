<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgetLogin.aspx.cs" Inherits="ForgetLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div class="main" style="padding: 0;">

            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <br />

                        <div class="signin-form col-lg-6">
                            <br />
                            <br />
                            <h2 class="form-title" style="text-align: left"><b>Forget Password</b></h2>
                            <br />
                            <form method="POST" class="register-form" id="Form1" runat="server">
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
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa fa-lock" style="font-size: 24px;"></i></span>
                                        <asp:TextBox ID="txtpassword" runat="server" placeholder="New Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="form-group form-button">
                                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-info" Width="40%" Text="Change Password" OnClick="btnsubmit_Click" />
                                </div>
                                <a href="Login.aspx">Go To Login!</a>
                                <section style="width: 200px; height: 200px"></section>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </center>
</asp:Content>

