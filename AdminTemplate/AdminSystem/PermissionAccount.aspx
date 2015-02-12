<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PermissionAccount.aspx.cs" Inherits="AdminTemplate.AdminSystem.PermissionAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                                <span class="ui-icon ui-icon-pin-s" style="margin-top: 10px">
                                </span>
                            </div>
                        </td>
                        <td align="left" style="padding-left: 10px">
                            目錄：系統設定 ► 帳號權限設定
                        </td>
                        <td align="right">
                            <!-- Function Menu -->
                            <span class="ui-tab ui-widget ui-state-default ui-corner-bottom" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                <a href="PermissionRole.aspx">角色權限設定</a></span>
                            <span class="ui-tab ui-widget ui-state-default ui-corner-bottom ui-state-active" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                <a href="javascript://">帳號權限設定</a></span>
                        </td>
                    </tr>
                </table>
                <hr />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table id="frmPermissionCtrl" width="90%" cellpadding="5">
                    <tr>
                        <td align="left">
                            選擇帳號：
                            <%--<asp:DropDownList ID="ddlDepartList" runat="server" onchange="bindAccount()">
                            </asp:DropDownList>
                            &nbsp;--%>
                            <asp:DropDownList ID="ddlAccountList" runat="server">
                            </asp:DropDownList>
                            &nbsp; 選擇節點：
                            <asp:DropDownList ID="ddlNodeList" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Text="所有目錄" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            <button id="btnNodeSearch">
                                查詢</button>
                        </td>
                    </tr>
                </table>
                <br />
                <div id="divNodeData" style="width: 90%;">
                    <asp:Repeater ID="rptNodeData" runat="server">
                        <HeaderTemplate>
                            <table gid="tblNodeData" width="100%">
                                <tr>
                                    <th>
                                        節點名稱
                                    </th>
                                    <th style="width: 50px">
                                        瀏覽
                                    </th>
                                    <th style="width: 50px">
                                        新增
                                    </th>
                                    <th style="width: 50px">
                                        修改
                                    </th>
                                    <th style="width: 50px">
                                        刪除
                                    </th>
                                    <th style="width: 300px">
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="left">
                                    <%# Eval("ParentID") == "0"? "<span class='ui-icon ui-icon-folder-open' style='display: inline-block'></span>" : Eval("NodeName")%>
                                </td>
                                <td align="center">
                                    <span class="<%# Eval("CanBrowse").ToString() == "True"? "ui-icon ui-icon-check": "ui-icon ui-icon-close ui-state-disabled"%>" style="display: inline-block">
                                    </span>
                                </td>
                                <td align="center">
                                    <span class="<%#Eval("CanInsert").ToString() == "True"? "ui-icon ui-icon-check": "ui-icon ui-icon-close ui-state-disabled"%>" style="display: inline-block">
                                    </span>
                                </td>
                                <td align="center">
                                    <span class="<%#Eval("CanModify").ToString() == "True"? "ui-icon ui-icon-check":"ui-icon ui-icon-close ui-state-disabled"%>" style="display: inline-block">
                                    </span>
                                </td>
                                <td align="center">
                                    <span class="<%#Eval("CanDelete").ToString() == "True"? "ui-icon ui-icon-check": "ui-icon ui-icon-close ui-state-disabled"%>" style="display: inline-block">
                                    </span>
                                </td>
                                <td align="center">
                                    <% if (_CanInsert == true || _CanModify == true)
                                       {%>
                                    <button id="btnBrowse_<%#Eval("ParentID")%>_<%#Eval("NodeID")%>" class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all" onclick="return QuickUpdate(this);">
                                        <span class="ui-button-text">
                                            僅瀏覽</span></button>
                                    <%#Eval("ParentID") == "0"?"<span style='display:none'>": ""%>
                                    <button id="btnAllFn_<%#Eval("ParentID")%>_<%#Eval("NodeID")%>" class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all" onclick="return QuickUpdate(this);">
                                        <span class="ui-button-text">
                                            全功能</span></button><%#Eval("ParentID") == "0"? "</span>": ""%>
                                    <button id="btnEdit_<%#Container.ItemIndex%>_<%#Eval("NodeID")%>" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" onclick="return RowCommand(this);" pid="<%#Eval("ParentID")%>" nodename="<%#Eval("NodeName")%>" permission="<%#Eval("CanBrowse")%>_<%#Eval("CanInsert")%>_<%#Eval("CanModify")%>_<%#Eval("CanDelete")%>">
                                        <span class="ui-button-icon-primary ui-icon ui-icon-pencil">
                                        </span>
                                        <span class="ui-button-text">
                                            編輯</span></button><% }%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </td>
        </tr>
    </table>
    </form>
    <% if( _CanInsert ==true || _CanModify ==true){%>
    <div id="winPermission">
        <form id="form2">
        <table id="frmPermission" width="98%" cellpadding="5">
            <tr>
                <td>
                    <table border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td align="right">
                                帳號名稱：&nbsp;
                            </td>
                            <td id="frmPermission_AccountName">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                節點名稱：&nbsp;
                            </td>
                            <td id="frmPermission_NodeName">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                權限設定：&nbsp;
                            </td>
                            <td>
                                <input id="CanBrowse" type="checkbox" name="frmPermissionBox" /><label for="CanBrowse">瀏覽</label>
                                <input id="CanInsert" type="checkbox" name="frmPermissionBox" /><label for="CanInsert">新增</label>
                                <input id="CanModify" type="checkbox" name="frmPermissionBox" /><label for="CanModify">修改</label>
                                <input id="CanDelete" type="checkbox" name="frmPermissionBox" /><label for="CanDelete">刪除</label>&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input id="frmPermission_NodeID" type="hidden" />
        </form>
    </div>
    <% }%>

    <script type="text/javascript">
        $(function () {
            //*** form
            $('#frmPermission').form();
            $('#frmPermissionCtrl').form();

            //*** button
            $('#btnNodeSearch').button({ icons: { primary: 'ui-icon-search' } }).click(GetNodeData);

            //WidgetRefresh();

	<% if (_CanInsert == true || _CanModify ==true){ %>
            //*** Dialog
            $('#winPermission').dialog({
                autoOpen: false,
                height: 'auto',
                width: 500,
                position: ['center', 50],
                modal: true,
                title: '權限設定',
                buttons: {
                    '送出': function () {
                        NodeUpdate(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                },
                open: function (event, ui) {

                },
                close: function (event, ui) {
                    $(this).find('form')[0].reset();
                    $('#frmPermission_NodeID').val('');
                    $('input[name=frmPermissionBox]:checkbox').each(function () {
                        $(this).removeAttr('disabled');
                    });
                }
            });
    <% } %>
        });

        function WidgetRefresh() {
            $("table[gid=tblNodeData]").table({ bHover: false, bClick: false });
        }

        //function bindAccount() {
        //    $.ajax({
        //        type: 'POST',
        //        url: location.pathname.substring(location.pathname.lastIndexOf('/')+1),
        //        data: 'fnMode=bindAccount&DepartID=' + $('#ddlDepartList').val(),
        //        error: onError,
        //        success: function(msg){
        //            if (msg.toString().indexOf('err:') == 0) {
        //                alert(msg.toString().split(':')[1]);
        //            } else {
        //                $('#ddlAccountList').replaceWith(msg);
        //                $('#frmPermissionCtrl').form();
        //            }
        //        }
        //    });
        //}

        var SearchParams = $('#ddlAccountList').val() + '_' + $('#ddlNodeList').val();
        function GetNodeData() {
            $('#frmPermission_AccountName').html($('#ddlAccountList option:selected').text());
            SearchParams = $('#ddlAccountList').val() + '_' + $('#ddlNodeList').val();
            $('#divNodeData').hide();
          
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=search&ParentID=' + $('#ddlNodeList').val() + '&AccountID=' + $('#ddlAccountList').val(),
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        $('#divNodeData').html(obj.closest('table, br'));
                        WidgetRefresh();
                        $('#divNodeData').show();
                    }
                }
            });
            return false;
        }

        function RowCommand(button) {
            var arr = $(button).attr('id').split('_');
    <% if (_CanInsert ==true||_CanModify ==true){ %>
            if (arr[0] == 'btnEdit') {
                $('#frmPermission_NodeID').val($(button).attr('id'));
                $('#frmPermission_NodeName').html($(button).attr('nodename'));
                if ($(button).attr('pid') == '0') {
                    $('#CanInsert, #CanModify, #CanDelete').attr('disabled', 'disabled');
                }

                var arrPermission = $(button).attr('permission').split('_');
                if (arrPermission[0] == 'True') {
                    $('#CanBrowse').attr('checked', true);
                }

                if (arrPermission[1] == 'True') {
                    $('#CanInsert').attr('checked', true);
                }

                if (arrPermission[2] == 'True') {
                    $('#CanModify').attr('checked', true);
                }

                if (arrPermission[3] == 'True') {
                    $('#CanDelete').attr('checked', true);
                }

                $('#winPermission').dialog('open');
            }
    <% } %>
            return false;
        }

