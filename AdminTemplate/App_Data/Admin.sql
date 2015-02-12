--建Table

/****** Object:  Table [dbo].[Account]    Script Date: 2014/12/12 下午 03:08:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](16) NOT NULL,
	[Password] [char](32) NOT NULL,
	[LoginTime] [datetime] NULL,
	[LogErrorCount] [tinyint] NULL,
	[LogErrorTime] [datetime] NULL,
	[LeaveStatus] [bit] NOT NULL,
	[LastUpdatePWD] [datetime] NULL,
	[LastUpdateIP] [bigint] NULL,
 CONSTRAINT [PK_Account_AccountID] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_LoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO

ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_LeaveStatus]  DEFAULT ((0)) FOR [LeaveStatus]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'AccountID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Account'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Password'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入錯誤累積次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LogErrorCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入錯誤時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LogErrorTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'離職狀態 (0:在職  1:離職)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LeaveStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後一次修改密碼時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LastUpdatePWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後一次登入的IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LastUpdateIP'
GO


/****** Object:  Table [dbo].[Account_Node]    Script Date: 2014/12/12 下午 03:08:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Account_Node](
	[AccountNodeID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[NodeID] [int] NOT NULL,
	[CanBrowse] [bit] NOT NULL,
	[CanInsert] [bit] NOT NULL,
	[CanModify] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Account_Node] PRIMARY KEY CLUSTERED 
(
	[AccountNodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Node', @level2type=N'COLUMN',@level2name=N'AccountID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Node', @level2type=N'COLUMN',@level2name=N'NodeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瀏覽權限(1:有 0:沒有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Node', @level2type=N'COLUMN',@level2name=N'CanBrowse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增權限(1:有 0:沒有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Node', @level2type=N'COLUMN',@level2name=N'CanInsert'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'編輯權限(1:有 0:沒有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Node', @level2type=N'COLUMN',@level2name=N'CanModify'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刪除權限(1:有 0:沒有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Node', @level2type=N'COLUMN',@level2name=N'CanDelete'
GO


/****** Object:  Table [dbo].[Account_Role]    Script Date: 2014/12/12 下午 03:09:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Account_Role](
	[AccountRoleID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Account_Role_AccountRoleID] PRIMARY KEY CLUSTERED 
(
	[AccountRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'AccountID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'RoleID'
GO


/****** Object:  Table [dbo].[Admin_IP]    Script Date: 2014/8/20 下午 03:53:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Admin_IP](
	[ID] [int] IDENTITY(1,1) NOT NULL,	
	[AdminIP] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[Status] [smallint] NOT NULL,
 CONSTRAINT [PK_Admin_IP_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Admin_IP] ADD  CONSTRAINT [DF_Admin_IP_CreateTime]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[Admin_IP] ADD  CONSTRAINT [DF_Admin_IP_Status]  DEFAULT ((0)) FOR [Status]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin_IP', @level2type=N'COLUMN',@level2name=N'AdminIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin_IP', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin_IP', @level2type=N'COLUMN',@level2name=N'LastUpdateDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: 正常 99:刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin_IP', @level2type=N'COLUMN',@level2name=N'Status'
GO



/****** Object:  Table [dbo].[Node]    Script Date: 2014/12/12 下午 03:09:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Node](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[NodeName] [nvarchar](30) NOT NULL,
	[NodeType] [tinyint] NOT NULL,
	[NodeTarget] [tinyint] NOT NULL,
	[NodeUrl] [varchar](255) NULL,
	[SortNo] [int] NOT NULL,
	[NodeStatus] [smallint] NOT NULL,
 CONSTRAINT [PK_Node_NodeID] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Node] ADD  CONSTRAINT [DF_Node_Hidden]  DEFAULT ((0)) FOR [NodeType]
GO

ALTER TABLE [dbo].[Node] ADD  CONSTRAINT [DF_Node_OpenWindow]  DEFAULT ((0)) FOR [NodeTarget]
GO

ALTER TABLE [dbo].[Node] ADD  CONSTRAINT [DF_Node_OrderID]  DEFAULT ((0)) FOR [SortNo]
GO

ALTER TABLE [dbo].[Node] ADD  CONSTRAINT [DF_Node_NodeStatus]  DEFAULT ((0)) FOR [NodeStatus]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結點ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'NodeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點對應的NodeID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'ParentID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'NodeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點類型 0:目錄, 1:結點頁面, 2:非結點頁面, 3:按鈕' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'NodeType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目標框架 0:frame, 1:window' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'NodeTarget'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'NodeUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'SortNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:正常 99:刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Node', @level2type=N'COLUMN',@level2name=N'NodeStatus'
GO


/****** Object:  Table [dbo].[Role]    Script Date: 2014/12/12 下午 03:09:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
	[RoleLevel] [tinyint] NOT NULL,
	[RoleStatus] [smallint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Role_RoleID] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_RoleLevel]  DEFAULT ((0)) FOR [RoleLevel]
GO

ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_RoleStatus]  DEFAULT ((0)) FOR [RoleStatus]
GO

ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色等級 0:一般(權限需另外設定) 1:管理(權限全開) 2:高級(除系統設定外權限全開)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色狀態 ~ 0:Normal 1:Delete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'LastModifiedDate'
GO

/****** Object:  Table [dbo].[Role_Node]    Script Date: 2014/12/12 下午 03:09:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Role_Node](
	[RoleNodeID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[NodeID] [int] NOT NULL,
	[CanBrowse] [bit] NOT NULL,
	[CanInsert] [bit] NOT NULL,
	[CanModify] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Role_Node_RoleNodeID] PRIMARY KEY CLUSTERED 
(
	[RoleNodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Node', @level2type=N'COLUMN',@level2name=N'RoleID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Node', @level2type=N'COLUMN',@level2name=N'NodeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瀏覽權限(0:沒有 1: 有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Node', @level2type=N'COLUMN',@level2name=N'CanBrowse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增權限(0:沒有 1: 有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Node', @level2type=N'COLUMN',@level2name=N'CanInsert'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'編輯權限(0:沒有 1: 有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Node', @level2type=N'COLUMN',@level2name=N'CanModify'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刪除權限(0:沒有 1: 有)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Node', @level2type=N'COLUMN',@level2name=N'CanDelete'
GO



--建立索引

/****** Object:  Index [PK_Account_Account]    Script Date: 2014/8/20 下午 03:54:55 ******/
CREATE NONCLUSTERED INDEX [PK_Account_Account] ON [dbo].[Account]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Account_LeaveStatus]    Script Date: 2014/8/20 下午 03:55:35 ******/
CREATE NONCLUSTERED INDEX [PK_Account_LeaveStatus] ON [dbo].[Account]
(
	[LeaveStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Account_LogErrorCount]    Script Date: 2014/8/20 下午 03:55:45 ******/
CREATE NONCLUSTERED INDEX [PK_Account_LogErrorCount] ON [dbo].[Account]
(
	[LogErrorCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Account_LogErrorTime]    Script Date: 2014/8/20 下午 03:55:57 ******/
CREATE NONCLUSTERED INDEX [PK_Account_LogErrorTime] ON [dbo].[Account]
(
	[LogErrorTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Account_Node_AccountID]    Script Date: 2014/8/20 下午 03:58:03 ******/
CREATE NONCLUSTERED INDEX [PK_Account_Node_AccountID] ON [dbo].[Account_Node]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [PK_Account_Node_NodeID]    Script Date: 2014/8/20 下午 03:58:21 ******/
CREATE NONCLUSTERED INDEX [PK_Account_Node_NodeID] ON [dbo].[Account_Node]
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Account_Role_RoleID]    Script Date: 2014/8/20 下午 03:59:00 ******/
CREATE NONCLUSTERED INDEX [PK_Account_Role_RoleID] ON [dbo].[Account_Role]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Node_NodeStatus]    Script Date: 2014/8/20 下午 04:01:12 ******/
CREATE NONCLUSTERED INDEX [PK_Node_NodeStatus] ON [dbo].[Node]
(
	[NodeStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Node_NodeType]    Script Date: 2014/8/20 下午 04:01:19 ******/
CREATE NONCLUSTERED INDEX [PK_Node_NodeType] ON [dbo].[Node]
(
	[NodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Node_ParentID]    Script Date: 2014/8/20 下午 04:01:28 ******/
CREATE NONCLUSTERED INDEX [PK_Node_ParentID] ON [dbo].[Node]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



/****** Object:  Index [PK_Role_RoleLevel]    Script Date: 2014/8/20 下午 04:01:47 ******/
CREATE NONCLUSTERED INDEX [PK_Role_RoleLevel] ON [dbo].[Role]
(
	[RoleLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Role_RoleName]    Script Date: 2014/8/20 下午 04:01:54 ******/
CREATE NONCLUSTERED INDEX [PK_Role_RoleName] ON [dbo].[Role]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Role_RoleStatus]    Script Date: 2014/8/20 下午 04:02:03 ******/
CREATE NONCLUSTERED INDEX [PK_Role_RoleStatus] ON [dbo].[Role]
(
	[RoleStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Role_Node_NodeID]    Script Date: 2014/8/20 下午 04:02:17 ******/
CREATE NONCLUSTERED INDEX [PK_Role_Node_NodeID] ON [dbo].[Role_Node]
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_Role_Node_RoleID]    Script Date: 2014/8/20 下午 04:02:25 ******/
CREATE NONCLUSTERED INDEX [PK_Role_Node_RoleID] ON [dbo].[Role_Node]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO




--建立SP

/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_Account_S]    Script Date: 2014/12/12 下午 03:11:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Randy>
-- Create date: <2013/02/25>
-- Description:	<查詢帳號>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_Account_S] 
	-- Add the parameters for the stored procedure here
	@PageSize		INT, 
	@PageNo			INT,	
	@Account		VARCHAR(16),
	@Total			INT				OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--依帳號查詢
	IF @Account <> ''
	BEGIN
		SELECT [AccountID], [Account], [LoginTime], ISNULL([LogErrorCount], 0) AS LogErrorCount, [LogErrorTime]
		FROM [dbo].[Account] WITH(NOLOCK) WHERE [Account] LIKE '%'+ @Account + '%' AND [LeaveStatus] = 0
		
		SET @Total = @@ROWCOUNT
		
		RETURN
	END
	ELSE
	BEGIN
		SELECT [AccountID], [Account], [LoginTime], ISNULL([LogErrorCount], 0) AS LogErrorCount, [LogErrorTime]
		FROM [dbo].[Account] WITH(NOLOCK) WHERE [LeaveStatus] = 0
		
		SET @Total = @@ROWCOUNT
		
		RETURN
	END

	
END





GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_D]    Script Date: 2014/12/12 下午 03:11:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Randy>
-- Create date: <2013/02/25>
-- Description:	<刪除帳號>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_D] 
	-- Add the parameters for the stored procedure here
	@AccountID		INT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--判斷帳號是否存在
	IF NOT EXISTS(SELECT [AccountID] FROM [dbo].[Account] WITH(NOLOCK) WHERE [AccountID] = @AccountID AND [LeaveStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'無此帳號'
		RETURN
	END

	UPDATE [dbo].[Account] SET [LeaveStatus] = 1 WHERE [AccountID] = @AccountID

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'刪除失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'刪除成功'
	RETURN
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_I]    Script Date: 2014/12/12 下午 03:11:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Randy>
-- Create date: <2013/02/25>
-- Description:	<新增帳號>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_I] 
	-- Add the parameters for the stored procedure here	
	@Account		VARCHAR(16), 
	@Password		CHAR(32),
	@RoleID			VARCHAR(200),
	@GameID			VARCHAR(200),
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--判斷帳號是否存在
	IF EXISTS(SELECT [AccountID] FROM [dbo].[Account] WITH(NOLOCK) WHERE [Account] = @Account)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'帳號重複'
		RETURN
	END	

	--新增帳號
	INSERT INTO [dbo].[Account] ([Account], [Password])
	VALUES(@Account, @Password)

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'新增失敗'
		RETURN
	END

	DECLARE @AccountID INT
	SELECT @AccountID = [AccountID] FROM [dbo].[Account] WITH(NOLOCK) WHERE [Account] = @Account
	
	-- 新增帳號角色
	DECLARE @sRoleID			VARCHAR(10)
	DECLARE @iRoleID			INT
	DECLARE @Pos				SMALLINT
	DECLARE @RoleAddErrorCount	TINYINT

	SET @RoleAddErrorCount = 0

	WHILE CHARINDEX(',', @RoleID) > 1
	BEGIN
		-- 取得RoleID
		SET @Pos = CHARINDEX(',', @RoleID)
		SET @sRoleID = SUBSTRING(@RoleID, 1, @Pos-1)
		SET @RoleID = SUBSTRING(@RoleID, @Pos+1, LEN(@RoleID))

		SET @iRoleID = CAST(@sRoleID AS INT)

		IF EXISTS(SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleID] = @iRoleID AND [RoleStatus] = 0)
		BEGIN
			
			INSERT INTO [dbo].[Account_Role] ([AccountID], [RoleID]) VALUES (@AccountID, @iRoleID)
				
		END
		ELSE
		BEGIN
			SET @RoleAddErrorCount = @RoleAddErrorCount + 1
		END
	END

	IF @RoleAddErrorCount <> 0
	BEGIN
		SET @RtnCode = 103
		SET @RtnMsg = N'帳號新增成功, 角色新增失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'新增成功'

	RETURN
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_LastUpdatePWD_SU]    Script Date: 2014/12/12 下午 03:11:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<查詢密碼最後修改時間&更新登入IP>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_LastUpdatePWD_SU]
	-- Add the parameters for the stored procedure here
	@Account		VARCHAR(16),
	@LastUpdateIP	VARCHAR(20),
	@LastUpdatePWD	DATETIME		OUTPUT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  
    -- Insert statements for procedure here 	
	
	DECLARE @iLastUpdateIP  BIGINT  
    
	--IP轉數字 
	SET @iLastUpdateIP = [dbo].[Func_IPConvertToNumber](@LastUpdateIP)
    
	--取密碼更新時間
	SELECT @LastUpdatePWD = [LastUpdatePWD]  
	FROM [dbo].[Account] WITH(NOLOCK)
	WHERE [Account] = @Account
	
	--更新登入IP
	UPDATE [dbo].[Account] SET [LastUpdateIP] = @iLastUpdateIP WHERE [Account] = @Account

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN				
		SET @RtnCode = 101
		SET @RtnMsg = N'更新登入IP失敗'
		RETURN
	END
	
	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'

