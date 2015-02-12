<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleCtrl.aspx.cs" Inherits="AdminTemplate.AdminSystem.RoleCtrl" %>

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
                            <td align="left" style="padding-left: 10px">目錄：系統設定 ► 角色管理
                            </td>
                            <td align="right">
                                <!-- Function Menu -->
                                <% if( _CanInsert==true){%>
                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://" onclick="$('#winRole').dialog('open');">新增角色</a></span><% }%>
                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom ui-state-active" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://">角色管理</a></span>
                            </td>
                        </tr>
                    </table>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table id="frmRoleAdd" width="90%" cellpadding="5">
                        <tr>
                            <td align="left"></td>
                        </tr>
                    </table>
                    <br />
                    <div id="divRoleData">
                        <asp:Repeater ID="rptRoleData" runat="server">
                            <HeaderTemplate>
                                <table id="tblRoleData" width="90%">
                                    <tr>
                                        <th>角色名稱&nbsp;
                                        </th>
                                        <th style="width: 70px">角色等級&nbsp;
                                        </th>
                                        <th style="width: 150px">建立日期&nbsp;
                                        </th>
                                        <th style="width: 150px">修改日期&nbsp;
                                        </th>
                                        <th style="width: 150px">&nbsp;
                                        </th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td align="left">
                                        <span tmp="item_<%#Eval("RowIndex")%>" id="item_RoleName_<%#Eval("RowIndex")%>">
                                            <%#Eval("RoleName")%></span>
                                        <span tmp="edit_<%#Eval("RowIndex")%>" style="display: none">
                                            <input id="txtRoleName_<%#Eval("RowIndex")%>" type="text" /></span>
                                    </td>
                                    <td align="center">
                                        <span tmp="item_<%#Eval("RowIndex")%>" id="item_RoleLevel_<%#Eval("RowIndex")%>" data="<%#Eval("RoleLevel")%>">
                                            <%# Eval("RoleLevel").ToString().Replace("0", "一般").Replace("1", "管理").Replace("2", "高級")%></span>
                                        <span tmp="edit_<%#Eval("RowIndex")%>" style="display: none">
                                            <select id="selRoleLevel_<%#Eval("RowIndex")%>">
                                                <option value="0">一般</option>
                                                <option value="2">高級</option>
                                                <option value="1">管理</option>
                                            </select></span>
                                    </td>
                                    <td align="center">
                                        <%#Eval("CreateDate", "{0:yyyy/MM/dd HH:mm:ss}")%>&nbsp;
                                    </td>
                                    <td align="center">
                                        <%#Eval("LastModifiedDate","{0:yyyy/MM/dd HH:mm:ss}")%>&nbsp;
                                    </td>
                                    <td align="center">
                                        <span tmp="item_<%#Eval("RowIndex")%>">
                                            <% if (_CanModify == true)
                                               {%>
                                            <button id="btnEdit_<%#Eval("RowIndex")%>_<%#Eval("RoleID")%>" class="btnEdit" title="編輯">
                                                編輯</button><% }%>
                                            <% if (_CanDelete == true)
                                               {%>
                                            <button id="btnDelete_<%#Eval("RowIndex")%>_<%#Eval("RoleID")%>" class="btnDelete" title="刪除">
                                                刪除</button><% }%></span>
                                        <span tmp="edit_<%#Eval("RowIndex")%>" style="display: none">
                                            <% if (_CanModify == true)
                                               {%>
                                            <button id="btnUpdate_<%#Eval("RowIndex")%>_<%#Eval("RoleID")%>" class="btnUpdate" title="儲存">
                                                儲存</button>
                                            <button id="btnCancel_<%#Eval("RowIndex")%>_<%#Eval("RoleID")%>" class="btnCancel" title="取消">
                                                取消</button><% }%></span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <br />
                    <div id="ex_pager" pageno="1" style="width: 90%; display: none;">
                        <table>
                            <tbody>
                                <tr>
                                    <td align="left">每頁筆數:
                                    <%=PageSize%>, 總筆數: {total}
                                    </td>
                                    <td style="width: 50px">
                                        <a href="#last">上一頁</a>
                                    </td>
                                    <td numlist="">
                                        <a>1</a>
                                    </td>
                                    <td style="width: 50px">
                                        <a href="#next">下一頁</a>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <% if (_CanInsert == true)
       {%>
    <div id="winRole">
        <form id="form2">
            <table id="frmRole" width="98%" cellpadding="5">
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td align="right">角色名稱：&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRoleName" runat="server" MaxLength="10"></asp:TextBox>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right">角色等級：&nbsp;
                                </td>
                                <td>
                                    <span id="spRoleLevel">
                                        <input id="RoleLevel0" name="RoleLevel" type="radio" value="0" checked="checked" onclick="swRoleLevel(this)" title="不具任何節點的權限, 須自行設定角色對應的權限." /><label for="RoleLevel0">一般</label>
                                        <input id="RoleLevel2" name="RoleLevel" type="radio" value="2" onclick="swRoleLevel(this)" title="除系統設定節點外, 具有全部節點的權限." /><label for="RoleLevel2">高級</label>
                                        <input id="RoleLevel1" name="RoleLevel" type="radio" value="1" onclick="swRoleLevel(this)" title="具有全部節點的權限, 不須額外設定角色對應的權限." /><label for="RoleLevel1">管理</label></span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div id="RoleLevelMemo" class="ui-state-highlight ui-corner-all" style="padding: 2px 4px;">
                                        不具任何節點的權限, 須自行設定角色對應的權限.
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <% }%>

    <script type="text/javascript">
        $(function () {
            //*** form
            $('#frmRole').form();

            //*** button
            $('#spRoleLevel').buttonset();

            WidgetRefresh();

    <% if (_CanInsert == true)
       { %>
            $('#winRole').dialog({
                autoOpen: false,
                height: 'auto',
                width: 500,
                position: ['center', 50],
                modal: true,
                title: '新增角色',
                buttons: {
                    '新增角色': function () {
                        RoleAdd(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                },
                close: function (event, ui) {
                    $(this).find('form')[0].reset();
                    swRoleLevel($('input[name="RoleLevel"]:checked'));
                }
            });
    <% } %>
        });

        function WidgetRefresh() {
            $('#tblRoleData').table()
            .find('.btnEdit').button({ icons: { primary: 'ui-icon-pencil' } }).click(RowCommand).end()
            .find('.btnDelete').button({ icons: { primary: 'ui-icon-closethick' } }).click(RowCommand).end()
            .find('.btnUpdate').button({ icons: { primary: 'ui-icon-gear' } }).click(RowCommand).end()
            .find('.btnCancel').button({ icons: { primary: 'ui-icon-cancel' } }).click(RowCommand);
        }

        function swRoleLevel(obj) {
            $('#RoleLevelMemo').html($(obj).attr('title'));
        }

        function getData(p) {
            $('#divRoleData').hide();
            $("#ex_pager").hide();
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=search&p=' + p,
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        $('#divRoleData').html(obj.closest('#tblRoleData').clone());
                        WidgetRefresh();
                        $('#divRoleData').show();
                        set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', p);
                    }
                }
            });
        }

        function RowCommand() {
            var arr = $(this).attr('id').split('_');
    <% if (_CanModify == true)
       { %>
    if (arr[0] == 'btnEdit') {
        $('#tblRoleData').find('span[tmp*=item]').css('display', '').end()
        .find('span[tmp*=edit]').css('display', 'none').end()
        .find('span[tmp=item_' + arr[1] + ']').css('display', 'none').end()
        .find('span[tmp=edit_' + arr[1] + ']').css('display', '').end()
        .find('input[id=txtRoleName_' + arr[1] + ']').val($.trim($('#tblRoleData span[id=item_RoleName_' + arr[1] + ']').html())).end()
        .find('select[id=selRoleLevel_' + arr[1] + ']').val($('#tblRoleData span[id=item_RoleLevel_' + arr[1] + ']').attr('data'));
    }

    if (arr[0] == 'btnCancel') {
        $('#tblRoleData').find('span[tmp=item_' + arr[1] + ']').css('display', '').end()
        .find('span[tmp=edit_' + arr[1] + ']').css('display', 'none');
    }

    if (arr[0] == 'btnUpdate') {
        $('#tblRoleData').find('span[tmp*=item]').css('display', '').end()
        .find('span[tmp*=edit]').css('display', 'none');
        $.ajax({
            type: 'POST',
            url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
            data: 'fnMode=' + arr[0] + '&args=' + $(this).attr('id') + '_' + $('#ex_pager').attr('pageno') + '&RoleName=' + escape($.trim($('#tblRoleData input[id=txtRoleName_' + arr[1] + ']').val())) + '&RoleLevel=' + $('#tblRoleData select[id=selRoleLevel_' + arr[1] + ']').val(),
            error: onError,
            success: function (msg) {
                if (msg.toString().indexOf('err:') == 0) {
                    alert(msg.toString().split(':')[1]);
                } else {
                    var obj = $(msg);
                    $('#divRoleData').html(obj.closest('#tblRoleData').clone());
                    WidgetRefresh();
                    set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', parseInt($('#ex_pager').attr('pageno'), 10));
                    alert(obj.closest('#rtnData').attr('msg'));
                }
            }
        });
    }
    <%} %>
    <% if (_CanDelete == true)
       { %>
    if (arr[0] == 'btnDelete') {
        $('#tblRoleData').find('span[tmp*=item]').css('display', '').end()
        .find('span[tmp*=edit]').css('display', 'none');
        if (confirm('是否確定刪除資料列？')) {
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=' + arr[0] + '&args=' + $(this).attr('id') + '_' + $('#ex_pager').attr('pageno'),
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        $('#divRoleData').html(obj.closest('#tblRoleData').clone());
                        WidgetRefresh();
                        set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', parseInt($('#ex_pager').attr('pageno'), 10));
                        alert(obj.closest('#rtnData').attr('msg'));
                    }
                }
            });
        }
    }
    <% } %>
    return false;
}

