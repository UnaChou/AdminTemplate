<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIPCtrl.aspx.cs" Inherits="AdminTemplate.AdminSystem.AdminIPCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td>
                        <table border="0" width="100%" cellspacing="0" cellpadding="0">
                            <tr>
                                <td valign="top" style="width: 15px">
                                    <div class="ui-state-default ui-corner-right" title="關閉選單" style="width: 15px; height: 35px; cursor: pointer" onclick="switchFrameCols(this)" onmouseover="$(this).addClass('ui-state-hover');" onmouseout="$(this).removeClass('ui-state-hover');">
                                        <span class="ui-icon ui-icon-pin-s" style="margin-top: 10px"></span>
                                    </div>
                                </td>
                                <td align="left" style="padding-left: 10px">目錄：網站 ► IP管理
                                </td>
                                <td align="right">
                                    <!-- Function Menu -->
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <hr />
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center">
                    <table id="frmAccountCtrl" class="ui-widget-content" width="90%" cellpadding="5">
                        <tr>
                            <td style="text-align:left;">新增IP：
                            <asp:TextBox ID="tbxIP" runat="server" Width="150px" />
                                &nbsp;&nbsp;<asp:Button ID="btnNewSubmit" runat="server" Text="新增" OnClick="btnNewSubmit_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:GridView ID="gvwData" runat="server" Width="100%" BorderWidth="1px" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" CellSpacing="5" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwData_PageIndexChanging" OnRowCancelingEdit="gvwData_RowCancelingEdit" OnRowDeleting="gvwData_RowDeleting" OnRowEditing="gvwData_RowEditing" OnRowUpdating="gvwData_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="IP">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRealIP" runat="server" Text='<%# Bind("AdminIP") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRealIP" runat="server" Text='<%# Eval("AdminIP") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="15%" />
                                <HeaderStyle Width="15%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CreateDate" HeaderText="建立日期" InsertVisible="False" ReadOnly="True">
                                <ItemStyle Width="10%" />
                                <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemStyle Width="15%" />
                                <ItemTemplate>
                                    <asp:Button ID="BtnGridEdit" runat="server" CssClass="button" CommandName="Edit" Text="編輯" CausesValidation="false" />
                                    <asp:Button ID="BtnGridDelete" runat="server" CssClass="button" CommandName="Delete" Text="刪除" CausesValidation="false" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="BtnGridUpdate" runat="server" CssClass="button" CommandName="Update" Text="儲存" CausesValidation="False" />
                                    <asp:Button ID="BtnGridCancel" runat="server" CssClass="button" CommandName="Cancel" Text="取消" CausesValidation="False" />
                                </EditItemTemplate>
                                <HeaderStyle Width="15%" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
    <asp:Label runat="server" ID="lblMsg" />
    <script type="text/javascript">
        $('#gvwData').form();
    </script>
</body>
</html>
