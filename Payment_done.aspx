<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payment_done.aspx.cs" Inherits="Payment_done" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .container {
      max-width: 380px;
      margin: 30px auto;
      overflow: hidden;
    }

    .printer-top {
      z-index: 1;
      border: 6px solid #666666;
      height: 6px;
      border-bottom: 0;
      border-radius: 6px 6px 0 0;
      background: #333333;
    }

    .printer-bottom {
      z-index: 0;
      border: 6px solid #666666;
      height: 6px;
      border-top: 0;
      border-radius: 0 0 6px 6px;
      background: #333333;
    }

    .paper-container {
      position: relative;
      overflow: hidden;
      height: 460px;
      z-index: -1;
    }

    .paper {
      background: #f2f2f2;
      height: 295px;
      position: absolute;
      z-index: 2;
      margin: 0 12px;
      margin-top: -12px;
      animation: print 5000ms cubic-bezier(0.68, -0.55, 0.265, 0.9) infinite;
      -moz-animation: print 3600ms cubic-bezier(0.68, -0.55, 0.265, 0.9) infinite;
    }

    .main-contents {
      margin: 0 12px;
      padding: 24px;
    }

   
    .jagged-edge {
      position: relative;
      height: 20px;
      width: 100%;
      margin-top: -1px;
      background: #fff;
    }

    .jagged-edge:after {
      content: "";
      display: block;
      position: absolute;
      //bottom: 20px;
      left: 0;
      right: 0;
      height: 20px;
      background: linear-gradient( 45deg, transparent 33.333%, #f2f2f2 33.333%, #f2f2f2 66.667%, transparent 66.667%), linear-gradient( -45deg, transparent 33.333%, #f2f2f2 33.333%, #f2f2f2 66.667%, transparent 66.667%);
      background-size: 16px 40px;
      background-position: 0 -20px;
    }

    .success-icon {
      text-align: center;
      font-size: 48px;
      height: 72px;
      background: #359d00;
      border-radius: 50%;
      width: 72px;
      height: 72px;
      margin: 16px auto;
      color: #fff;
    }

    .success-title {
      font-size: 22px;
      text-align: center;
      color: black;
      font-weight: bold;
      margin-bottom: 16px;
    }

    .success-description {
      font-size: 12px;
      line-height: 21px;
      color: black;
      text-align: center;
      margin-bottom: 24px;
    }

        .order-details {
            text-align: center;
            color: #000;
            font-weight: bold;
            font-size: 20px;

      .order-number-label {
        font-size: 180px;
        margin-bottom: 8px;
      }
      .order-number {
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        line-height: 48px;
        font-size: 48px;
        padding: 8px 0;
        margin-bottom: 24px;
      }
    }

    .order-footer {
      text-align: center;
      line-height: 18px;
      font-size: 18px;
      margin-bottom: 8px;
      font-weight: bold;
      color: #999;
    }

    @keyframes print {
      0% {
        transform: translateY(-90%);
      }
      100% {
        transform: translateY(0%);
      }
    }
    @-webkit-keyframes print {
      0% {
        -webkit-transform: translateY(-90%);
      }
      100% {
        -webkit-transform: translateY(0%);
      }
    }

    @-moz-keyframes print {
      0% {
        -moz-transform: translateY(-90%);
      }
      100% {
        -moz-transform: translateY(0%);
      }
    }

    @-ms-keyframes print {
      0% {
        -ms-transform: translateY(-90%);
      }
      100% {
        -ms-transform: translateY(0%);
      }
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
   <div class="container">
       <br />
  <div class="printer-top"></div>
    
  <div class="paper-container">
    <div class="printer-bottom"></div>

    <div class="paper">
      <div class="main-contents">
        <div class="success-icon">&#10004;</div>
        <div class="success-title">
          Payment Complete
        </div>
        <div class="success-description">
           Your payment has been processed successfully, you may continue browsing or check your order status in your account.
        </div>
        <div class="order-details">
          
          <div class="order-number" style="font-size: 22px;">Thank You</div>
        </div>
        
      </div>
      <div class="jagged-edge"></div>
    </div>
  </div>
</div>
    <br /><br />
</asp:Content>