END



GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_Node_Permission_S]    Script Date: 2014/12/12 下午 03:11:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<取節點資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_Node_Permission_S] 
	-- Add the parameters for the stored procedure here
	@AccountID		INT, 
	@ParentID		INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  
    -- Insert statements for procedure here 

	--判斷是否為目錄節點
	IF @ParentID <> 0
	BEGIN
		--非目錄節點
		SELECT N.[NodeID], N.[NodeName], N.[ParentID], N.[SortNo],
			ISNULL(AN.[CanBrowse], 0) AS CanBrowse,
			ISNULL(AN.[CanInsert], 0) AS CanInsert,
			ISNULL(AN.[CanModify], 0) AS CanModify,
			ISNULL(AN.[CanDelete], 0) AS CanDelete FROM [dbo].[Node] AS N WITH(NOLOCK)
		LEFT OUTER JOIN [dbo].[Account_Node] AS AN WITH(NOLOCK)
		ON N.[NodeID] = AN.[NodeID] AND AN.[AccountID] = @AccountID WHERE (N.[ParentID] = @ParentID OR N.[NodeID] = @ParentID) AND [NodeStatus] = 0
	END
	ELSE
	BEGIN
		--目錄節點
		SELECT N.[NodeID], N.[NodeName], N.[ParentID], N.[SortNo],
			ISNULL(AN.[CanBrowse], 0) AS CanBrowse,
			ISNULL(AN.[CanInsert], 0) AS CanInsert,
			ISNULL(AN.[CanModify], 0) AS CanModify,
			ISNULL(AN.[CanDelete], 0) AS CanDelete FROM [dbo].[Node] AS N WITH(NOLOCK)
		LEFT OUTER JOIN [dbo].[Account_Node] AS AN WITH(NOLOCK)
		ON N.[NodeID] = AN.[NodeID] AND AN.[AccountID] = @AccountID WHERE [NodeStatus] = 0
	END

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_Node_Permission_U]    Script Date: 2014/12/12 下午 03:11:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新帳號的節點權限>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_Node_Permission_U] 
	-- Add the parameters for the stored procedure here
	@AccountID		INT, 
	@NodeID			INT,
	@CanBrowse		BIT,
	@CanInsert		BIT,
	@CanModify		BIT,
	@CanDelete		BIT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  
    -- Insert statements for procedure here 
 
	--判斷帳號是否存在
	IF NOT EXISTS(SELECT [AccountID] FROM [dbo].[Account] WITH(NOLOCK) WHERE [AccountID] = @AccountID)
	BEGIN
		SET @RtnCode = 100
		SET @RtnMsg = N'無此帳號'
		RETURN
	END

	--判斷節點是否存在
	IF NOT EXISTS(SELECT [NodeID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeID] = @NodeID AND [NodeStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'無此節點'
		RETURN
	END

	--帳號權限是否已有資料
	IF EXISTS(SELECT [AccountNodeID] FROM [dbo].[Account_Node] WITH(NOLOCK) WHERE [AccountID] = @AccountID AND [NodeID] = @NodeID)
	BEGIN
		--已有對應的資料,更新權限
		UPDATE [dbo].[Account_Node] SET
			[CanBrowse] = @CanBrowse,
			[CanInsert] = @CanInsert,
			[CanModify] = @CanModify,
			[CanDelete] = @CanDelete
		WHERE [AccountID] = @AccountID AND [NodeID] = @NodeID

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN				
			SET @RtnCode = 101
			SET @RtnMsg = N'更新權限失敗'
			RETURN
		END
	END
	ELSE
	BEGIN
		--沒有對應的資料,新增資料
		INSERT INTO [dbo].[Account_Node] ([AccountID],[NodeID], [CanBrowse], [CanInsert], [CanModify], [CanDelete])
		VALUES(@AccountID, @NodeID, @CanBrowse, @CanInsert, @CanModify, @CanDelete)

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN				
			SET @RtnCode = 102
			SET @RtnMsg = N'新增權限失敗'
			RETURN
		END
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_PWD_U]    Script Date: 2014/12/12 下午 03:11:55 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<使用者修改密碼>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_PWD_U]
	@AccountID		INT,
	@OldPassword	CHAR(32),
	@NewPassword	CHAR(32),
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  
    -- Insert statements for procedure here 

	DECLARE	@Password CHAR(32);

	--取原密碼
	SELECT @Password = [Password] FROM [dbo].[Account] WITH(NOLOCK) WHERE [AccountID] = @AccountID
	
	--判斷有沒有該帳號的資料
	IF @@ROWCOUNT < 1
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'變更失敗，尋找不到您的帳號資料。'
		RETURN
	END
	--判斷原密碼是否輸入正確
	ELSE IF @Password <> @OldPassword
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'變更失敗，您輸入的原密碼錯誤。'
		RETURN
	END
	ELSE
	BEGIN
		UPDATE [dbo].[Account]
		SET [Password] = @NewPassword, [LastUpdatePWD] = GETDATE()
		WHERE [AccountID] = @AccountID

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 103
			SET @RtnMsg = N'更新失敗！'
			RETURN
		END

		SET @RtnCode = 1
		SET @RtnMsg = N'更新成功！'
		RETURN
	END

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_Role_ByAccountID_S]    Script Date: 2014/12/12 下午 03:12:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<依使用者ID查詢角色ID>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_Role_ByAccountID_S] 
	-- Add the parameters for the stored procedure here
	@AccountID		INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT [RoleID] FROM [dbo].[Account_Role] WITH(NOLOCK)
	WHERE [AccountID] = @AccountID

