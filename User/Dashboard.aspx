<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="User_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <center>
        
        <br />
        <table class="table" style="width:600px; text-align:left;">
            <thead class="thead-dark" style="text-align:center;">
                <tr>
                    <th scope="col" colspan="3">User Profile</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><asp:Label ID="lblname" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Aadhaar Number</td>
                    <td><asp:Label ID="lblaadhaar" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><asp:Label ID="lblemail" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Mobile</td>
                    <td><asp:Label ID="lblmobile" runat="server"></asp:Label></td>
                </tr>
            </tbody>
        </table>
    </center>
</asp:Content>

