<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountCtrl.aspx.cs" Inherits="AdminTamplateProgram.AccountCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        .style1 {
            width: 650px;
        }
    </style>
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
                            <td align="left" style="padding-left: 10px">目錄：系統設定 ► 帳號管理
                            </td>
                            <td align="right">
                                <!-- Function Menu -->
                                <% if ( _CanInsert == true ) {%>
                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://" onclick="$('#winAccount').dialog('open');">新增帳號</a></span><% }%>
                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom ui-state-active" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://">帳號管理</a></span>
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
                            <td align="left">
                             指定帳號：<input id="txtAccount" type="text" maxlength="16" />&nbsp;
                            <button id="btnAccountSearch">
                                查詢</button>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div id="divAccountData">
                        <asp:Repeater ID="rptAccountData" runat="server">
                            <HeaderTemplate>
                                <table id="tblAccountData" width="90%">
                                    <tr>
                                        <th>帳號
                                        </th>
                                        <th style="width: 150px">登入時間
                                        </th>
                                        <th style="width: 150px">登入錯誤時間
                                        </th>
                                        <th style="width: 90px">登入錯誤次數
                                        </th>
                                        <th style="width: 150px"></th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <span tmp="item_<%#Container.ItemIndex%>_account">
                                            <%#Eval("Account")%></span>
                                    </td>
                                    <td align="center">
                                        <%#Eval("LoginTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                    </td>
                                    <td align="center">
                                        <%#Eval("LogErrorTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                    </td>
                                    <td align="center">
                                        <%#Eval("LogErrorCount")%>
                                    </td>
                                    <td align="center">
                                        <% if (_CanModify == true)
                                           {%>
                                 
                                         <button id="btnEdit_<%#Container.ItemIndex%>_<%#Eval("AccountID")%>" class="btnEdit">
                                            編輯</button><% }%>
                                        <% if (_CanDelete == true)
                                           {%>
                                        <button id="btnDelete_<%#Container.ItemIndex%>_<%#Eval("AccountID")%>" class="btnDelete">
                                            刪除</button><% }%>
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
    <% if (_CanInsert == true || _CanModify == true)
       {%>
    <div id="winAccount">
        <form id="form2">
            <table id="frmAccount" width="98%" cellpadding="5">
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td align="right" width="150">設定帳號：&nbsp;
                                </td>
                                <td class="style1" colspan="3">
                                    <input id="txtAccountNew" name="txtAccountNew" type="text" maxlength="16" />&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right">設定密碼：&nbsp;
                                </td>
                                <td class="style1" colspan="3">
                                    <input id="txtPassword" name="txtPassword" type="password" maxlength="16" />&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right">確認密碼：&nbsp;
                                </td>
                                <td class="style1" colspan="3">
                                    <input id="txtPasswordConfirm" name="txtPasswordConfirm" type="password" maxlength="16" />&nbsp;
                                </td>
                            </tr>
                           
                            <tr>
                                <td></td>
                                <td class="style1">
                                    <div class="ui-DropTitle">
                                        角色清單
                                    </div>
                                    <div class="ui-DropTitle">
                                        設定角色清單
                                    </div>
                                </td>
                                <td></td>
                                <td class="style1">
                                    <!--<div class="ui-DropTitle">伺服器清單</div>
                            <div class="ui-DropTitle">設定伺服器清單</div>-->
                                </td>
                            </tr>
                            <tr>
                                <td>選擇角色：&nbsp;
                                </td>
                                <td class="style1">
                                    <div id="RoleTable" class="ui-DropGroup">
                                        <asp:Repeater ID="rptRoleList" runat="server">
                                            <ItemTemplate>
                                                <div class="ui-state-default" roleid="<%#Eval("RoleID")%>" ondblclick="RoleList_dbclick(this)">
                                                    <%#Eval("RoleName")%>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div id="AssignRole" class="ui-DropGroup">
                                    </div>
                                </td>                            
                            </tr>
                            <tr>
                                <td></td>
                                <td class="style1">
                                    <span class="ui-state-highlight ui-corner-all" style="padding: 2px 4px;">*請使用拖曳或雙擊的方式設定角色</span>&nbsp;<span id="btnRoleReset" onclick="RoleReset()">重置</span>
                                </td>
                                <td></td>
                                <td class="style1">
                                    <!--<span class="ui-state-highlight ui-corner-all" style="padding:2px 4px;">*請使用拖曳或雙擊的方式設定角色</span>&nbsp;<span id="btnGameReset" onclick="GameReset()">重置</span>-->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <input id="frmAccount_AccountID" type="hidden" />
    </div>  
    <% }%>
    <script type="text/javascript">
        $(function () {
            //*** form
            $('#frmAccount').form();
            $('#frmAccountCtrl').form();

            //*** button
            $('#btnAccountSearch').button({ icons: { primary: 'ui-icon-search' } })
            .click(GetAccountData);
            $('#btnRoleReset').button();
            $('#btnGameReset').button();

            WidgetRefresh();

            //*** Group
            $('#RoleTable').sortable({
                connectWith: '#AssignRole',
                placeholder: 'ui-state-highlight'
            }).disableSelection();

            $('#GameTable').sortable({
                connectWith: '#AssignGame',
                placeholder: 'ui-state-highlight'
            }).disableSelection();

            $('#AssignRole').sortable({
                connectWith: '#RoleTable',
                placeholder: 'ui-state-highlight'
            }).disableSelection();

            $('#AssignGame').sortable({
                connectWith: '#GameTable',
                placeholder: 'ui-state-highlight'
            }).disableSelection();

            
    <% if (_CanInsert == true || _CanModify == true)
       { %>
            //*** Dialog
            var optAdd = {
                title: '新增帳號', buttons: {
                    '新增帳號': function () {
                        AccountAdd(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                }
            };

            var optEdit = {
                title: '編輯帳號', buttons: {
                    '編輯帳號': function () {
                        AccountUpdate(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                }
            };

            $('#winAccount').dialog({
                autoOpen: false,
                height: 'auto',
                width: 980,
                position: ['center', 50],
                modal: true,
                title: '新增帳號',
                open: function (event, ui) {
                    if ($('#frmAccount_AccountID').val() == '') {
                        $('#txtAccountNew').removeAttr('disabled').focus();                       
                        $(this).dialog('option', optAdd);
                    } else {
                        $(this).dialog('option', optEdit);
                    }
                    $('#GameTable').html('');
                },
                close: function (event, ui) {
                    $(this).find('form')[0].reset();
                    $('#frmAccount_AccountID').val('');
                    RoleReset();
                    GameReset();
                    // $('#trDepart').show();
                    $('#txtAccountNew').attr('disabled', '').removeClass('ui-state-disabled');
                }
            });
    <% }%>
        });

        var Query = {
            //search params           
            _s_Account: function () { return $('#txtAccount').val(); },
            _s_params: '',
            _save: function () {
                this._s_params = '&Account=' + escape($.trim(Query._s_Account()));
            },

            //page element
            _div: $('#divAccountData'),
            _table: 'tblAccountData',
            _pager: $('#ex_pager'),
            //insert params
            _i_AccountNew: function () { return $('#txtAccountNew').val(); },
            _i_Password: function () { return $('#txtPassword').val(); },
            _i_PasswordConfirm: function () { return $('#txtPasswordConfirm').val(); },         
            _i_RoleID: function () {
                var roleid = '';
                $('#AssignRole').children('div').each(function () {
                    roleid = roleid + $(this).attr('roleid') + ',';
                }); return roleid;
            },

            //_i_GameID伺服器的功能
            _i_GameID: function () { return '0'; },
            //    _i_GameID: function() { var gameid='';
            //        $('#AssignGame').children('div').each( function() {
            //            gameid = gameid + $(this).attr('gameid') + ',';
            //        }); return gameid; },

            _i_AccountID: function () { return $('#frmAccount_AccountID').val(); },
            _i_params: function () {
                return '&AccountNew=' + escape($.trim(Query._i_AccountNew())) + '&Password=' + escape($.trim(Query._i_Password())) + '&RoleID=' + Query._i_RoleID() + '&GameID=' + Query._i_GameID();
            }
        };
        Query._save();

        function WidgetRefresh() {
            $('#' + Query._table).table()
            .find('.btnEdit').button({ icons: { primary: 'ui-icon-pencil' } }).click(RowCommand).end()
            .find('.btnDelete').button({ icons: { primary: 'ui-icon-closethick' } }).click(RowCommand);
        }

        var RoleList = $('#RoleTable').html();
        var GameList = $('#GameTable').html();
        var RoleEditList = $('#RoleTable').html();
        var GameEditList = $('#GameTable').html();
        var AssignRoleEditList = '';
        var AssignGameEditList = '';
        function RoleReset() {
            if (Query._i_AccountID() == '') {
                $('#RoleTable').html(RoleList);
                $('#AssignRole').html('');
            } else {
                $('#RoleTable').html(RoleEditList);
                $('#AssignRole').html(AssignRoleEditList);
            }
        }
        function GameReset() {
            if (Query._i_AccountID() == '') {
                $('#GameTable').html(GameList);
                $('#AssignGame').html('');
            } else {
                $('#GameTable').html(GameEditList);
                $('#AssignGame').html(AssignGameEditList);
            }
        }

        function RoleList_dbclick(obj) {
            if ($(obj).parent().attr('id') == 'RoleTable') {
                $('#AssignRole').append(obj);
            } else {
                $('#RoleTable').append(obj);
            }
        }
        function GameList_dbclick(obj) {
            if ($(obj).parent().attr('id') == 'GameTable') {
                $('#AssignGame').append(obj);
            } else {
                $('#GameTable').append(obj);
            }
        }

        function GetAccountData(p) {
            Query._save();
            ajaxAccountData(1);

            return false;
        }

        function ajaxAccountData(p) {
            var q = Query;
            q._div.hide();
            q._pager.hide();

            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=search' + q._s_params + '&p=' + p,
                error: onError2,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        WidgetRefresh();
                        q._div.show();
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
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                    data: 'fnMode=' + arr[0] + '&AccountID=' + arr[2],
                    error: onError3,
                    success: function (msg) {
                        //alert('msg= '+msg)                
                        var _arr = msg.toString().split(';');
                        //alert('_arr[0]= '+_arr[0] +'_arr[1]= '+_arr[1] )
                        var arrRole = _arr[0].split(',');
                        var arrGame = _arr[1].split(',');
                        //alert('arrRole= '+arrRole +'arrGame= '+arrGame )
                        var RoleItem;
                        var GameItem;
                        for (var i = 0; i < arrRole.length-1; i++) {
                            RoleItem = $('#RoleTable > div[roleid=' + arrRole[i] + ']');
                            if (RoleItem.size() == 1) {
                                $('#AssignRole').append(RoleItem);
                            }
                        }
                        for (var i = 0; i < arrGame.length-1; i++) {
                            GameItem = $('#GameTable > div[gameid=' + arrGame[i] + ']');
                            if (GameItem.size() == 1) {
                                $('#AssignGame').append(GameItem);
                            }
                        }

                        RoleEditList = $('#RoleTable').html();
                        GameEditList = $('#GameTable').html();
                        AssignRoleEditList = $('#AssignRole').html();
                        AssignGameEditList = $('#AssignGame').html();
                        RoleEditList = $('#RoleTable').html();
                        AssignRoleEditList = $('#AssignRole').html();
                    }
                });
                $('#frmAccount_AccountID').val($(this).attr('id'));            
                $('#txtAccountNew').val($.trim($(this).parent().parent().find('span[tmp=item_' + arr[1] + '_account]').html())).attr('disabled', 'disabled').addClass('ui-state-disabled');
                //$('#trDepart').hide();
                $('#winAccount').dialog('open');

            }
            <% } %>
    <% if (_CanDelete == true)
       { %>
            if (arr[0] == 'btnDelete') {
                if (confirm('是否確定刪除資料列？')) {
                    var q = Query;
                    $.ajax({
                        type: 'POST',
                        url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                        data: 'fnMode=' + arr[0] + '&args=' + $(this).attr('id') + q._s_params + '&p=' + q._pager.attr('pageno'),
                        error: onError4,
                        success: function (msg) {
                            if (msg.toString().indexOf('err:') == 0) {
                                alert(msg.toString().split(':')[1]);
                            } else {
                                var obj = $(msg);
                                q._div.html(obj.closest('#' + q._table).clone());
                                WidgetRefresh();
                                set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', parseInt(q._pager.attr('pageno'), 10));
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
        function AccountAdd(dialog) {
            var q = Query;

            if (q._i_AccountNew().length < 3 || q._i_AccountNew().length > 16) {
                alert('帳號長度 3 ~ 16 個字元');
                return;
            }

            if (q._i_Password().length < 4 || q._i_Password().length > 16) {
                alert('密碼長度 4 ~ 16 個字元');
                return;
            }

            if (q._i_Password() != q._i_PasswordConfirm()) {
                alert('輸入的密碼不一致');
                return;
            }

            if (q._i_RoleID().length == 0) {
                alert('請選擇角色');
                return;
            }

            if (q._i_GameID().length == 0) {
                alert('請選擇伺服器');
                return;
            }

            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=add' + q._i_params(),
                error: onError5,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        WidgetRefresh();
                        set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', 1);
                        $('#form1')[0].reset();
                        alert(obj.closest('#rtnData').attr('msg'));
                        $(dialog).dialog('close');
                    }
                }
            });
        }
        <% } %>

<% if (_CanModify == true)
   { %>

        function confirmSaved() {
            return confirm("是否確認編輯?");
        }

        function AccountUpdate(dialog) {
            if (!confirmSaved()) return;

            var q = Query;


            //    if(q._i_AccountNew().length < 3 || q._i_AccountNew().length > 16) {
            //        alert('密碼長度 3 ~ 16 個字元');
            //        return;
            //    }

            if (q._i_Password().length > 0) {
                if (q._i_Password().length < 4 || q._i_Password().length > 16) {
                    alert('密碼長度 4 ~ 16 個字元');
                    return;
                }
                if (q._i_Password() != q._i_PasswordConfirm()) {
                    alert('輸入的密碼不一致');
                    return;
                }
            }

            if (q._i_RoleID().length == 0) {
                alert('請選擇角色');
                return;
            }

            //    if(q._i_GameID().length == 0) {
            //        alert('請選擇伺服器');
            //        return;
            //    }

            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=btnUpdate&args=' + q._i_AccountID() + q._i_params() + q._s_params + '&p=' + q._pager.attr('pageno'),
                error: onError6,
                success: function (msg) {

                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        WidgetRefresh();
                        set_page(obj.closest('#rtnData').attr('total'), '<%=PageSize %>', parseInt(q._pager.attr('pageno'), 10));
                        alert(obj.closest('#rtnData').attr('msg'));
                        $(dialog).dialog('close');
                    }
                }
            });

        }
<% }%>

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
            Query._pager.html(page_temp).attr('pageno', index);
            Query._pager.pager();
            Query._pager.show();
        }

        function getData(p) {
            ajaxAccountData(p)
        }

        function onError() {
            alert('發生錯誤');
        }

        function onError2(n) {
            alert('發生錯誤2');
        }

        function onError3() {
            alert('發生錯誤3');
        }

        function onError4() {
            alert('發生錯誤4');
        }

        function onError5() {
            alert('發生錯誤5');
        }

        function onError6() {
            alert('發生錯誤6');
        }

    </script>
</body>
</html>