END





GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_Role_S]    Script Date: 2014/12/12 下午 03:12:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<查詢所有角色資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_Role_S] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RoleID], [RoleName] FROM [dbo].[Role] WITH(NOLOCK)
	WHERE [RoleStatus] = 0

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_S]    Script Date: 2014/12/12 下午 03:12:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<查詢所有帳號>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_S] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		
	SELECT [AccountID], [Account] FROM [dbo].[Account] WITH(NOLOCK)
	WHERE [LeaveStatus] = 0
	ORDER BY [Account]
	
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Account_U]    Script Date: 2014/12/12 下午 03:12:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Randy>
-- Create date: <2013/02/25>
-- Description:	<更新帳號資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Account_U] 
	-- Add the parameters for the stored procedure here	
	@Account		VARCHAR(16), 
	@Password		CHAR(32),
	@RoleID			VARCHAR(200),
	@GameID			VARCHAR(200),
	@AccountID		INT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--判斷帳號是否存在
	IF NOT EXISTS(SELECT [AccountID] FROM [dbo].[Account] WITH(NOLOCK) WHERE [AccountID] = @AccountID AND [LeaveStatus] = 0)
	BEGIN
		SET @RtnCode = 100
		SET @RtnMsg = N'無此帳號'
		RETURN
	END

	--判斷是否有輸入密碼
	IF @Password <> ''
	BEGIN
		
		UPDATE [dbo].[Account] SET [Password] = @Password , [LogErrorCount] = NULL , [LogErrorTime] = NULL , [LastUpdatePWD] = NULL WHERE [AccountID] = @AccountID
			
		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
			BEGIN
				SET @RtnCode = 103
				SET @RtnMsg = N'密碼,公司更新失敗'
				RETURN
			END
	END	

	-- 設定帳號角色,先刪除帳號所有角色
	DELETE FROM [dbo].[Account_Role] WHERE [AccountID] = @AccountID
	
	-- 新增帳號角色
	DECLARE @sRoleID				VARCHAR(10)
	DECLARE @iRoleID				INT
	DECLARE @Pos					SMALLINT
	DECLARE @RoleAddErrorCount		TINYINT

	SET @RoleAddErrorCount = 0
	WHILE CHARINDEX(',', @RoleID) > 1
	BEGIN
		-- 取得RoleID
		SET @Pos = CHARINDEX(',', @RoleID)
		SET @sRoleID = SUBSTRING(@RoleID, 1, @Pos-1)
		SET @RoleID = SUBSTRING(@RoleID, @Pos+1, LEN(@RoleID))

		SET @iRoleID = CAST(@sRoleID AS INT)

		--判斷角色是否存在
		IF EXISTS ( SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleID] = @iRoleID AND [RoleStatus] = 0)
		BEGIN
			--新增帳號角色
			INSERT INTO [dbo].[Account_Role] ([AccountID], [RoleID]) VALUES (@AccountID, @iRoleID)

			IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
			BEGIN
				--計算錯誤次數
				SET @RoleAddErrorCount = @RoleAddErrorCount + 1
				
			END
		END
		ELSE
		BEGIN
			--計算錯誤次數
			SET @RoleAddErrorCount = @RoleAddErrorCount + 1
		END	
	END

	IF @RoleAddErrorCount <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'帳號更新成功, 角色更新失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'			
	