<% if (_CanInsert == true)
   { %>
        function RoleAdd(dialog) {
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=add&RoleName=' + $('#txtRoleName').val() + '&RoleLevel=' + $('input[name="RoleLevel"]:checked').val(),
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        $('#divRoleData').html(obj.closest('#tblRoleData').clone());
                        WidgetRefresh();
                        set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', 1);
                        alert(obj.closest('#rtnData').attr('msg'));
                        $(dialog).dialog('close');
                    }
                }
            });
            return false;
        }
<% } %>

        var dv_temp = '';
        set_page('<%=Total %>', '<%=PageSize %>', 1);
        function set_page(total, size, index) {
            if (dv_temp == '') { dv_temp = $('#ex_pager').html().toString(); }
            var page_temp = dv_temp;
            var page_count = (total != 0 && total % size == 0) ? total / size : (Math.floor(total / size)) + 1;
            var num_start = Math.floor((index - 1) / 10) * 10 + 1;
            var num_end = (num_start + 9 > page_count) ? page_count : num_start + 9;

            var last_temp = /<a href=\x22#last\x22([^~]*?)<\x2Fa>/i;
            var next_temp = /<a href=\x22#next\x22([^~]*?)<\x2Fa>/i;
            var num_temp = /<td NumList=([^~]*?)<\x2Ftd>/i;
            var str_num = '';

            page_temp = page_temp.replace('{total}', total);

            if (index == 1) {
                page_temp = page_temp.replace(last_temp, '');
            }

            if (index == page_count) {
                page_temp = page_temp.replace(next_temp, '');
            }

            if (index > 1) {
                page_temp = page_temp.replace('#last', 'javascript:getData(' + (index - 1).toString() + ')');
            }

            if (index < page_count) {
                page_temp = page_temp.replace('#next', 'javascript:getData(' + (index + 1).toString() + ')');
            }

            for (var i = num_start; i <= num_end; i++) {
                if (i == index) {
                    str_num += '<td style="width:25px"><a class="ui-state-active">' + i.toString() + '</a></td>';
                } else {
                    str_num += '<td style="width:25px"><a href="javascript:getData(' + i.toString() + ')">' + i.toString() + '</a></td>';
                }
            }

            page_temp = page_temp.replace(num_temp, str_num);
            $('#ex_pager').html(page_temp).attr('pageno', index);
            $("#ex_pager").pager();
            $("#ex_pager").show();
        }

        function onError() {
            alert('發生錯誤');
        }
    </script>
</body>
</html>
