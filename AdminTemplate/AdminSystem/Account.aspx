<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="AdminTamplateProgram.Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Javascript/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="/Javascript/jquery-ui-1.8.14.custom.min.js"></script>
    <script type="text/javascript" src="/Javascript/jquery-ui-widget.js"></script>
    <script type="text/javascript" src="/Javascript/Common.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/App_Themes/admin/Stylecss.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="WebForm" runat="server">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table border="0" width="100%" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top" style="width: 15px">
                                <div class="ui-state-default ui-corner-right" title="關閉選單" style="width: 15px; height: 35px; margin-left: -8px; cursor: pointer" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <span class="ui-icon ui-icon-pin-s" onclick="switchFrameCols(this)" style="margin-top: 10px"></span>
                                </div>
                            </td>
                            <td align="left" style="padding-left: 10px">目錄：系統 ► 密碼修改
                            </td>
                            <td align="right" valign="top">
                                <!-- Function Menu -->
                            </td>
                        </tr>
                    </table>
                    <hr />
                </td>
            </tr>

            <tr>
                <td align="center">
                    <table id="frmPassWord" cellspacing="0" cellpadding="5">
                        <tr>
                            <th width="100%" colspan="2" align="center">帳 號 資 料
                            </th>
                        </tr>
                        <tr>
                            <td width="40%" align="right" nowrap>帳號：
                            </td>
                            <td width="60%">
                                <asp:Label runat="server" ID="lblAccount" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" colspan="2" align="center">變 更 密 碼
                            </td>
                        </tr>
                        <tr>
                            <td width="40%" align="right" nowrap>請輸入原密碼：
                            </td>
                            <td width="60%">
                                <asp:TextBox runat="server" ID="tbxOldPassword" TextMode="password" MaxLength="16" />
                            </td>
                        </tr>
                        <tr>
                            <td width="40%" align="right" nowrap>請輸入新密碼：
                            </td>
                            <td width="60%">
                                <asp:TextBox runat="server" ID="tbxNewPassword" TextMode="password" MaxLength="16" />
                            </td>
                        </tr>
                        <tr>
                            <td width="40%" align="right" nowrap></td>
                            <td width="60%">密碼需輸入<span lang="EN-US" style="font-family: Arial; color: red; font-weight: bold; font-size: small;"> 4</span> - <span lang="EN-US" style="font-family: Arial; color: red; font-weight: bold; font-size: small;">16  </span>個字元的英文、數字與符號，<br />
                                每組密碼使用天數為 <span lang="EN-US" style="font-family: Arial; color: #aa0033; font-weight: bold; font-size: small;">90</span> 天，到期請異動。
                            </td>
                        </tr>
                        <tr>
                            <td width="40%" align="right" nowrap>確認新密碼：
                            </td>
                            <td width="60%">
                                <asp:TextBox runat="server" ID="tbxCnfPassword" TextMode="password" MaxLength="16" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" colspan="2" align="center">
                                <asp:LinkButton ID="btnSubmit" runat="server" OnClick="btnSubmit_Click">修改密碼</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        $(function () {
            $("#frmPassWord").form();

            $("#btnSubmit").button({
                icons: { primary: 'ui-icon-pencil' }
            });
        });
    </script>
</body>
</html>
