<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <title>用户登录</title>
</head>
<body style="background-color: #144474;">
    <form id="form1" runat="server">
    <div class="logDiv">
        <div class="tipDiv" style="text-align:left;padding-left:80px;">
            <p class="lableText">用户编码：<asp:TextBox ID="txt_userid" runat="server" Height="20px" 
                   Width="140px" AutoCompleteType="Disabled"></asp:TextBox>
                </p>
           <p class="lableText">登录密码：<asp:TextBox ID="txt_pass" runat="server" 
                   Height="20px" Width="140px" TextMode="Password"></asp:TextBox>
               <br /><br />
               <asp:Button ID="btn_Signin" runat="server" Text="登录" Height="30px" OnClick="btn_Signin_Click" Width="210px" />
               <br /><br />
               <asp:Label ID="lab_info" runat="server" ForeColor="Yellow"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
