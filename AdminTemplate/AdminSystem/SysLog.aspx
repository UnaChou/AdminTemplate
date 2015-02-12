<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysLog.aspx.cs" Inherits="AdminTemplate.AdminSystem.SysLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                            <td align="left" style="padding-left: 10px">目錄：後台登入記錄
                            </td>
                            <td align="right">
                                <!-- Function Menu -->
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table id="frmAccountCtrl" width="90%" cellpadding="5">
                        <tr>
                            <td align="left">日期區間：<asp:TextBox ID="TxB_ST" runat="server"></asp:TextBox>~<asp:TextBox ID="TxB_ED" runat="server"></asp:TextBox>
                                <span style="padding-left: 10px">查詢帳號：</span><asp:TextBox ID="txtAccount" runat="server" size="10"></asp:TextBox>
                                <asp:Button ID="Btn_Submit" runat="server" Text="查詢" OnClick="Btn_Submit_Click" />
                                <span id="QueryMsg" style="display: none;" runat="server"></span>
                                <span id="QueryMemo" runat="server"></span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="10">&nbsp;
                </td>
            </tr>
            <tr>
                <td id="LogList">
                    <asp:Repeater ID="Repeater1" runat="server" EnableViewState="false" Visible="false">
                        <HeaderTemplate>
                            <table width="90%" border="1" style="margin: auto">
                                <tr class="ui-widget-header" style="height: 25px">
                                    <th style="width: 40px">編號
                                    </th>
                                    <th style="width: 100px">帳號
                                    </th>
                                    <th style="width: 150px">時間
                                    </th>
                                    <th style="width: 140px">頁面名稱
                                    </th>
                                    <th style="width: 40px">操作
                                    </th>
                                    <th style="width: 110px">IP位址
                                    </th>
                                    <th style="width: 150px">備註
                                    </th>
                                    <th>頁面位址
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="ui-widget-content" style="height: 20px">
                                <td align="center">
                                    <%#Eval("RowIndex") %>                              
                                </td>
                                <td align="left">
                                    <%#Eval("Account")%>
                                </td>
                                <td align="center">
                                    <%#Eval("actionTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                </td>
                                <td align="left">
                                    <%#Eval("actionName")%>
                                </td>
                                <td align="center">
                                    <%#Eval("actionType")%>
                                </td>
                                <td align="center">
                                    <%#Eval("actionIP")%>
                                </td>
                                <td align="left">
                                    <%#Eval("note")%>
                                </td>
                                <td align="left">
                                    <%#Eval("actionNode")%>
                                </td>
                            </tr>
                            <%#(Eval("parameter") == DBNull.Value || Eval("parameter")==String.Empty) ? "": "<tr class='ui-widget-content'><td>參數</td><td colspan='7' style='width:730px;word-break:break-all;word-wrap:break-word;'>" + Server.HtmlEncode(Eval("parameter").ToString()) + "</td></tr>" %>

                           
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        jQuery(function ($) {
            $('#TxB_ST').datepicker({ changeMonth: true, changeYear: true, dateFormat: 'yy/mm/dd' });
            $('#TxB_ED').datepicker({ changeMonth: true, changeYear: true, dateFormat: 'yy/mm/dd' });
        });

        $('#frmAccountCtrl').form();

        var tbl = $('<div>' + '<%=tbl %>' + '</div>');
        var tbl_size = tbl.children('table').size();
        var QueryMsg = $('#QueryMsg span').html();
        if (tbl_size > 0) {
            $('#QueryMsg').show();
        }
        timerId = setInterval(function () {
            var tbl_newsize = tbl.children('table').size();
            if (tbl_newsize > 0) {
                $('body').append(tbl.children()[0]);
                if ((tbl_size - tbl_newsize) % 5 == 0) {
                    $('#QueryMsg span').html('資料載入中(' + ((tbl_size - tbl_newsize) * 100).toString() + ')...' + QueryMsg).effect('pulsate', { times: 1 });
                }

            } else { clearInterval(timerId); $('#QueryMsg span').html(QueryMsg); }
        }, 200);

    </script>
</body>
</html>
