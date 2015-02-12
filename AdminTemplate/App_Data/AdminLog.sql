--_AdminLog建立SP

/****** Object:  StoredProcedure [dbo].[ousp_Admin_AdminActionLog_I]    Script Date: 2014/12/12 下午 03:24:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Nick>
-- Create date: <20110908>
-- Description:	<後台LOG記錄>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_AdminActionLog_I]
	@AccountID			INT,
	@Account			VARCHAR(16),
	@ActionNode			VARCHAR(255),
	@ActionIP			VARCHAR(20),
	@ActionType			NVARCHAR(10),
	@Note				NVARCHAR(100),
	@Parameter			NVARCHAR(800)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- interfering with SELECT statements.

	DECLARE @SQL AS NVARCHAR(1000)
	
	DECLARE @TableName AS VARCHAR(22)
	DECLARE @actionName AS NVARCHAR(30)
	
	EXEC	[AdminTemplate].[dbo].[ousp_Admin_Node_NameByUrl_S]
			@NodeUrl = @ActionNode,
			@NodeName = @actionName OUTPUT

	SET @TableName= N'AdminActionLog_' + CONVERT (VARCHAR(6),GETDATE(),112)

	SET @SQL = N'INSERT INTO ' + @TableName + '
			   ([AccountID]
			   ,[Account]
			   ,[ActionNode]
			   ,[ActionName]
			   ,[ActionType]
			   ,[ActionIP]
			   ,[Note]
			   ,[Parameter])
		 VALUES
			   (''' + CAST ( @AccountID AS VARCHAR ) + '''
			   ,N''' + @Account + '''
			   ,N''' + @ActionNode + '''
			   ,N''' + @actionName + '''
			   ,N''' + @ActionType + '''
			   ,N''' + @ActionIP + '''
			   ,N''' + @Note + '''
			   ,N''' + @Parameter + ''')'
			   
	EXEC(@SQL)
	
END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Schedule_AdminActionLog_CreateByMonth]    Script Date: 2014/12/12 下午 03:24:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<nick>
-- Create date: <20110916>
-- Description:	<Create admin_actionlog table for every Month and grant the user ID :ptr_AdminLog_SP>
-- =============================================
CREATE PROCEDURE  [dbo].[ousp_Schedule_AdminActionLog_CreateByMonth]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TblName NVARCHAR(100)
	
	SET @TblName='AdminActionLog_'+ CONVERT(VARCHAR(6),DATEADD(MONTH,1,GETDATE()),112)

	IF NOT EXISTS (SELECT 1 FROM  SYS.tables WHERE OBJECT_ID=OBJECT_ID(@TblName,N'U') )
	
		BEGIN

			EXEC ('
			CREATE TABLE [dbo].[' + @TblName + '](
				[AutoID] [int] IDENTITY(1,1) NOT NULL,
				[AccountID] [int] NOT NULL,
				[Account] [varchar](16) NOT NULL,
				[ActionNode] [varchar](255) NOT NULL,
				[ActionName] [nvarchar](30) NULL,
				[ActionType] [nvarchar](10) NOT NULL,
				[ActionIP] [varchar](20) NULL,
				[Note] [nvarchar](100) NULL,
				[Parameter] [varchar](800) NULL,
				[ActionTime] [datetime] NOT NULL CONSTRAINT [DF_' + @TblName + '_actionTime]  DEFAULT (getdate()),
			 CONSTRAINT [PK_' + @TblName + '] PRIMARY KEY CLUSTERED 
			(
				[AutoID] ASC
			)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
			) ON [PRIMARY]

			GRANT SELECT(AccountID,Account,ActionNode,ActionName,ActionType,ActionIP,Note,Parameter,ActionTime)
				, INSERT 
			ON '+@TblName+ ' TO  AdminLog;
			');

			--WebNameAdminLogSP修改成要給權限的使用著名稱
		End

		

END




GO


/****** Object:  StoredProcedure [dbo].[ousp_Admin_AdminActionLog_S]    Script Date: 2014/12/12 下午 03:24:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<查詢Log>
-- =============================================
CREATE PROCEDURE [dbo].[ousp_Admin_AdminActionLog_S] 
	-- Add the parameters for the stored procedure here
	@Account			VARCHAR(16),
	@StartDate			DATETIME,
	@EndDate			DATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- interfering with SELECT statements.

	DECLARE @StartNum INT, @EndNUm INT, @TABLE_NAME VARCHAR(50), @TableNum INT, @SQLStr_Table VARCHAR(1050) -- 36+43*23 2years
	SET @StartNum = CAST(CONVERT(VARCHAR(6), @StartDate, 112) AS INT)
	SET @EndNUm = CAST(CONVERT(VARCHAR(6), @EndDate, 112) AS INT)
	SET @SQLStr_Table = ''

	--取可查詢的Table
	DECLARE cur CURSOR FOR
	SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'AdminActionLog%'
	OPEN cur
	FETCH NEXT FROM cur INTO @TABLE_NAME
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @TableNum = CAST(RIGHT(@TABLE_NAME, 6) AS INT)
		IF @TableNum BETWEEN @StartNum AND @EndNUm
		BEGIN
			IF @SQLStr_Table = ''
			BEGIN
				SET @SQLStr_Table = 'SELECT AccountID,Account,ActionNode,ActionName,ActionType,ActionIP,Note,Parameter,ActionTime FROM AdminActionLog_' + CAST(@TableNum AS VARCHAR) + ' WITH(NOLOCK)'
			END
			ELSE
			BEGIN
				SET @SQLStr_Table = @SQLStr_Table + ' UNION SELECT AccountID,Account,ActionNode,ActionName,ActionType,ActionIP,Note,Parameter,ActionTime FROM AdminActionLog_' + CAST(@TableNum AS VARCHAR) + ' WITH(NOLOCK)'
			END
			
			
		END

		FETCH NEXT FROM cur INTO @TABLE_NAME
	END

	CLOSE cur
	DEALLOCATE cur

	--查詢
	IF @SQLStr_Table <> ''
	BEGIN
		DECLARE @SQLStr VARCHAR(1500) -- 1050+450

		SET @SQLStr = 'SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY ActionTime DESC) AS RowIndex,AccountID,Account,ActionNode,ActionName,ActionType,ActionIP,Note,Parameter,ActionTime FROM('
			+ @SQLStr_Table + ') AS t1 WHERE 1=1'
		IF @Account <> ''
		BEGIN
			SET @SQLStr = @SQLStr + ' AND Account = ''' + @Account + ''''
		END
		
		SET @SQLStr = @SQLStr + ' AND ActionTime BETWEEN ''' + CAST(@StartDate AS VARCHAR) + ''' AND ''' + CAST(@EndDate AS VARCHAR) + ''''
			+ ') AS t2 WHERE RowIndex < 20001'
	END

	--PRINT len(@SQLStr)
	EXEC(@SQLStr)

	--產生沒有意義的Table,當產生CodeGen時會回傳Table
	RETURN
	SELECT TOP 1 [AccountID] FROM [AdminTemplate].[dbo].[Account]

END




GO


