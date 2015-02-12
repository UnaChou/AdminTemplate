<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NodeCtrl.aspx.cs" Inherits="AdminTamplateProgram.NodeCtrl" %>

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
                            <td align="left" style="padding-left: 10px">目錄：系統設定 ► 節點管理
                            </td>
                            <td align="right">
                                <!-- Function Menu -->
                                <% if ( _CanInsert ==true)
                                   {%>

                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://" onclick="setNote();$('#winNode').dialog('open');">新增節點</a></span><% }%>
                                <span class="ui-tab ui-widget ui-state-default ui-corner-bottom ui-state-active" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                    <a href="javascript://">管理節點</a></span>
                            </td>
                        </tr>
                    </table>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table id="frmNodeCtrl" width="90%" cellpadding="5">
                        <tr>
                            <td align="left">選擇節點：
                            <asp:DropDownList ID="ddlNodeList" runat="server" AppendDataBoundItems="true" onchange="GetNodeData()">
                                <asp:ListItem Text="所有目錄" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <span class="ui-icon ui-icon-folder-open" style="display: inline-block"></span>
                    目錄節點
                <span class="ui-icon ui-icon ui-icon-document" style="display: inline-block"></span>
                    頁面節點
                <span class="ui-icon ui-icon ui-icon-extlink" style="display: inline-block"></span>
                    子頁面節點
                <span class="ui-icon ui-icon ui-icon-document-b" style="display: inline-block"></span>
                    原視窗
                <span class="ui-icon ui-icon ui-icon-newwin" style="display: inline-block"></span>
                    新視窗
                <div id="divNodeData">
                    <asp:Repeater ID="rptNodeData" runat="server">
                        <HeaderTemplate>
                            <table id="tblNodeData" width="90%">
                                <tr>
                                    <th style="width: 50px">編號
                                    </th>
                                    <th style="width: 160px">節點名稱
                                    </th>
                                    <th>節點網址
                                    </th>
                                    <th style="width: 150px">
                                        <% if (_CanModify == true)
                                           {%>
                                        <button id="btnSort">
                                            排序</button><% }%>
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                    <%#Eval("NodeID")%>
                                </td>
                                <td align="left">
                                    <%#Eval("NodeType") == "0"? "<span class='ui-icon ui-icon-folder-open' style='display: inline-block'></span>": ""%>
                                    <%#Eval("NodeType") == "1"? "<span class='ui-icon ui-icon-document' style='display: inline-block'></span>": ""%>
                                    <%#Eval("NodeType") == "2"? "<span class='ui-icon ui-icon-extlink' style='display: inline-block'></span>": ""%>
                                    <span tmp="item_<%#Container.ItemIndex%>_nodename">
                                        <%#Eval("NodeName")%></span>
                                </td>
                                <td align="left">
                                    <%# (Eval("NodeType") != "0" && Eval("NodeTarget") == "0") ? "<span class='ui-icon ui-icon-document-b' style='display: inline-block'></span>":"" %>
                                    <%# (Eval("NodeType") != "0" && Eval("NodeTarget") == "1")?  "<span class='ui-icon ui-icon-newwin' style='display: inline-block'></span>":""%>
                                    <span tmp="item_<%#Container.ItemIndex%>_nodeurl">
                                        <%#Eval("NodeUrl")%></span>
                                </td>
                                <td align="center">
                                    <% if (_CanModify == true)
                                       {%>
                                    <button id="btnEdit_<%#Container.ItemIndex%>_<%#Eval("NodeID")%>" class="btnEdit" title="編輯" nodetype="<%#Eval("NodeType")%>" nodetarget="<%#Eval("NodeTarget")%>">
                                        編輯</button><%}%>
                                    <% if (_CanDelete == true)
                                       {%>
                                    <button id="btnDelete_<%#Container.ItemIndex%>_<%#Eval("NodeID")%>" class="btnDelete" title="刪除">
                                        刪除</button><% }%>
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
    <% if (_CanInsert == true || _CanModify == true)
       {%>
    <div id="winNode">
        <form id="form2">
            <table id="frmNode" width="98%" cellpadding="5">
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td align="right">節點類型：&nbsp;
                                </td>
                                <td id="tdNodeType">
                                    <input id="NodeType0" name="NodeType" type="radio" value="0" checked="checked" onclick="swNodeType(this)" title="建立一個新目錄" /><label for="NodeType0">目錄節點</label>
                                    <input id="NodeType1" name="NodeType" type="radio" value="1" onclick="swNodeType(this)" title="建立一個顯示在目錄下的新頁面" /><label for="NodeType1">頁面節點</label>
                                    <input id="NodeType2" name="NodeType" type="radio" value="2" onclick="swNodeType(this)" title="不會顯示在目錄下. 通常是 #頁面結點# 的相關功能頁並具有獨立的權限設定.<br />若要繼承 #頁面節點# 的權限請參考<span class='ui-icon ui-icon-info' style='display:inline-block; cursor:pointer;' title='子頁面繼承 #頁面節點# 的權限設定方式' onclick='openNodeMemo()'></span> (不用建立 #子頁面節點#)." /><label for="NodeType2">子頁面節點</label>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div id="NodeTypeMemo" class="ui-state-highlight ui-corner-all" style="padding: 2px 4px;">
                                        建立一個新目錄
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">節點名稱：&nbsp;
                                </td>
                                <td>
                                    <input id="txtNodeName" name="txtNodeName" type="text" maxlength="30" size="30" />&nbsp;
                                </td>
                            </tr>
                            <tr id="trNodeUrl" style="display: none;">
                                <td align="right">節點網址：&nbsp;
                                </td>
                                <td>
                                    <input id="txtNodeUrl" name="txtNodeUrl" type="text" maxlength="250" size="50" />&nbsp;
                                </td>
                            </tr>
                            <tr id="trNodeTarget" style="display: none;">
                                <td align="right">節點名稱：&nbsp;
                                </td>
                                <td id="tdNodeTarget">
                                    <input id="NodeTarget0" name="NodeTarget" type="radio" value="0" checked="checked" title="" /><label for="NodeTarget0">原視窗</label>
                                    <input id="NodeTarget1" name="NodeTarget" type="radio" value="1" title="" /><label for="NodeTarget1">新視窗</label>
                                </td>
                            </tr>
                            <tr id="trNodeParent" style="display: none;">
                                <td align="right">父層節點：&nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlNodeParent" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <input id="frmNode_NodeID" type="hidden" />
        </form>
    </div>
    <div id="winNodeMemo">
        <table id="frmNodeMemo" width="98%" cellpadding="5">
            <tr>
                <td>在子頁面的伺服器端程式上建立 Page_Init, 並設定自帶參數 _thisURL 的值同 #頁面節點# 的網址. 參考範例如下：<br />
                    <br />
                    <div style="color: Green;">
                        'public void Page_Init(object sender, EventArgs e){<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;'Me._thisURL = "/AdminSystem/NodeCtrl.aspx"<br />
                        '}
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <% }%>
    <% if (_CanModify == true)
       {%>
    <div id="winNodeSort">
        <form id="form3">
            <table id="frmNodeSort" width="98%" cellpadding="5">
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td align="right" style="width: 70px;">變動節點：&nbsp;
                                </td>
                                <td style="width: 140px;">
                                    <span id="SourceNode" class="ui-state-default" style="height: 18px; padding: 2px; margin: 5px;"></span>
                                </td>
                                <td rowspan="3">
                                    <div id="divNodeSort" class="ui-DropGroup" style="width: 200px;">
                                        <asp:Repeater ID="rptNodeSort" runat="server">
                                            <ItemTemplate>
                                                <div class="ui-state-default" nodeid="<%#Eval("NodeID")%>" onclick="SortSelect(this)">
                                                    <%#Eval("NodeName")%>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">目標節點：&nbsp;
                                </td>
                                <td>
                                    <span id="TargetNode" class="ui-state-default" style="height: 18px; padding: 2px; margin: 5px;"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">排序方法：&nbsp;
                                </td>
                                <td id="tdSortType">
                                    <input id="SortType0" name="SortType" type="radio" value="0" checked="checked" /><label for="SortType0">與目標節點互換</label>
                                    <input id="SortType1" name="SortType" type="radio" value="1" /><label for="SortType1">插入目標節點上方</label>
                                    <input id="SortType2" name="SortType" type="radio" value="2" /><label for="SortType2">插入目標節點下方</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <span class="ui-state-highlight ui-corner-all" style="padding: 2px 4px;">從右側清單中選取要變動的節點以及目標節點並選取排序方法</span>
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
        function setNote() {
            $('#NodeType0').attr('title', '建立一個新目錄');
            $('#NodeType1').attr('title', '建立一個顯示在目錄下的新頁面');
            $('#NodeType2').attr('title', '不會顯示在目錄下. 通常是 #頁面結點# 的相關功能頁並具有獨立的權限設定.<br />若要繼承 #頁面節點# 的權限請參考<span class=\'ui-icon ui-icon-info\' style=\'display:inline-block; cursor:pointer;\' title=\'子頁面繼承 #頁面節點# 的權限設定方式\' onclick=\'openNodeMemo()\'></span> (不用建立 #子頁面節點#).');
        }

        $(function () {
            //*** form
            $('#frmNode').form();
            $('#frmNodeCtrl').form();

            //*** button
            $('#tdNodeType').buttonset();
            $('#tdNodeTarget').buttonset();
            $('#tdSortType').buttonsetv({
                margin: '1px',
                height: '20px'
            });

            WidgetRefresh();

	<% if (_CanInsert == true || _CanModify == true)
    { %>
            //*** Dialog
            var optAdd = {
                title: '新增節點', buttons: {
                    '新增節點': function () {
                        NodeAdd(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                }
            };

            var optEdit = {
                title: '編輯結點', buttons: {
                    '編輯結點': function () {
                        NodeUpdate(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                }
            };

            $('#winNode').dialog({
                autoOpen: false,
                height: 'auto',
                width: 600,
                position: ['center', 50],
                modal: true,
                title: '新增節點',
                open: function (event, ui) {
                    swNodeType($('input[name="NodeType"]:checked'));
                    if ($('#frmNode_NodeID').val() == '') {
                        $(this).dialog('option', optAdd);
                    } else {
                        $(this).dialog('option', optEdit);
                    }
                },
                close: function (event, ui) {
                    $(this).find('form')[0].reset();
                    $('#frmNode_NodeID').val('');
                    $('input[name=NodeType]:radio').each(function () {
                        $(this).removeAttr('disabled');
                    });
                }
            });

            $('#winNodeMemo').dialog({
                autoOpen: false,
                height: 'auto',
                width: 600,
                position: ['center', 50],
                modal: true,
                title: '子頁面繼承 #頁面節點# 的權限設定方式'
            });
            <%}%>
    
    <% if (_CanModify == true)
       { %>
            $('#winNodeSort').dialog({
                autoOpen: false,
                height: 'auto',
                width: 550,
                position: ['center', 50],
                modal: true,
                title: '排序',
                buttons: {
                    '送出': function () {
                        NodeSort(this);
                    },
                    '取消': function () {
                        $(this).dialog('close');
                    }
                },
                close: function (event, ui) {
                    $(this).find('form')[0].reset();
                    $('#SourceNode, #TargetNode').html('').attr('nodeid', '');
                    $('#divNodeSort > div').removeClass('ui-state-highlight');
                }
            });
    <% } %>
        });

        var Query = {
            //search params
            _s_NodeID: function () { return $('#ddlNodeList').val(); },
            //page element
            _div: $('#divNodeData'),
            _table: 'tblNodeData'
        };

        function WidgetRefresh() {
            $('#' + Query._table).table()
            .find('.btnEdit').button({ icons: { primary: 'ui-icon-pencil' } }).click(RowCommand).end()
            .find('.btnDelete').button({ icons: { primary: 'ui-icon-closethick' } }).click(RowCommand).end()
            .find('#btnSort').button({ icons: { primary: 'ui-icon-transferthick-e-w' } }).click(function () { $('#winNodeSort').dialog('open'); return false; });
        }

        function swNodeType(obj) {
            if ($(obj).val() == '0') {
                $('#NodeTypeMemo').html($(obj).attr('title'));
                $('#trNodeUrl, #trNodeTarget, #trNodeParent').hide('fast');
            } else if ($(obj).val() == '1' || $(obj).val() == '2') {
                $('#NodeTypeMemo').html($(obj).attr('title'));
                $('#trNodeUrl, #trNodeTarget, #trNodeParent').show('fast');
            }
        }

        function openNodeMemo() {
            $('#winNodeMemo').dialog('open');
        }

        function SortSelect(obj) {
            if ($('#SourceNode').attr('nodeid') == '') {
                $(obj).addClass('ui-state-highlight');
                $('#SourceNode').html($(obj).html()).attr('nodeid', $(obj).attr('nodeid'));
            } else if ($('#TargetNode').attr('nodeid') == '' && $(obj).attr('nodeid') != $('#SourceNode').attr('nodeid')) {
                $(obj).addClass('ui-state-highlight');
                $('#TargetNode').html($(obj).html()).attr('nodeid', $(obj).attr('nodeid'));
            } else {
                $('#SourceNode, #TargetNode').html('').attr('nodeid', '');
                $('#divNodeSort > div').removeClass('ui-state-highlight');

                $(obj).addClass('ui-state-highlight');
                $('#SourceNode').html($(obj).html()).attr('nodeid', $(obj).attr('nodeid'));
            }
        }

        function GetNodeData() {
            var q = Query;
            q._div.hide();
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=search&ParentID=' + q._s_NodeID(),
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        q._div.show();
                        $('#divNodeSort').html(obj.closest('#rtnData').html());
                        WidgetRefresh();
                    }
                }
            });
            return false;
        }

        function RowCommand() {
            var q = Query;
            var arr = $(this).attr('id').split('_');

    <% if (_CanModify == true)
       { %>
            if (arr[0] == 'btnEdit') {
                $('#frmNode_NodeID').val($(this).attr('id'));
                var NodeType = $(this).attr('nodetype');
                $('input[name=NodeType]:radio').each(function () {
                    if ($(this).val() == NodeType) {
                        $(this).attr('checked', true);
                    } else {
                        $(this).attr('disabled', 'disabled');
                    }
                });
                $('#tdNodeType').buttonset('refresh');
                $('#txtNodeName').val($.trim($(this).parent().parent().find('span[tmp=item_' + arr[1] + '_nodename]').html()));
                if (NodeType == '1' || NodeType == '2') {
                    $('#txtNodeUrl').val($.trim($(this).parent().parent().find('span[tmp=item_' + arr[1] + '_nodeurl]').html()));
                    $('input[name="NodeTarget"][value="' + $(this).attr('nodetarget') + '"]').attr('checked', true);
                    $('#tdNodeTarget').buttonset('refresh');
                    $('#ddlNodeParent').val(q._s_NodeID());
                }

                $('#NodeType0').attr('title', '編輯目錄節點');
                $('#NodeType1').attr('title', '編輯頁面節點');
                $('#NodeType2').attr('title', '編輯頁面節點');

                $('#winNode').dialog('open');
            }
            <% } %>
    <% if (_CanDelete == true)
       {%>
            if (arr[0] == 'btnDelete') {
                if (confirm('是否確定刪除資料列？')) {
                    $.ajax({
                        type: 'POST',
                        url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                        data: 'fnMode=' + arr[0] + '&args=' + $(this).attr('id') + '_' + q._s_NodeID(),
                        error: onError,
                        success: function (msg) {
                            if (msg.toString().indexOf('err:') == 0) {
                                alert(msg.toString().split(':')[1]);
                            } else {
                                var obj = $(msg);
                                q._div.html(obj.closest('#' + q._table).clone());
                                WidgetRefresh();
                                $('#divNodeSort').html(obj.closest('#SortData').html());
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
        function NodeAdd(dialog) {
            var q = Query;
            var NodeType = $('input[name="NodeType"]:checked').val();
            var NodeName = $.trim($('#txtNodeName').val());
            var ParentID = '0';
            var params = '';

            if (NodeName.length == 0) {
                alert('請輸入節點名稱');
                return;
            }

            if (NodeType == '1' || NodeType == '2') {
                if ($('#txtNodeUrl').val() == '') {
                    alert('請輸入結點網址');
                    return;
                }
                ParentID = $('#ddlNodeParent').val();
                params = '&NodeUrl=' + escape($.trim($('#txtNodeUrl').val())) + '&NodeTarget=' + $('input[name="NodeTarget"]:checked').val() + '&ParentID=' + ParentID;
            }
         
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=add&NodeType=' + NodeType + '&NodeName=' + NodeName + params,
                error: onError2,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        WidgetRefresh();
                        $('#divNodeSort').html(obj.closest('#SortData').html());
                        $('#ddlNodeList').val(ParentID);
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

        function NodeUpdate(dialog) {
            if (!confirmSaved()) return;

            var q = Query;
            var NodeType = $('input[name="NodeType"]:checked').val();
            var NodeName = $.trim($('#txtNodeName').val());
            var ParentID = '0';
            var params = '';

            if (NodeName.length == 0) {
                alert('請輸入節點名稱');
                return;
            }

            if (NodeType == '1' || NodeType == '2') {
                if ($('#txtNodeUrl').val() == '') {
                    alert('請輸入節點網址');
                    return;
                }
                ParentID = $('#ddlNodeParent').val();
                params = '&NodeUrl=' + escape($.trim($('#txtNodeUrl').val())) + '&NodeTarget=' + $('input[name="NodeTarget"]:checked').val() + '&ParentID=' + ParentID;
            }
            
            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=btnUpdate&NodeType=' + NodeType + '&NodeName=' + escape(NodeName) + '&args=' + $('#frmNode_NodeID').val() + params,
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        WidgetRefresh();
                        $('#divNodeSort').html(obj.closest('#SortData').html());
                        $('#ddlNodeList').val(ParentID);
                        alert(obj.closest('#rtnData').attr('msg'));
                        $(dialog).dialog('close');
                    }
                }
            });
        }

        function NodeSort(dialog) {
            var q = Query;
            if ($('#SourceNode').attr('nodeid') == '' || $('#TargetNode').attr('nodeid') == '') {
                alert('請選擇變動節點和目標節點');
                return;
            }

            $.ajax({
                type: 'POST',
                url: location.pathname.substring(location.pathname.lastIndexOf('/') + 1),
                data: 'fnMode=sort&SourceNode=' + $('#SourceNode').attr('nodeid') + '&TargetNode=' + $('#TargetNode').attr('nodeid') + '&SortType=' + $('input[name="SortType"]:checked').val() + '&ParentID=' + q._s_NodeID(),
                error: onError,
                success: function (msg) {
                    if (msg.toString().indexOf('err:') == 0) {
                        alert(msg.toString().split(':')[1]);
                    } else {
                        var obj = $(msg);
                        q._div.html(obj.closest('#' + q._table).clone());
                        WidgetRefresh();
                        $('#divNodeSort').html(obj.closest('#SortData').html());
                        alert(obj.closest('#rtnData').attr('msg'));
                        $(dialog).dialog('close');
                    }
                }
            });

            return false;
        }
<% } %>

        function onError() {
            alert('發生錯誤');
        }
        function onError2() {
            alert('發生錯誤2');
        }
    </script>
</body>
</html>
