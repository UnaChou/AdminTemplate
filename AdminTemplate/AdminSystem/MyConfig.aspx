<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyConfig.aspx.cs" Inherits="AdminTemplate.AdminSystem.MyConfig" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table border="0" width="100%" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top" style="width: 15px">
                                <div class="ui-state-default ui-corner-right" title="關閉選單" style="width: 15px; height: 35px; cursor: pointer" onclick="switchFrameCols(this)" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <span class="ui-icon ui-icon-pin-s" style="margin-top: 10px"></span>
                                </div>
                            </td>
                            <td align="left" style="padding-left: 10px">目錄：系統設定 ► 個人設置
                            </td>
                            <td align="right">
                                <!-- Function Menu -->
                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom ui-state-active" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://">個人設置</a></span>
                            </td>
                        </tr>
                    </table>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <div id="page_tab" style="width: 90%">
                        <ul>
                            <li><a href="#tabs-1">主題設置</a></li>
                            <li><a href="#tabs-2">修改密碼</a></li>
                        </ul>
                        <div id="tabs-1">
                            <div style="float: left; cursor: pointer; padding: 3px 3px;" theme="cupertino">
                                <img src="../App_Themes/cupertino/theme_90_cupertino.png" />
                            </div>
                            <div style="float: left; cursor: pointer; padding: 3px 3px;" theme="black-tie">
                                <img src="../App_Themes/black-tie/theme_90_black_tie.png" />
                            </div>
                            <div style="float: left; cursor: pointer; padding: 3px 3px;" theme="ui-lightness">
                                <img src="../App_Themes/ui-lightness/theme_90_ui_light.png" />
                            </div>
                            <div style="float: left; cursor: pointer; padding: 3px 3px;" theme="sunny">
                                <img src="../App_Themes/sunny/theme_90_sunny.png" />
                            </div>
                            <div style="float: left; cursor: pointer; padding: 3px 3px;" theme="start">
                                <img src="../App_Themes/start/theme_90_start_menu.png" />
                            </div>
                            <div style="float: left; cursor: pointer; padding: 3px 3px;" theme="hot-sneaks">
                                <img src="../App_Themes/hot-sneaks/theme_90_hot_sneaks.png" />
                            </div>
                            <div style="clear: both; visibility: hidden;">
                            </div>
                        </div>
                        <div id="tabs-2" style="text-align: left">
                         
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr style="height: 35px; vertical-align: top">
                                        <td align="right">當前密碼：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPw" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>&nbsp;
                                        </td>
                                        <td name="info"></td>
                                    </tr>
                                    <tr style="height: 35px; vertical-align: top">
                                        <td align="right">新 密 碼：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPwNew" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>&nbsp;
                                        </td>
                                        <td name="info"></td>
                                    </tr>
                                    <tr style="height: 35px; vertical-align: top">
                                        <td align="right">確認密碼：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPwConfirm" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>&nbsp;
                                        </td>
                                        <td name="info"></td>
                                    </tr>
                                    <tr style="height: 35px; vertical-align: top">
                                        <td></td>
                                        <td>
                                            <button id="btn_t2_update">
                                                保存</button><asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" OnClick="Button1_Click"  />
                                        </td>
                                        <td>
                                            <asp:HiddenField ID="TabIndex" runat="server" Value="0" />
                                        </td>
                                    </tr>
                                </table>
                         
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        $(function () {
            //*** tab
            $('#page_tab').tabs({
                select: function (event, ui) {
                    $('#TabIndex').val(ui.index);
                }, selected: $('#TabIndex').val()
            });

            //*** form
            $('#tabs-2').form();

            $('#btn_t2_update').button({ icons: { primary: 'ui-icon-power' } })
        .click(UpdatePW);

            $('#txtPw, #txtPwNew, #txtPwConfirm').focus(function () {
                $(this).parent().parent().children('td[name=info]').empty().append(Tip('highlight', 'info', '密碼須為 4 ~ 16 個字元，須包含英文、數字與符號'));
            })
        .blur(function () {
            $(this).parent().parent().children('td[name=info]').empty();
        });


            $('#tabs-1 div').click(function () {
                SetTheme($(this).attr('theme'));
            });
        });

        function SetTheme(name) {
            var today = new Date();
            today.setDate(today.getDate() + 365);
            document.cookie = "jquery-ui-theme=" + name + "; path=/; expires=" + today.toGMTString();
            top.frames[0].location.href = top.frames[0].location.href;
            top.frames[1].location.href = top.frames[1].location.href;
            top.frames[2].location.href = top.frames[2].location.href;
        }

        function Tip(css, icon, text) {
            return $(document.createElement('div')).addClass('ui-state-' + css + ' ui-corner-all').css({ 'padding': '2px 4px', 'display': 'inline-block' })
        .append('<span class="ui-icon ui-icon-' + icon + '" style="display:block;position:absolute;"></span><span style="padding-left:20px">' + text + '</span>')
        }

        function UpdatePW() {
            var txtPw = $('#txtPw');
            var txtPwNew = $('#txtPwNew');
            var txtPwConfirm = $('#txtPwConfirm');

            if (txtPw.val().length < 4 || txtPw.val().length > 16) {
                txtPw.parent().parent().children('td[name=info]').empty().append(Tip('error', 'alert', '密碼長度不正確，應為4～16個字元'));
                return false;
            }

            if (txtPwNew.val().length < 4 || txtPwNew.val().length > 16) {
                txtPwNew.parent().parent().children('td[name=info]').empty().append(Tip('error', 'alert', '密碼長度不正確，應為4～16個字元'));
                return false;
            }

            if (txtPwNew.val() != txtPwConfirm.val()) {
                txtPwConfirm.parent().parent().children('td[name=info]').empty().append(Tip('error', 'alert', '兩次輸入的密碼不一致，請重新輸入'));
                return false;
            }

            $('#Button1').click();
            return false;
        }
    </script>    
</body>
</html>
