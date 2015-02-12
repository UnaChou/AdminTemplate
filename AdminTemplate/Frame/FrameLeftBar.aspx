<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrameLeftBar.aspx.cs" Inherits="AdminTamplateProgram.FrameLeftBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        body, html {
            margin: 0px;
            padding: 0px;
            height: 99%;
        }

        .btnMenu {
            outline: 0;
            display: block;
            margin-bottom: 5px;
            width: 98%;          
        }
    </style>
</head>
<body>
    <div id="Menu">     
        <asp:Literal ID="ltlMenu" runat="server"></asp:Literal>          
    </div>
    <script type="text/javascript">
        $(function () {

            //*** button
            $('.btnMenu').button();

            //*** accordion
            $('#Menu').accordion({
                collapsible: true,
                fillSpace: true
            });
        });
    </script>
</body>
</html>
