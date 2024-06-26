<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginUsingPassword.aspx.cs" Inherits="finexo_html_LoginUsingPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <script src="jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<script src="gesture.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<meta name="robots" content="noindex, follow">
    <link href="styles.css" rel="stylesheet" />
<script nonce="71aea60c-2b04-46e6-b91c-13009a4ee649">try{(function(w,d){!function(o,p,q,r){o[q]=o[q]||{};o[q].executed=[];o.zaraz={deferred:[],listeners:[]};o.zaraz.q=[];o.zaraz._f=function(s){return async function(){var t=Array.prototype.slice.call(arguments);o.zaraz.q.push({m:s,a:t})}};for(const u of["track","set","debug"])o.zaraz[u]=o.zaraz._f(u);o.zaraz.init=()=>{var v=p.getElementsByTagName(r)[0],w=p.createElement(r),x=p.getElementsByTagName("title")[0];x&&(o[q].t=p.getElementsByTagName("title")[0].text);o[q].x=Math.random();o[q].w=o.screen.width;o[q].h=o.screen.height;o[q].j=o.innerHeight;o[q].e=o.innerWidth;o[q].l=o.location.href;o[q].r=p.referrer;o[q].k=o.screen.colorDepth;o[q].n=p.characterSet;o[q].o=(new Date).getTimezoneOffset();if(o.dataLayer)for(const B of Object.entries(Object.entries(dataLayer).reduce(((C,D)=>({...C[1],...D[1]})),{})))zaraz.set(B[0],B[1],{scope:"page"});o[q].q=[];for(;o.zaraz.q.length;){const E=o.zaraz.q.shift();o[q].q.push(E)}w.defer=!0;for(const F of[localStorage,sessionStorage])Object.keys(F||{}).filter((H=>H.startsWith("_zaraz_"))).forEach((G=>{try{o[q]["z_"+G.slice(7)]=JSON.parse(F.getItem(G))}catch{o[q]["z_"+G.slice(7)]=F.getItem(G)}}));w.referrerPolicy="origin";w.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(o[q])));v.parentNode.insertBefore(w,v)};["complete","interactive"].includes(p.readyState)?zaraz.init():o.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document)}catch(e){throw fetch("/cdn-cgi/zaraz/t"),e;};</script>
    
    
     <div class="main" style="padding:0;">

<section class="sign-in">
<div class="container">
<div class="signin-content">
<div class="signin-image">
<figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
<a href="RegistrationPart1.aspx" class="signup-image-link">Create an account</a>
</div>
<div class="signin-form">
<h2 class="form-title">Sign In</h2>
<form method="POST" class="register-form" id="login-form">
<div class="form-group">
<label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>

    <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email"   ></asp:TextBox>
</div>
<div class="form-group">
<label for="your_pass"><i class="zmdi zmdi-lock"></i></label>

     <asp:TextBox ID="txtpassword" runat="server" placeholder="Password"  TextMode="Password"  ></asp:TextBox>
</div>
<div class="form-group">
<input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
<label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
</div>
<div class="form-group form-button">

    <asp:Button ID="btnliogin" runat="server" class="form-submit" Text="Log in" OnClick="btnliogin_Click"  />
</div>

  <section style="width:200px;height:200px">


  </section>  




</form>

</div>
</div>
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