END





GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_ByParentID_S]    Script Date: 2014/12/12 下午 03:12:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<依ParentID查詢節點>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_ByParentID_S] 
	-- Add the parameters for the stored procedure here
	@ParentID		INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   
	SELECT [NodeID], [NodeName] FROM [dbo].[Node] WITH(NOLOCK)
	WHERE [ParentID] = @ParentID AND [NodeStatus] = 0

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_D]    Script Date: 2014/12/12 下午 03:12:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<刪除節點>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_D] 
	-- Add the parameters for the stored procedure here	
	@NodeID		INT,
	@RtnCode	INT				OUTPUT,
	@RtnMsg		NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--判斷節點是否存在
	IF NOT EXISTS(SELECT [NodeID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeID] = @NodeID AND [NodeStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'無此節點'
		RETURN
	END

	UPDATE [dbo].[Node] SET [NodeStatus] = 99 WHERE [NodeID] = @NodeID

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'刪除失敗'
		RETURN
	END

	DECLARE @ParentID INT;
	
	SELECT @ParentID = [ParentID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeID] = @NodeID

	--如果是目錄節點,刪除相關的所有節點
	IF @ParentID = 0 AND EXISTS ( SELECT TOP 1 [NodeID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [ParentID] = @NodeID)
	BEGIN

		UPDATE [dbo].[Node] SET [NodeStatus] = 99 WHERE [ParentID] = @NodeID

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 103
			SET @RtnMsg = N'刪除失敗'
			RETURN
		END
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'刪除成功'

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_I]    Script Date: 2014/12/12 下午 03:13:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<新增節點>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_I] 
	-- Add the parameters for the stored procedure here	
	@NodeType		TINYINT,
	@NodeName		NVARCHAR(30),
	@NodeUrl		VARCHAR(255),
	@NodeTarget		TINYINT,
	@ParentID		INT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @MaxNo INT;

	SET @MaxNo = 0

	--取最後一個排序號碼
	SELECT TOP 1 @MaxNo = [SortNO] FROM [dbo].[Node] WITH(NOLOCK) WHERE [ParentID] = @ParentID ORDER BY [SortNO] DESC

	--將新增的節點最後
	SET @MaxNo = @MaxNo + 1

	--NodeType=節點類型 0:目錄, 1:結點頁面, 2:非結點頁面, 3:按鈕
	IF @NodeType = 0
	BEGIN		
		--目錄不需要更新NodeUrl
		INSERT INTO [dbo].[Node] ([ParentID], [NodeName], [NodeType], [NodeTarget], [SortNo])
		VALUES (@ParentID, @NodeName, @NodeType, @NodeTarget, @MaxNo)
		
		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 101
			SET @RtnMsg = N'新增失敗'
		END
		ELSE
		BEGIN
			SET @RtnCode = 1
			SET @RtnMsg = N'新增成功'
		END
		RETURN
	END

	IF @NodeType = 1 OR @NodeType = 2
	BEGIN
		INSERT INTO [dbo].[Node]([ParentID], [NodeName], [NodeType], [NodeTarget], [NodeUrl], [SortNo])
		VALUES(@ParentID, @NodeName, @NodeType, @NodeTarget, @NodeUrl, @MaxNo)
		
		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 102
			SET @RtnMsg = N'新增失敗'
		END
		ELSE
		BEGIN
			SET @RtnCode = 1
			SET @RtnMsg = N'新增成功'
		END
		RETURN
	END
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_Menu_S]    Script Date: 2014/12/12 下午 03:13:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<依使用者ID取目錄資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_Menu_S] 
	-- Add the parameters for the stored procedure here
	@AccountID		INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   
	-- 判斷角色是否為管理(權限全開)RoleLevel = 1
	IF EXISTS(SELECT R.[RoleID] FROM [dbo].[Role] AS R WITH(NOLOCK) INNER JOIN [dbo].[Account_Role] AS AR WITH(NOLOCK) ON R.[RoleID] = AR.[RoleID]
	WHERE AR.[AccountID] = @AccountID AND R.[RoleLevel] = 1)
	BEGIN	
		--[NodeType] < 2 才是頁面
		SELECT [NodeID], [ParentID], [NodeName], [NodeTarget], [NodeUrl], [SortNo]
		FROM [dbo].[Node] WITH(NOLOCK)
		WHERE [NodeType] < 2 AND [NodeStatus] = 0
		ORDER BY [NodeID]
		RETURN
	END


	-- 判斷角色是否為高級(除系統設定外權限全開)RoleLevel = 2
	IF EXISTS(SELECT R.[RoleID] FROM [dbo].[Role] AS R WITH(NOLOCK), [dbo].[Account_Role] AS AR WITH(NOLOCK)
	WHERE R.[RoleID] = AR.[RoleID] AND AR.[AccountID] = @AccountID AND R.[RoleLevel] = 2)
	BEGIN
		SELECT [NodeID], [ParentID], [NodeName], [NodeTarget], [NodeUrl], [SortNo]
		FROM [dbo].[Node] WITH(NOLOCK)
		WHERE [NodeType] < 2 AND [NodeStatus] = 0 AND [ParentID] <> 1 AND [NodeID] > 1
		UNION (
			SELECT R.[NodeID], R.[ParentID], R.[NodeName], R.[NodeTarget], R.[NodeUrl], R.[SortNo]
			FROM [dbo].[Node] AS R WITH(NOLOCK)
			INNER JOIN (
				SELECT DISTINCT R.[NodeID]
				FROM [dbo].[Role_Node] R WITH(NOLOCK) INNER JOIN [dbo].[Account_Role] AR WITH(NOLOCK) ON R.[RoleID] = AR.[RoleID]
				WHERE AR.[AccountID] = @AccountID AND R.[CanBrowse] = 1
				UNION
				SELECT [NodeID]
				FROM [dbo].[Account_Node] WHERE [AccountID] = @AccountID AND [CanBrowse] = 1
			) AS RNA ON R.[NodeID] = RNA.[NodeID]
			WHERE R.[NodeType] < 2 AND R.[NodeStatus] = 0
		)
		ORDER BY [NodeID]
		RETURN
	END


	--一般(權限需另外設定)RoleLevel = 0
	SELECT R.[NodeID], R.[ParentID], R.[NodeName], R.[NodeTarget], R.[NodeUrl], R.[SortNo]
	FROM [dbo].[Node] R WITH(NOLOCK)
	INNER JOIN (
		SELECT DISTINCT R.[NodeID]
		FROM [dbo].[Role_Node] R WITH(NOLOCK) INNER JOIN [dbo].[Account_Role] AR WITH(NOLOCK) ON R.[RoleID] = AR.[RoleID]
		WHERE [AccountID] = @AccountID AND R.[CanBrowse] = 1
		UNION
		SELECT [NodeID]
		FROM [dbo].[Account_Node] WHERE [AccountID] = @AccountID AND [CanBrowse] = 1
	) RNA ON R.[NodeID] = RNA.[NodeID]
	WHERE R.[NodeType] < 2 AND R.[NodeStatus] = 0
	ORDER BY R.[NodeID]

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_NameByUrl_S]    Script Date: 2014/12/12 下午 03:13:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Nick>
-- Create date: <20110915>
-- Description:	<取出node 的Node 名稱>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_NameByUrl_S]
	@NodeUrl		VARCHAR(255),
	@NodeName		NVARCHAR(30)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET @NodeName = ''
  
	SELECT @NodeName = ISNULL([NodeName] ,'') FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeUrl] = @NodeUrl	

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_Permission_S]    Script Date: 2014/12/12 下午 03:13:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<頁面權限檢查>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_Permission_S] 
	-- Add the parameters for the stored procedure here
	@AccountID		INT, 
	@NodeUrl		VARCHAR(255),
	@CanBrowse		BIT				OUTPUT,
	@CanInsert		BIT				OUTPUT,
	@CanModify		BIT				OUTPUT,
	@CanDelete		BIT				OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @CanBrowse = 0
	SET @CanInsert = 0
	SET @CanModify = 0
	SET @CanDelete = 0

	--判斷帳號角色權限RoleLevel = 1
	IF EXISTS(SELECT R.[RoleID] FROM [dbo].[Role] R WITH(NOLOCK) INNER JOIN [dbo].[Account_Role] AR WITH(NOLOCK) ON R.[RoleID] = AR.[RoleID]
	WHERE AR.[AccountID] = @AccountID AND R.[RoleLevel] = 1)
	BEGIN
		SET @CanBrowse = 1
		SET @CanInsert = 1
		SET @CanModify = 1
		SET @CanDelete = 1
		RETURN
	END

	DECLARE @NodeID INT;
	DECLARE @ParentID INT;
	
	SELECT @NodeID = [NodeID], @ParentID = [ParentID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeUrl] = @NodeUrl AND [NodeStatus] = 0 AND [ParentID] > 0

	--判斷頁面是否存在
	IF @@ROWCOUNT < 1
	BEGIN
		RETURN
	END

	-- 判斷帳號,角色權限=高級(除系統設定外權限全開)RoleLevel = 2, ParentID <> 1
	IF EXISTS(SELECT R.[RoleID] FROM [dbo].[Role] R WITH(NOLOCK) INNER JOIN [dbo].[Account_Role] AR WITH(NOLOCK) ON R.[RoleID] = AR.[RoleID]
	WHERE AR.[AccountID] = @AccountID AND R.[RoleLevel] = 2) AND @ParentID <> 1
	BEGIN
		SET @CanBrowse = 1
		SET @CanInsert = 1
		SET @CanModify = 1
		SET @CanDelete = 1
		RETURN
	END

	--判斷每一個權限
	SELECT @CanBrowse = MAX(CAST(t3.[CanBrowse] AS INT)),
		@CanInsert = MAX(CAST(t3.[CanInsert] AS INT)),
		@CanModify = MAX(CAST(t3.[CanModify] AS INT)),
		@CanDelete =  MAX(CAST(t3.[CanDelete] AS INT)) FROM (
		SELECT t1.[NodeID], [CanBrowse], [CanInsert], [CanModify], [CanDelete]
		FROM [dbo].[Role_Node] AS t1 WITH(NOLOCK), [dbo].[Account_Role] AS t2 WITH(NOLOCK)
		WHERE t1.[RoleID] = t2.[RoleID] AND [AccountID] = @AccountID AND [NodeID] = @NodeID
		UNION
		SELECT [NodeID], [CanBrowse], [CanInsert], [CanModify], [CanDelete]
		FROM [dbo].[Account_Node] WITH(NOLOCK) WHERE [AccountID] = @AccountID AND [NodeID] = @NodeID
	) AS t3 GROUP BY t3.[NodeID]
	
	 
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_S]    Script Date: 2014/12/12 下午 03:13:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<取出所有節點資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_S] 
	-- Add the parameters for the stored procedure here
	@ParentID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	SELECT [NodeID], [NodeName], [NodeType], [NodeTarget], [NodeUrl] FROM [dbo].[Node] WITH(NOLOCK)
	WHERE [ParentID] = @ParentID AND [NodeStatus] = 0
	ORDER BY [SortNo], [NodeID]

