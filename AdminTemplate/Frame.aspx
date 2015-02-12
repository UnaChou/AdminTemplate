<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Frame.aspx.cs" Inherits="AdminTamplateProgram.Frame" %>

<html>
<head runat="server">
	<title></title>
</head>
<frameset rows="80,*" framespacing="0" border="0" frameborder="1">
	<frame name="freTopBar" scrolling="no" noresize marginwidth="0" marginheight="0" src="Frame/FrameTopBar.aspx">
	<frameset cols="200,*" id="freMain">
		<frame name="freLeftBar" src="Frame/FrameLeftBar.aspx"/>
		<frame name="freContent" id="freContent" runat="server"/>
	</frameset>
</frameset>
</html>
