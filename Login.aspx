<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-0Uw/FB3TKLdM9SAs5bLP/g5Hgahfowdm+KxUCW3MBDmGBk7XRGdBJ9prJ8JNJKoSftvJefFXpiCC6L6lDTiYAA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <script nonce="71aea60c-2b04-46e6-b91c-13009a4ee649">try{(function(w,d){!function(o,p,q,r){o[q]=o[q]||{};o[q].executed=[];o.zaraz={deferred:[],listeners:[]};o.zaraz.q=[];o.zaraz._f=function(s){return async function(){var t=Array.prototype.slice.call(arguments);o.zaraz.q.push({m:s,a:t})}};for(const u of["track","set","debug"])o.zaraz[u]=o.zaraz._f(u);o.zaraz.init=()=>{var v=p.getElementsByTagName(r)[0],w=p.createElement(r),x=p.getElementsByTagName("title")[0];x&&(o[q].t=p.getElementsByTagName("title")[0].text);o[q].x=Math.random();o[q].w=o.screen.width;o[q].h=o.screen.height;o[q].j=o.innerHeight;o[q].e=o.innerWidth;o[q].l=o.location.href;o[q].r=p.referrer;o[q].k=o.screen.colorDepth;o[q].n=p.characterSet;o[q].o=(new Date).getTimezoneOffset();if(o.dataLayer)for(const B of Object.entries(Object.entries(dataLayer).reduce(((C,D)=>({...C[1],...D[1]})),{})))zaraz.set(B[0],B[1],{scope:"page"});o[q].q=[];for(;o.zaraz.q.length;){const E=o.zaraz.q.shift();o[q].q.push(E)}w.defer=!0;for(const F of[localStorage,sessionStorage])Object.keys(F||{}).filter((H=>H.startsWith("_zaraz_"))).forEach((G=>{try{o[q]["z_"+G.slice(7)]=JSON.parse(F.getItem(G))}catch{o[q]["z_"+G.slice(7)]=F.getItem(G)}}));w.referrerPolicy="origin";w.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(o[q])));v.parentNode.insertBefore(w,v)};["complete","interactive"].includes(p.readyState)?zaraz.init():o.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document)}catch(e){throw fetch("/cdn-cgi/zaraz/t"),e;};</script>
  <style>
.btn-pattern,
.btn-fingerprint {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-pattern {
    background-color: #28a745;
    color: #fff;
}

.btn-fingerprint {
    background-color: #007bff;
    color: #fff;
}

.btn-pattern:hover,
.btn-fingerprint:hover {
    background-color: #218838;
}

.btn-fingerprint:active,
.btn-pattern:active {
    transform: translateY(1px);
}

/* Sign-in content layout */
.signin-content {
    display: flex;
    justify-content: space-between;
    align-items: flex-start; /* Align items at the start of the flex container */
    margin-top: 20px; /* Add margin to separate from the section above */
}

.signin-image,
.signin-form {
    flex-basis: 45%; /* Adjust as needed to control the width of each section */
    padding: 20px; /* Add padding for spacing within each section */
    box-sizing: border-box; /* Ensure padding is included in the width */
}
 .form-container {
  display: block;
  margin: 0 auto;
  /*margin-top: 200px;*/
  width: 400px;
  perspective: 1000;
  background:#800e66;
}

/* Additional styling as needed */

  </style>  
    
    <div class="main" style="padding: 0;">

    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <br />
                <div class="signin-image" style="margin-top:50px;">
                    <figure><img src="images/signin-image.jpg" alt="sign up image"></figure>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Registration.aspx" class="signup-image-link">Create an account</a>
                </div>
                
                <div class="signin-form">
                    <br /><br />
                    <h2 class="form-title"><b>Sign In</b></h2><br />
                    <form method="POST" class="register-form" id="Form1" runat="server">
                        <div class="form-group">
                           <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-envelope" style="font-size: 24px;"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="input-group">
                           <span class="input-group-text"><i class="fa fa-lock"  style="font-size: 24px;"></i></span>
                                 <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                         </div>
                        <br />
                        <div class="form-group form-button">
                            <asp:Button ID="btnliogin" runat="server" class="btn btn-info" Width="40%" Text="Log in" OnClick="btnliogin_Click"/>
                        </div>
                        
                        
                        <div class="form-group form-button d-flex">
                            <asp:Button ID="Button1" class="btn btn-success" Width="40%" runat="server" OnClick="Button1_Click" style="display: none;" />
                            <a href="#" id="patternLink" class="btn btn-success" style="width: 40%; padding:10px;" onclick="document.getElementById('<%= Button1.ClientID %>').click(); return false;">
                                <i class="bi bi-grid-3x3-gap"></i> Pattern
                            </a>
                            &emsp;
                            <asp:Button ID="Button2" class="btn btn-primary" Width="40%" runat="server" OnClick="Button2_Click" style="display: none;" />
                            <a href="#" id="imageLink" class="btn btn-primary" style="width: 40%; padding:10px;" onclick="document.getElementById('<%= Button2.ClientID %>').click(); return false;">
                                <i class="bi bi-image"></i> Image
                            </a>
                            &emsp;
                            <asp:Button ID="Button3" class="btn btn-info" Width="40%" runat="server" OnClick="Button3_Click" style="display: none;" />
                            <a href="#" id="fingerprintLink" class="btn btn-info" style="width: 40%; padding:10px;" onclick="document.getElementById('<%= Button3.ClientID %>').click(); return false;">
                                <i class="bi bi-fingerprint"></i> Fingerprint
                            </a>
                        </div>
                        <a href="ForgetLogin.aspx">Forget Password!</a>

                        <section style="width:200px;height:200px"></section>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

    </section>
</div>

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

