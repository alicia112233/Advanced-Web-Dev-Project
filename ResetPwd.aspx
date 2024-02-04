<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResetPwd.aspx.cs" Inherits="ResetPwd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="assets/css/StyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/MasterPage.css" />    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
    <style>
        #togglePassword {
            float: right;
            cursor: pointer;
        }
        #show_password{
            float: right;
            cursor: pointer;
            margin-top: -50px;
        }
    </style>
    <script type="text/javascript">  
        $(document).ready(function () {
            $('#show_password').hover(function show() {
                //Change the attribute to text  
                $('[id*=tb_pwd]').attr('type', 'text');
                $('[id*=tb_cfmpwd]').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password  
                    $('[id*=tb_pwd]').attr('type', 'password');
                    $('[id*=tb_cfmpwd]').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
        });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
  <div class="container">
      <h4>Reset Password</h4><br>
        <asp:TextBox ID="tb_pwd" CssClass="inputtxt" PlaceHolder="Password" runat="server" TextMode="Password" ></asp:TextBox>
        <asp:Label ID="lblhelp" style="color:red; font-size: 13px;" runat="server"/><br />
        <asp:RequiredFieldValidator ID="pwd" runat="server" ControlToValidate="tb_pwd" ErrorMessage="Please enter your new password." Style="font-size: 13px;" ForeColor="Red"></asp:RequiredFieldValidator>  
        <asp:TextBox ID="tb_cfmpwd" CssClass="inputtxt" PlaceHolder="Confirm Password" runat="server" style="width: 90%;" TextMode="Password"></asp:TextBox>
<%--        <i style="margin-top: 15.5px; margin-right: 5px;" id="togglePassword" class="fa fa-eye"></i> <br />--%>
          <div class="input-group-append">  
                <button id="show_password" class="btn btn-primary" type="button" style="background-color: black;">  
                    <span class="fa fa-eye-slash icon"></span>  
                </button> 
          </div>
         
      <asp:CompareValidator
            ID="CompareValidatorPW"
            runat="server"
            ErrorMessage="Passwords do not match."
            ControlToValidate="tb_cfmpwd"
            ControlToCompare="tb_pwd"
            Operator="Equal" Type="String"
            ForeColor="Red"
            Style="font-size: 13px;"
            Display="Dynamic">
        </asp:CompareValidator> <br />
        
      <asp:RequiredFieldValidator ID="cfmpwd" runat="server" ControlToValidate="tb_cfmpwd" ErrorMessage="Please enter your new password again." Style="font-size: 13px;" ForeColor="Red"></asp:RequiredFieldValidator>  
       
        <asp:PasswordStrength 
            ID="pwdStrength" 
            TargetControlID="tb_pwd" 
            HelpStatusLabelID="lblhelp" 
            PreferredPasswordLength="8"
            MinimumNumericCharacters="1" 
            MinimumSymbolCharacters="1" 
            StrengthIndicatorType="BarIndicator"
            runat="server" />
      <asp:Button ID="btnReset" class="btnsignin" runat="server" Text="Submit" OnClick="btnReset_Click" Style="cursor: pointer;"/>
        <br /><br /><br />

  </div>
        
</body>
</asp:Content>