<% if( _CanInsert == true || _CanModify == true){ %>
        function NodeUpdate(dialog) {
            var params = '&permission=';
            params += (($('#CanBrowse').attr('checked')) ? '1' : '0');
            params += '_' + (($('#CanInsert').attr('checked')) ? '1' : '0');
            params += '_' + (($('#CanModify').attr('checked')) ? '1' : '0');
            params += '_' + (($('#CanDelete').attr('checked')) ? '1' : '0');
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=btnUpdate&args=' + $('#frmPermission_NodeID').val() + '_' + SearchParams + params,
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        $('#divNodeData').html(obj.closest('table, br'));
                        WidgetRefresh();
                        alert(obj.closest('#rtnData').attr('msg'));
                        $(dialog).dialog('close');
                    }
                }
            });
        }

        function QuickUpdate(button) {
            var args = $(button).attr('id');
            var params = (args.split('_')[0] == 'btnAllFn') ? '&permission=1_1_1_1' : '&permission=1_0_0_0';
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=btnUpdate&args=' + args + '_' + SearchParams + params,
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        $('#divNodeData').html(obj.closest('table, br'));
                        WidgetRefresh();
                        alert(obj.closest('#rtnData').attr('msg'));
                    }
                }
            });
            return false;
        }
<% } %>

        function Tip(css, icon, text) {
            return $(document.createElement('div')).addClass('ui-state-' + css + ' ui-corner-all').css({ 'padding': '2px 4px', 'display': 'inline-block' })
            .append('<span class="ui-icon ui-icon-' + icon + '" style="display:block;position:absolute;"></span><span style="padding-left:20px">' + text + '</span>')
        }

        function onError() {
            alert('發生錯誤');
        }
</script>
</body>
</html>
