<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AdminTamplateProgram.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        .style1 {
            width: 500px;
            height: 384px;
        }
    </style>
</head>
<body>
    <form id="WebForm" runat="server" defaultbutton="btnSubmit">
        <table id="tbeLoginFrom" width="100%" style="height: 100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td align="center">
                                <img src="images/index.png" border="0" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" height="40" style="font-size: x-large;">
                                <asp:Label ID="lblWebName" runat="server" Text="Label"></asp:Label>管理後台
                            </td>
                        </tr>
                    </table>
                    <table class="ui-state-focus">
                        <tr>
                            <td colspan="2" align="center">
                                <!--<img border="0" src="Images/Logo.gif" width="110" height="92"/>-->
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-size: Medium;">請輸入帳號：
                            </td>
                            <td>
                                <asp:TextBox ID="tbxAccount" Width="200" Font-Size="Medium" MaxLength="16" TabIndex="1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <!--此處為加上空白-->
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-size: Medium;">密 碼：
                            </td>
                            <td>
                                <asp:TextBox ID="tbxPassword" TextMode="Password" Width="200" Font-Size="Medium" MaxLength="16" TabIndex="2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <!--此處為加上空白-->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnSubmit" Text="確定" Font-Size="Medium" TabIndex="3" runat="server" OnClientClick="return chkLogin()" OnClick="btnSubmit_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <!--若忘記登入管理後台的帳號或密碼，請來信至<a href="mailto:rfjoin@macrowell.com.tw">rfjoin@macrowell.com.tw</a>信箱<br />
                                            我們將為您轉交相關程式人員，進行查詢帳號或重新設定密碼。-->
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        // 登入檢查
        function chkLogin(source, arguments) {

            var obj = document.getElementById("tbeLoginFrom").getElementsByTagName("input");
            var strValid = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var strLoginFormAccount = obj[0].value;

            if (strLoginFormAccount == "") {
                alert("請輸入帳號");
                obj[0].focus();
                return false;
            }

            if (strLoginFormAccount.length < 3 || strLoginFormAccount.length > 16) {
                alert("帳號長度 3 ~ 16 個字元");
                obj[0].focus();
                return false;
            }

            for (var intI = 0; intI < strLoginFormAccount.length; intI++) {
                if (strValid.indexOf(strLoginFormAccount.charAt(intI), 0) < 0) {
                    alert("帳號請輸入英文或是數字，不可包含符號、空格或非英文文字。");
                    obj[0].focus();
                    return false;
                }
            }

            var strLoginFormPassword = obj[1].value;

            if (strLoginFormPassword == "") {
                alert("請輸入密碼。");
                obj[1].focus();
                return false;
            }

            if (strLoginFormPassword.length < 4 || strLoginFormPassword.length > 16) {
                alert("密碼長度 4 ~ 16 個字元");
                obj[1].focus();
                return false;
            }

        }
    </script>
</body>
</html>