END





GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_Sort_U]    Script Date: 2014/12/12 下午 03:13:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新節點排序>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_Sort_U] 
	-- Add the parameters for the stored procedure here	
	@SourceNode		INT,
	@TargetNode		INT,
	@SortType		TINYINT,					-- 0:與目標節點互換, 1:插入目標節點上方, 2:插入目標節點下方
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ParentID INT;
	DECLARE @SourceNodeSortNo INT;

	--取來源節點資料
	SELECT @ParentID = [ParentID], @SourceNodeSortNo = [SortNo] FROM [dbo].[Node] WITH(NOLOCK)
	WHERE [NodeID] = @SourceNode AND [NodeStatus] = 0 AND [NodeType] < 2
	
	DECLARE @TargetNodeSortNo INT;

	--取目標節點資料
	SELECT @TargetNodeSortNo = [SortNo] FROM [dbo].[Node] WITH(NOLOCK)
	WHERE [NodeID] = @TargetNode AND [ParentID] = @ParentID AND [NodeStatus] = 0 AND [NodeType] < 2
	
	--與目標節點互換
	IF @SortType = 0
	BEGIN
		UPDATE [dbo].[Node] SET [SortNo] = @TargetNodeSortNo WHERE [NodeID] = @SourceNode

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 100
			SET @RtnMsg = N'更新來源節點排序失敗'
			RETURN
		END

		UPDATE [dbo].[Node] SET [SortNo] = @SourceNodeSortNo WHERE [NodeID] = @TargetNode

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 101
			SET @RtnMsg = N'更新節點排序失敗'
			RETURN
		END

		SET @RtnCode = 1
		SET @RtnMsg = N'更新成功'
		RETURN
	END

	DECLARE @MaxSortNo INT;
	DECLARE @MinSortNo INT;

	IF @SourceNodeSortNo > @TargetNodeSortNo
	BEGIN
		SET @MaxSortNo = @SourceNodeSortNo
		SET @MinSortNo = @TargetNodeSortNo
	END
	ELSE
	BEGIN
		SET @MaxSortNo = @TargetNodeSortNo
		SET @MinSortNo = @SourceNodeSortNo
	END

	DECLARE @NodeID INT;

	DECLARE my_cursor CURSOR FOR
	SELECT [NodeID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [ParentID] = @ParentID AND [NodeStatus] = 0 AND [NodeType] < 2
	AND [SortNo] BETWEEN @MinSortNo AND @MaxSortNo
	ORDER BY [SortNo], [NodeID]
	OPEN my_cursor
	FETCH NEXT FROM my_cursor INTO @NodeID
	WHILE @@fetch_status = 0
	BEGIN
		--插入目標節點上方
		IF @SortType = 1
		BEGIN
			IF @SourceNodeSortNo < @TargetNodeSortNo
			BEGIN -- S --> .T
				IF @NodeID = @SourceNode
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = @TargetNodeSortNo - 1 WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
				ELSE IF @NodeID <> @TargetNode
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = [SortNo] - 1 WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
			END
			ELSE
			BEGIN -- .T <-- S
				IF @NodeID = @SourceNode
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = @TargetNodeSortNo WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
				ELSE
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = [SortNo] + 1 WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
			END
		END

		--插入目標節點下方
		IF @SortType = 2
		BEGIN			
			IF @SourceNodeSortNo < @TargetNodeSortNo
			BEGIN -- S --> T.
				IF @NodeID = @SourceNode
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = @TargetNodeSortNo WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
				ELSE
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = SortNo - 1 WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
			END
			ELSE
			BEGIN -- T. <-- S
				IF @NodeID = @SourceNode
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = @TargetNodeSortNo + 1 WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
				ELSE IF @NodeID <> @TargetNode
				BEGIN
					UPDATE [dbo].[Node] SET [SortNo] = [SortNo] + 1 WHERE [NodeID] = @NodeID

					IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
					BEGIN
						SET @RtnCode = 102
						SET @RtnMsg = N'更新失敗'
						RETURN
					END
				END
			END
		END
		FETCH NEXT FROM my_cursor INTO @NodeID
	END
	CLOSE my_cursor
	DEALLOCATE my_cursor

	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Node_U]    Script Date: 2014/12/12 下午 03:13:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新節點>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Node_U] 
	-- Add the parameters for the stored procedure here	
	@NodeID			INT,
	@NodeType		TINYINT,		
	@NodeName		NVARCHAR(30),
	@NodeUrl		VARCHAR(255),
	@NodeTarget		TINYINT,
	@ParentID		INT,
	@RtnCode		INT					OUTPUT,
	@RtnMsg			NVARCHAR(100)		OUTPUT
