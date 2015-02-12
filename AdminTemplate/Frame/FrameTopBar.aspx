<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrameTopBar.aspx.cs" Inherits="AdminTamplateProgram.FrameTopBar1" %>

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <table id="tbeLoginFrom" border="0" style="width:100%; height:100%;" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table border="0" cellspacing="0" cellpadding="5" width="100%">
                        <tr>
                            <td align="center" width="200">
                                <!--<img border="0" src="../Images/Logo.gif" width="150" height="74" alt="8zy" />-->
                            </td>
                            <td valign="top"></td>
                            <td align="right" valign="top">
                                <asp:Label ID="Lbl_Account" runat="server" Text="" Style="margin-top: 0;"></asp:Label>&nbsp;|&nbsp;
                                <asp:HyperLink ID="HyperLink2" runat="server" Text="個人設置" Target="freContent" NavigateUrl="../AdminSystem/MyConfig.aspx" />&nbsp;|&nbsp;
                                <%--<asp:HyperLink ID="HyperLink1" runat="server" Text="查閱官網" Target="_blank" NavigateUrl="http://168.omg.com.tw" />&nbsp;|&nbsp;--%>
                                <asp:LinkButton ID="Btn_LogOut" SkinID="button" Style="text-align: center;" runat="server" Width="60" Text="登出" OnClick="Btn_LogOut_Click" />
                                <br />
                                <br />
                                <br />
                                建議使用IE9+, Firefox, Chrome 以獲得最佳的瀏覽效果</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div id="load_data"></div>
    </form>
    <script type="text/javascript">

        $(function () {
            $('#tbeLoginFrom').form();
        });

    </script>
</body>
</html>