AS
BEGIN

	IF @NodeType = 0
	BEGIN
		UPDATE [dbo].[Node] SET [NodeName] = @NodeName
		WHERE [NodeID] = @NodeID
		
		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 101
			SET @RtnMsg = N'更新失敗'
			RETURN
		END
		
	END

	IF @NodeType = 1 OR @NodeType = 2
	BEGIN
		DECLARE @OldParentID INT
		DECLARE @SortNo INT
		SELECT @OldParentID = [ParentID], @SortNo = [SortNo] FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeID] = @NodeID
		IF @OldParentID <> @ParentID
		BEGIN
			SELECT @SortNo = MAX(SortNO) FROM [dbo].[Node] WITH(NOLOCK) WHERE [ParentID] = @ParentID
			SET @SortNo = @SortNo + 1
		END

		UPDATE [dbo].[Node] SET
			[ParentID] = @ParentID,
			[NodeName] = @NodeName,
			[NodeTarget] = @NodeTarget,
			[NodeUrl] = @NodeUrl,
			[SortNo] = @SortNo
		WHERE NodeID = @NodeID
		
		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 102
			SET @RtnMsg = N'更新失敗'
			RETURN
		END
		
	END
	
	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'

END




GO



/****** Object:  StoredProcedure [dbo].[ousp_Admin_Role_D]    Script Date: 2014/12/12 下午 03:15:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<刪除角色>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Role_D] 
	-- Add the parameters for the stored procedure here
	@RoleID			INT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	--判斷角色是否存在
	IF NOT EXISTS(SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleID] = @RoleID AND [RoleStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'無此角色'
		RETURN
	END

	UPDATE [dbo].[Role] SET [RoleStatus] = 1 WHERE [RoleID] = @RoleID

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'刪除失敗'
		RETURN
	END

	--刪除該角色所有權限
	DELETE [dbo].[Role_Node] WHERE [RoleID] = @RoleID

	IF @@ROWCOUNT < 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 103
		SET @RtnMsg = N'刪除失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'刪除成功'
	
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Role_I]    Script Date: 2014/12/12 下午 03:15:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新角色>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Role_I] 
	-- Add the parameters for the stored procedure here	
	@RoleName		NVARCHAR(20),
	@RoleLevel		TINYINT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN

	IF EXISTS(SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleName] = @RoleName AND [RoleStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'角色名稱重覆'
		RETURN
	END

	INSERT INTO [dbo].[Role] ([RoleName], [RoleLevel])
	VALUES (@RoleName, @RoleLevel)

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'新增失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'新增成功'
	
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Role_Node_Permission_S]    Script Date: 2014/12/12 下午 03:16:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<依角色ID和ParentID取節點資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Role_Node_Permission_S] 
	-- Add the parameters for the stored procedure here
	@RoleID			INT, 
	@ParentID		INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @RoleLevel TINYINT
	SELECT @RoleLevel = [RoleLevel] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleID] = @RoleID
	IF @@ROWCOUNT < 1 OR @RoleLevel = 1
	BEGIN
		RETURN
	END

	--判斷是否為目錄
	IF @ParentID <> 0
	BEGIN
		IF @RoleLevel = 2 AND @ParentID > 1
		BEGIN
			RETURN
		END

		SELECT N.[NodeID], N.[NodeName], N.[ParentID], N.[SortNo],
			ISNULL(RN.[CanBrowse], 0) AS CanBrowse,
			ISNULL(RN.[CanInsert], 0) AS CanInsert,
			ISNULL(RN.[CanModify], 0) AS CanModify,
			ISNULL(RN.[CanDelete], 0) AS CanDelete FROM [dbo].[Node] AS N WITH(NOLOCK)
		LEFT OUTER JOIN [dbo].[Role_Node] AS RN WITH(NOLOCK)
		ON N.[NodeID] = RN.[NodeID] AND RN.[RoleID] = @RoleID WHERE (N.[ParentID] = @ParentID OR N.[NodeID] = @ParentID ) AND N.[NodeStatus] = 0
	END
	ELSE
	BEGIN
		IF @RoleLevel = 0
		BEGIN
			SELECT N.[NodeID], N.[NodeName], N.[ParentID], N.[SortNo],
				ISNULL(RN.[CanBrowse], 0) AS CanBrowse,
				ISNULL(RN.[CanInsert], 0) AS CanInsert,
				ISNULL(RN.[CanModify], 0) AS CanModify,
				ISNULL(RN.[CanDelete], 0) AS CanDelete FROM [dbo].[Node] AS N WITH(NOLOCK)
			LEFT OUTER JOIN [dbo].[Role_Node] AS RN WITH(NOLOCK)
			ON N.[NodeID] = RN.[NodeID] AND RN.[RoleID] = @RoleID WHERE N.[NodeStatus] = 0
		END
	
		IF @RoleLevel = 2
		BEGIN
			SELECT N.[NodeID], N.[NodeName], N.[ParentID], N.[SortNo],
				ISNULL(RN.[CanBrowse], 0) AS CanBrowse,
				ISNULL(RN.[CanInsert], 0) AS CanInsert,
				ISNULL(RN.[CanModify], 0) AS CanModify,
				ISNULL(RN.[CanDelete], 0) AS CanDelete FROM [dbo].[Node] AS N WITH(NOLOCK)
			LEFT OUTER JOIN [dbo].[Role_Node] AS RN WITH(NOLOCK)
			ON N.[NodeID] = RN.[NodeID] AND RN.[RoleID] = @RoleID WHERE (N.[ParentID] = 1 OR N.[NodeID] = 1) AND N.[NodeStatus] = 0
		END
	END
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Role_Node_Permission_U]    Script Date: 2014/12/12 下午 03:16:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新角色的節點權限>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Role_Node_Permission_U] 
	-- Add the parameters for the stored procedure here	
	@RoleID			INT, 
	@NodeID			INT,
	@CanBrowse		BIT,
	@CanInsert		BIT,
	@CanModify		BIT,
	@CanDelete		BIT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	IF NOT EXISTS(SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleID] = @RoleID AND [RoleStatus] = 0)
	BEGIN
		SET @RtnCode = 100
		SET @RtnMsg = N'無此角色'
		RETURN
	END

	IF NOT EXISTS(SELECT [NodeID] FROM [dbo].[Node] WITH(NOLOCK) WHERE [NodeID] = @NodeID AND [NodeStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'無此節點'
		RETURN
	END

	IF EXISTS(SELECT [RoleNodeID] FROM [dbo].[Role_Node] WITH(NOLOCK) WHERE [RoleID] = @RoleID AND [NodeID] = @NodeID)
	BEGIN
		UPDATE [dbo].[Role_Node] SET
			[CanBrowse] = @CanBrowse,
			[CanInsert] = @CanInsert,
			[CanModify] = @CanModify,
			[CanDelete] = @CanDelete
		WHERE [RoleID] = @RoleID AND [NodeID] = @NodeID

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 102
			SET @RtnMsg = N'更新失敗'
			RETURN
		END

	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Role_Node] ([RoleID], [NodeID], [CanBrowse], [CanInsert], [CanModify], [CanDelete])
		VALUES(@RoleID, @NodeID, @CanBrowse, @CanInsert, @CanModify, @CanDelete)

		IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
		BEGIN
			SET @RtnCode = 103
			SET @RtnMsg = N'新增失敗'
			RETURN
		END

	END

	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'

END




GO

/****** Object:  StoredProcedure [dbo].[ousp_Admin_Role_S]    Script Date: 2014/12/12 下午 03:16:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<取所有角色資訊>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Role_S] 
	-- Add the parameters for the stored procedure here
	@PageSize		INT, 
	@PageNo			INT,
	@Total			INT		OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT TOP (@PageSize) t1.* FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY [RoleID] DESC) AS RowIndex,
			[RoleID], [RoleName], [RoleLevel], [CreateDate], [LastModifiedDate] FROM [dbo].[Role] WITH(NOLOCK)
		WHERE [RoleStatus] = 0
	) AS t1
	WHERE t1.[RowIndex] > (@PageNo-1) * @PageSize

	--計算總筆數
	SELECT @Total = COUNT([RoleID])
	FROM [dbo].[Role] WITH(NOLOCK)
	WHERE [RoleStatus] = 0

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Role_U]    Script Date: 2014/12/12 下午 03:16:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新角色名稱>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Role_U] 	
	@RoleName		NVARCHAR(20),
	@RoleID			INT,
	@RoleLevel		TINYINT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  
    --判斷腳色是否存在
	IF NOT EXISTS(SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleID] = @RoleID AND [RoleStatus] = 0)
	BEGIN
		SET @RtnCode = 100
		SET @RtnMsg = N'無此角色'
		RETURN
	END

	--判斷角色名稱
	IF EXISTS(SELECT [RoleID] FROM [dbo].[Role] WITH(NOLOCK) WHERE [RoleName] = @RoleName AND [RoleID] <> @RoleID AND [RoleStatus] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'角色名稱重覆'
		RETURN
	END

	--更新角色
	UPDATE [dbo].[Role] SET [RoleName] = @RoleName, [RoleLevel] = @RoleLevel, [LastModifiedDate] = GETDATE() WHERE [RoleID] = @RoleID

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'更新失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_SystemLogin_S]    Script Date: 2014/12/12 下午 03:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<系統登入判斷>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_SystemLogin_S]
	@Account		VARCHAR(16),
	@Password		CHAR(32),
	@IPAddress		VARCHAR(15),	
	@RtnAccountID	INT				OUTPUT,
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.	
	SET NOCOUNT ON;

    DECLARE @TurePassword CHAR(32);
    DECLARE @NowLeaveStatus BIT;
	DECLARE @OLDLogErrorCount INT;
        
    --登入一個帳號錯誤一小時超過次
    IF EXISTS ( SELECT [AccountID] FROM [dbo].[Account] WITH (NOLOCK) WHERE [Account] = @Account AND [LogErrorCount] > 6 AND [LogErrorTime] > DATEADD(Hour,-1,GETDATE()))        
    BEGIN
        SET @RtnCode = 2 
        SET @RtnMsg = N'對不起，您輸入一帳號或密碼錯誤的次數已超過6 次，暫時無法登入系統'
        RETURN
    END

    --驗證登入帳號是否存在
    SELECT @RtnAccountID =A.[AccountID], @TurePassword = A.[Password], @NowLeaveStatus = A.[LeaveStatus], @OLDLogErrorCount = A.[LogErrorCount]
    FROM [dbo].[Account] A WITH (NOLOCK)
    WHERE A.[Account] = @Account

    --查無登入帳號
    IF @@ROWCOUNT < 1
    BEGIN
		SET @RtnCode = 3
		SET @RtnMsg = N'查無此帳號'
		RETURN
    END
    ELSE IF  @Password <> @TurePassword
    BEGIN
		 IF @OLDLogErrorCount IS NULL
        BEGIN
                SET @OLDLogErrorCount = 0;
        END

        --更新帳號登入錯誤次數及時間
        UPDATE [dbo].[Account] SET [LogErrorCount] = @OLDLogErrorCount + 1, [LogErrorTime] = GETDATE() WHERE [Account] = @Account

        DECLARE @LogErrorCount INT;
        SELECT @LogErrorCount = [LogErrorCount] FROM [dbo].[Account] WITH (NOLOCK) WHERE [Account] = @Account

        SET @RtnCode = 4
        SET @RtnMsg = N'對不起，您輸入的帳號或密碼錯誤' + CONVERT(VARCHAR,@LogErrorCount) + '次'
        RETURN
    END
    ELSE IF  @NowLeaveStatus <> 0
    BEGIN
        SET @RtnCode = 5
        SET @RtnMsg = N'此帳號非在職帳號'
        RETURN
    END
    --登入成功
    ELSE
    BEGIN
        --更新帳號登入次數及時間
        UPDATE [dbo].[Account] SET [LoginTime] = GETDATE() ,[LogErrorCount] = 0, [LogErrorTime] = NULL WHERE [Account] = @Account
                        
        --輸出參數
        SET @RtnCode = 1
        SET @RtnMsg = N'登入成功'
                
        RETURN
    END

END





GO






/****** Object:  StoredProcedure [dbo].[ousp_Admin_CheckIPPass_S]    Script Date: 2014/8/20 下午 04:07:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<檢查IP>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_CheckIPPass_S]		
	@AdminIP		VARCHAR(20),
	@RtnCode		INT				OUTPUT,
	@RtnMsg			NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE	@iAdminIP		BIGINT; 

    --將IP轉成數字
    SET @iAdminIP = [dbo].[Func_IPConvertToNumber](@AdminIP)

	--檢查IP是否存在
	IF EXISTS (SELECT [AdminIP] FROM [dbo].[Admin_IP] WITH(NOLOCK) WHERE [Status] = 0 AND [AdminIP] = @iAdminIP ) 
    BEGIN
		SET @RtnCode = 1
		SET @RtnMsg = N'IP合法'
		RETURN
	END
    ELSE 
	BEGIN
		SET @RtnCode = 102
		SET @RtnMsg = N'IP不合法'
		RETURN
	END
	
END


GO

/****** Object:  StoredProcedure [dbo].[ousp_Admin_Admin_IP_D]    Script Date: 2014/8/20 下午 05:59:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<刪除IP>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Admin_IP_D]
	@ID					INT,
	@RtnCode			INT				OUTPUT,
	@RtnMsg				NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE [dbo].[Admin_IP] SET [Status] = 99, [LastUpdateDate] = GETDATE() WHERE [ID] = @ID

	IF  @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN		
		SET @RtnCode = 101	--Update失敗
		SET @RtnMsg = N'刪除失敗'
		RETURN
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'刪除成功'

END

GO


USE [AdminTemplate]
GO

/****** Object:  StoredProcedure [dbo].[ousp_Admin_Admin_IP_I]    Script Date: 2014/12/19 上午 11:19:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<新增IP>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Admin_IP_I]	
	@AdminIP			VARCHAR(20),  
	@RtnCode			INT				OUTPUT,
	@RtnMsg				NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE  @iAdminIP	BIGINT;
	DECLARE  @iID	INT;
	DECLARE  @Status		SMALLINT;
    
	--將IP轉數字
	SET @iAdminIP = [dbo].[Func_IPConvertToNumber](@AdminIP)

	--判斷是否已有此組IP
	IF EXISTS (SELECT [AdminIP] FROM [dbo].[Admin_IP] WITH(NOLOCK) WHERE [AdminIP] = @iAdminIP AND [Status] = 0)
	BEGIN
		SET @RtnCode = 101
		SET @RtnMsg = N'IP重複'
		RETURN 
	END
	ELSE
	BEGIN
		--判斷公司是否有相同IP的資料(包含刪除的)
		SELECT @Status = [Status] , @iID = [ID] FROM [dbo].[Admin_IP] WITH(NOLOCK) WHERE [AdminIP] = @iAdminIP

		--如果已有相同IP,狀態為刪除,直接修改狀態
		IF @Status = 99
		BEGIN

			UPDATE [dbo].[Admin_IP]
				SET [LastUpdateDate] = GETDATE()
					,[Status] = 0
				WHERE [ID] = @iID
			
			IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
			BEGIN			
				SET @RtnCode = 101
				SET @RtnMsg = N'新增失敗'
				RETURN 
			END

		END
		ELSE
		BEGIN

			--公司沒有此組IP,新增IP
			INSERT INTO [dbo].[Admin_IP] ([AdminIP])
			VALUES (@iAdminIP)

			IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
			BEGIN			
				SET @RtnCode = 102
				SET @RtnMsg = N'新增失敗'
				RETURN 
			END

		END
	END

	SET @RtnCode = 1
	SET @RtnMsg = N'新增成功'

END


GO



/****** Object:  StoredProcedure [dbo].[ousp_Admin_Admin_IP_S]    Script Date: 2014/8/20 下午 06:00:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<查詢所有IP>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Admin_IP_S]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    SELECT [ID],[dbo].[Func_NumberConvertToIP]([AdminIP]) 'AdminIP',[CreateDate]
	FROM [dbo].[Admin_IP] WITH (NOLOCK)
	WHERE [Status] = 0
	ORDER BY [CreateDate]
	
END

GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_Admin_IP_U]    Script Date: 2014/8/20 下午 06:01:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<更新IP>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_Admin_IP_U]
	@ID					INT,
	@AdminIP			VARCHAR(20),
	@RtnCode			INT				OUTPUT,
	@RtnMsg				NVARCHAR(100)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE  @iAdminIP  BIGINT

	--將IP轉數字
	SET @iAdminIP = [dbo].[Func_IPConvertToNumber](@AdminIP)

	UPDATE [dbo].[Admin_IP]
	SET	[AdminIP] = @iAdminIP
	WHERE [ID] = @ID

	IF @@ROWCOUNT <> 1 OR @@ERROR <> 0
	BEGIN
		SET @RtnCode=101
		SET @RtnMsg = N'更新失敗'
		RETURN 	
	END	

	SET @RtnCode = 1
	SET @RtnMsg = N'更新成功'

END

GO


--_Admin建立函數

/****** Object:  UserDefinedFunction [dbo].[Func_IPConvertToNumber]    Script Date: 2014/8/21 下午 09:20:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[Func_IPConvertToNumber]

(@IP  VARCHAR(20))

RETURNS BIGINT

AS 

BEGIN

 DECLARE @Num BIGINT,

         @Str1 VARCHAR(5),

         @Str2 VARCHAR(5),

         @Str3 VARCHAR(5),

         @Str4 VARCHAR(5)

 SET @Str1 = LEFT(@IP,CHARINDEX('.',@IP)-1) 

 SET @IP = SUBSTRING(@IP,CHARINDEX('.',@IP)+1,LEN(@IP))

 SET @Str2 = LEFT(@IP,CHARINDEX('.',@IP)-1) 

 SET @IP = SUBSTRING(@IP,CHARINDEX('.',@IP)+1,LEN(@IP))

 SET @Str3 = LEFT(@IP,CHARINDEX('.',@IP)-1) 

 SET @Str4 = SUBSTRING(@IP,CHARINDEX('.',@IP)+1,LEN(@IP))

 SET  @Num = @Str1*(POWER('256',3))+@Str2*(POWER(256,2))+@Str3*(POWER(256,1))+@Str4

 RETURN @Num

END





GO


/****** Object:  UserDefinedFunction [dbo].[Func_NumberConvertToIP]    Script Date: 2014/8/21 下午 09:20:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[Func_NumberConvertToIP]

(@Number  BIGINT)

RETURNS VARCHAR(20)

AS 

BEGIN

 DECLARE @Str4 INT,

         @IP VARCHAR(20)

 SET @Str4=@Number%256

 SET @IP=CAST((@Number-@Str4)/256/256/256%256 AS VARCHAR(5))+'.'+CAST((@Number-@Str4)/256/256%256 AS VARCHAR(5))

         +'.'+CAST((@Number-@Str4)/256%256 AS VARCHAR(5))+'.'+cASt(@Str4 AS VARCHAR(5))

 RETURN @IP

END





GO

--Inser資料


GO

INSERT INTO [dbo].[Account]
           ([Account]
           ,[Password]        
           ,[LogErrorCount]          
           ,[LeaveStatus])
     VALUES
           ('omg'
           ,'c0d256ee4c19b2761abaf54a2ad1f043'          
           ,0       
           ,0)
GO



GO

INSERT INTO [dbo].[Account_Role]
           ([AccountID]
           ,[RoleID])
     VALUES
           (1
           ,1)
GO


GO

INSERT INTO [dbo].[Node]
           ([ParentID]
           ,[NodeName]
           ,[NodeType]
           ,[NodeTarget] 		 
           ,[SortNo]
           ,[NodeStatus])
     VALUES
           (0
           ,'系統設定'
           ,0
           ,0        
           ,1
           ,0)
GO



GO

INSERT INTO [dbo].[Node]
           ([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'帳號管理'
           ,1
           ,0
		   ,'/AdminSystem/AccountCtrl.aspx'        
           ,1
           ,0)
GO


INSERT INTO [dbo].[Node]
			([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'選單管理'
           ,1
           ,0
		   ,'/AdminSystem/NodeCtrl.aspx'        
           ,2
           ,0)
GO

INSERT INTO [dbo].[Node]
			([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'角色管理'
           ,1
           ,0
		   ,'/AdminSystem/RoleCtrl.aspx'        
           ,3
           ,0)
GO


GO

INSERT INTO [dbo].[Node]
			([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'帳號權限設定'
           ,1
           ,0
		   ,'/AdminSystem/PermissionAccount.aspx'        
           ,4
           ,0)
GO


INSERT INTO [dbo].[Node]
			([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'角色權限設定'
           ,1
           ,0
		   ,'/AdminSystem/PermissionRole.aspx'        
           ,5
           ,0)
GO

INSERT INTO [dbo].[Node]
			([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'登入記錄'
           ,1
           ,0
		   ,'/AdminSystem/SysLog.aspx'        
           ,6
           ,0)
GO


INSERT INTO [dbo].[Node]
			([ParentID]
			,[NodeName]
			,[NodeType]
			,[NodeTarget]
			,[NodeUrl]
			,[SortNo]
			,[NodeStatus])
     VALUES
           (1
           ,'IP管理'
           ,1
           ,0
		   ,'/AdminSystem/AdminIPCtrl.aspx'        
           ,6
           ,0)
GO

GO

INSERT INTO [dbo].[Role]
           ([RoleName]
           ,[RoleLevel]
           ,[RoleStatus])
     VALUES
           ('系統管理員'
           ,1
           ,0)
GO