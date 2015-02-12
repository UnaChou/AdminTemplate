using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace AdminTemplate.ORM.WebName_Admin
{
    public partial class WebName_AdminSP
    {

        protected string _DbConfigKey;
        public string DbConfigKey
        {
            get { return this._DbConfigKey; }
            set { this._DbConfigKey = value; }
        }
        public WebName_AdminSP(string dbConfigKey)
        {
            this.DbConfigKey = dbConfigKey;
        }


        #region ousp_Admin_Account_Account_S

        /// <summary>
        /// 查詢帳號
        /// 	2013/02/25 by Randy
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>     
        /// <param name="account"></param>
        /// <param name="total"></param>
        public DataTable Ousp_Admin_Account_Account_S(int? pageSize, int? pageNo, string account, ref int? total)
        {
            SqlParameter[] sqlParams = new SqlParameter[4];

            sqlParams[0] = new SqlParameter("@PageSize", pageSize);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@PageNo", pageNo);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@Account", account);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 16;

            sqlParams[3] = new SqlParameter("@Total", total);
            sqlParams[3].Direction = ParameterDirection.Output;

            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Account_Account_S", sqlParams);
            total = sqlParams[3].Value == System.DBNull.Value ? null : (int?)sqlParams[3].Value;

            return dt;

        }
        #endregion

        #region ousp_Admin_Account_D

        /// <summary>
        /// 刪除帳號
        /// 	2013/02/25 by Randy
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Account_D(int? accountID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[1].Direction = ParameterDirection.Output;

            sqlParams[2] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[2].Direction = ParameterDirection.Output;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 100;

            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Account_D", sqlParams);
            rtnCode = sqlParams[1].Value == System.DBNull.Value ? null : (int?)sqlParams[1].Value;
            rtnMsg = sqlParams[2].Value == System.DBNull.Value ? null : (string)sqlParams[2].Value;


        }// end of ... public void Ousp_Admin_Account_D(int? accountID, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Account_I

        /// <summary>
        /// 新增帳號
        /// 	2013/02/25 by Randy
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <param name="roleID"></param>
        /// <param name="gameID"></param>     
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Account_I(string account, string password, string roleID, string gameID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[6];

            sqlParams[0] = new SqlParameter("@Account", account);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 16;

            sqlParams[1] = new SqlParameter("@Password", password);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].Size = 32;

            sqlParams[2] = new SqlParameter("@RoleID", roleID);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 200;

            sqlParams[3] = new SqlParameter("@GameID", gameID);
            sqlParams[3].Direction = ParameterDirection.Input;
            sqlParams[3].SqlDbType = SqlDbType.NVarChar;
            sqlParams[3].Size = 200;

            sqlParams[4] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[4].Direction = ParameterDirection.Output;

            sqlParams[5] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[5].Direction = ParameterDirection.Output;
            sqlParams[5].SqlDbType = SqlDbType.NVarChar;
            sqlParams[5].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Account_I", sqlParams);
            rtnCode = sqlParams[4].Value == System.DBNull.Value ? null : (int?)sqlParams[4].Value;
            rtnMsg = sqlParams[5].Value == System.DBNull.Value ? null : (string)sqlParams[5].Value;


        }
        #endregion

        #region ousp_Admin_Account_LastUpdatePWD_SU

        /// <summary>
        /// 查詢密碼最後修改時間&更新登入IP
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="account"></param>
        /// <param name="lastUpdateIP"></param>
        /// <param name="lastUpdatePWD"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Account_LastUpdatePWD_SU(string account, string lastUpdateIP, ref DateTime? lastUpdatePWD, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[5];

            sqlParams[0] = new SqlParameter("@Account", account);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 16;

            sqlParams[1] = new SqlParameter("@LastUpdateIP", lastUpdateIP);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].SqlDbType = SqlDbType.NVarChar;
            sqlParams[1].Size = 20;

            sqlParams[2] = new SqlParameter("@LastUpdatePWD", lastUpdatePWD);
            sqlParams[2].Direction = ParameterDirection.Output;

            sqlParams[3] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[3].Direction = ParameterDirection.Output;

            sqlParams[4] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[4].Direction = ParameterDirection.Output;
            sqlParams[4].SqlDbType = SqlDbType.NVarChar;
            sqlParams[4].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Account_LastUpdatePWD_SU", sqlParams);
            lastUpdatePWD = sqlParams[2].Value == System.DBNull.Value ? null : (DateTime?)sqlParams[2].Value;
            rtnCode = sqlParams[3].Value == System.DBNull.Value ? null : (int?)sqlParams[3].Value;
            rtnMsg = sqlParams[4].Value == System.DBNull.Value ? null : (string)sqlParams[4].Value;


        }// end of ... public void Ousp_Admin_Account_LastUpdatePWD_SU(string account, string lastUpdateIP, ref DateTime? lastUpdatePWD, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Account_Node_Permission_S

        /// <summary>
        /// 取節點資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="parentID"></param>
        public DataTable Ousp_Admin_Account_Node_Permission_S(int? accountID, int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@ParentID", parentID);
            sqlParams[1].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Account_Node_Permission_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Account_Node_Permission_S(int? accountID, int? parentID)

        /// <summary>
        /// 取節點資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="parentID"></param>
        public DataSet Ousp_Admin_Account_Node_Permission_SToDataSet(int? accountID, int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@ParentID", parentID);
            sqlParams[1].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Account_Node_Permission_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Account_Node_Permission_SToDataSet(int? accountID, int? parentID)

        #endregion

        #region ousp_Admin_Account_Node_Permission_U

        /// <summary>
        /// 更新帳號的節點權限
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="nodeID"></param>
        /// <param name="canBrowse"></param>
        /// <param name="canInsert"></param>
        /// <param name="canModify"></param>
        /// <param name="canDelete"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Account_Node_Permission_U(int? accountID, int? nodeID, bool? canBrowse, bool? canInsert, bool? canModify, bool? canDelete, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[8];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@NodeID", nodeID);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@CanBrowse", canBrowse);
            sqlParams[2].Direction = ParameterDirection.Input;

            sqlParams[3] = new SqlParameter("@CanInsert", canInsert);
            sqlParams[3].Direction = ParameterDirection.Input;

            sqlParams[4] = new SqlParameter("@CanModify", canModify);
            sqlParams[4].Direction = ParameterDirection.Input;

            sqlParams[5] = new SqlParameter("@CanDelete", canDelete);
            sqlParams[5].Direction = ParameterDirection.Input;

            sqlParams[6] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[6].Direction = ParameterDirection.Output;

            sqlParams[7] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[7].Direction = ParameterDirection.Output;
            sqlParams[7].SqlDbType = SqlDbType.NVarChar;
            sqlParams[7].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Account_Node_Permission_U", sqlParams);
            rtnCode = sqlParams[6].Value == System.DBNull.Value ? null : (int?)sqlParams[6].Value;
            rtnMsg = sqlParams[7].Value == System.DBNull.Value ? null : (string)sqlParams[7].Value;


        }// end of ... public void Ousp_Admin_Account_Node_Permission_U(int? accountID, int? nodeID, bool? canBrowse, bool? canInsert, bool? canModify, bool? canDelete, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Account_PWD_U

        /// <summary>
        /// 使用者修改密碼
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Account_PWD_U(int? accountID, string oldPassword, string newPassword, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[5];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@OldPassword", oldPassword);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].Size = 32;

            sqlParams[2] = new SqlParameter("@NewPassword", newPassword);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].Size = 32;

            sqlParams[3] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[3].Direction = ParameterDirection.Output;

            sqlParams[4] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[4].Direction = ParameterDirection.Output;
            sqlParams[4].SqlDbType = SqlDbType.NVarChar;
            sqlParams[4].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Account_PWD_U", sqlParams);
            rtnCode = sqlParams[3].Value == System.DBNull.Value ? null : (int?)sqlParams[3].Value;
            rtnMsg = sqlParams[4].Value == System.DBNull.Value ? null : (string)sqlParams[4].Value;


        }// end of ... public void Ousp_Admin_Account_PWD_U(int? accountID, string oldPassword, string newPassword, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Account_Role_ByAccountID_S

        /// <summary>
        /// 依使用者ID查詢角色ID
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        public DataTable Ousp_Admin_Account_Role_ByAccountID_S(int? accountID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Account_Role_ByAccountID_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Account_Role_ByAccountID_S(int? accountID)

        /// <summary>
        /// 依使用者ID查詢角色ID
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        public DataSet Ousp_Admin_Account_Role_ByAccountID_SToDataSet(int? accountID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Account_Role_ByAccountID_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Account_Role_ByAccountID_SToDataSet(int? accountID)

        #endregion

        #region ousp_Admin_Account_Role_S

        /// <summary>
        /// 查詢所有角色資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        public DataTable Ousp_Admin_Account_Role_S()
        {
            SqlParameter[] sqlParams = new SqlParameter[0];


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Account_Role_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Account_Role_S()

        /// <summary>
        /// 查詢所有角色資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        public DataSet Ousp_Admin_Account_Role_SToDataSet()
        {
            SqlParameter[] sqlParams = new SqlParameter[0];

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Account_Role_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Account_Role_SToDataSet()

        #endregion

        #region ousp_Admin_Account_S

        /// <summary>
        /// 查詢所有帳號
        /// 	Create Date,, by Author,,Name
        /// </summary>
        public DataTable Ousp_Admin_Account_S()
        {
            SqlParameter[] sqlParams = new SqlParameter[0];


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Account_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Account_S()

        /// <summary>
        /// 查詢所有帳號
        /// 	Create Date,, by Author,,Name
        /// </summary>
        public DataSet Ousp_Admin_Account_SToDataSet()
        {
            SqlParameter[] sqlParams = new SqlParameter[0];

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Account_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Account_SToDataSet()

        #endregion

        #region ousp_Admin_Account_U

        /// <summary>
        /// 更新帳號資訊
        /// 	2013/02/25 by Randy
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <param name="roleID"></param>
        /// <param name="gameID"></param>
        /// <param name="accountID"></param>     
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Account_U(string account, string password, string roleID, string gameID, int? accountID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[7];

            sqlParams[0] = new SqlParameter("@Account", account);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 16;

            sqlParams[1] = new SqlParameter("@Password", password);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].Size = 32;

            sqlParams[2] = new SqlParameter("@RoleID", roleID);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 200;

            sqlParams[3] = new SqlParameter("@GameID", gameID);
            sqlParams[3].Direction = ParameterDirection.Input;
            sqlParams[3].SqlDbType = SqlDbType.NVarChar;
            sqlParams[3].Size = 200;

            sqlParams[4] = new SqlParameter("@AccountID", accountID);
            sqlParams[4].Direction = ParameterDirection.Input;

            sqlParams[5] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[5].Direction = ParameterDirection.Output;

            sqlParams[6] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[6].Direction = ParameterDirection.Output;
            sqlParams[6].SqlDbType = SqlDbType.NVarChar;
            sqlParams[6].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Account_U", sqlParams);
            rtnCode = sqlParams[5].Value == System.DBNull.Value ? null : (int?)sqlParams[5].Value;
            rtnMsg = sqlParams[6].Value == System.DBNull.Value ? null : (string)sqlParams[6].Value;


        }
        #endregion

        #region ousp_Admin_Node_ByParentID_S

        /// <summary>
        /// 依ParentID查詢節點
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="parentID"></param>
        public DataTable Ousp_Admin_Node_ByParentID_S(int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@ParentID", parentID);
            sqlParams[0].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Node_ByParentID_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Node_ByParentID_S(int? parentID)

        /// <summary>
        /// 依ParentID查詢節點
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="parentID"></param>
        public DataSet Ousp_Admin_Node_ByParentID_SToDataSet(int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@ParentID", parentID);
            sqlParams[0].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Node_ByParentID_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Node_ByParentID_SToDataSet(int? parentID)

        #endregion

        #region ousp_Admin_Node_D

        /// <summary>
        /// 刪除節點
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="nodeID"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Node_D(int? nodeID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@NodeID", nodeID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[1].Direction = ParameterDirection.Output;

            sqlParams[2] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[2].Direction = ParameterDirection.Output;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Node_D", sqlParams);
            rtnCode = sqlParams[1].Value == System.DBNull.Value ? null : (int?)sqlParams[1].Value;
            rtnMsg = sqlParams[2].Value == System.DBNull.Value ? null : (string)sqlParams[2].Value;


        }// end of ... public void Ousp_Admin_Node_D(int? nodeID, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Node_I

        /// <summary>
        /// 新增節點
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="nodeType"></param>
        /// <param name="nodeName"></param>
        /// <param name="nodeUrl"></param>
        /// <param name="nodeTarget"></param>
        /// <param name="parentID"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Node_I(byte? nodeType, string nodeName, string nodeUrl, byte? nodeTarget, int? parentID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[7];

            sqlParams[0] = new SqlParameter("@NodeType", nodeType);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@NodeName", nodeName);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].SqlDbType = SqlDbType.NVarChar;
            sqlParams[1].Size = 30;

            sqlParams[2] = new SqlParameter("@NodeUrl", nodeUrl);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 255;

            sqlParams[3] = new SqlParameter("@NodeTarget", nodeTarget);
            sqlParams[3].Direction = ParameterDirection.Input;

            sqlParams[4] = new SqlParameter("@ParentID", parentID);
            sqlParams[4].Direction = ParameterDirection.Input;

            sqlParams[5] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[5].Direction = ParameterDirection.Output;

            sqlParams[6] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[6].Direction = ParameterDirection.Output;
            sqlParams[6].SqlDbType = SqlDbType.NVarChar;
            sqlParams[6].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Node_I", sqlParams);
            rtnCode = sqlParams[5].Value == System.DBNull.Value ? null : (int?)sqlParams[5].Value;
            rtnMsg = sqlParams[6].Value == System.DBNull.Value ? null : (string)sqlParams[6].Value;


        }// end of ... public void Ousp_Admin_Node_I(byte? nodeType, string nodeName, string nodeUrl, byte? nodeTarget, int? parentID, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Node_Menu_S

        /// <summary>
        /// 依使用者ID取目錄資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        public DataTable Ousp_Admin_Node_Menu_S(int? accountID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Node_Menu_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Node_Menu_S(int? accountID)

        /// <summary>
        /// 依使用者ID取目錄資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        public DataSet Ousp_Admin_Node_Menu_SToDataSet(int? accountID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Node_Menu_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Node_Menu_SToDataSet(int? accountID)

        #endregion

        #region ousp_Admin_Node_NameByUrl_S

        /// <summary>
        /// 取出node 的Node 名稱
        /// 	20110915 by Nick
        /// </summary>
        /// <param name="nodeUrl"></param>
        /// <param name="nodeName"></param>
        public void Ousp_Admin_Node_NameByUrl_S(string nodeUrl, ref string nodeName)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@NodeUrl", nodeUrl);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 255;

            sqlParams[1] = new SqlParameter("@NodeName", nodeName);
            sqlParams[1].Direction = ParameterDirection.Output;
            sqlParams[1].SqlDbType = SqlDbType.NVarChar;
            sqlParams[1].Size = 30;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Node_NameByUrl_S", sqlParams);
            nodeName = sqlParams[1].Value == System.DBNull.Value ? null : (string)sqlParams[1].Value;


        }// end of ... public void Ousp_Admin_Node_NameByUrl_S(string nodeUrl, ref string nodeName)


        #endregion

        #region ousp_Admin_Node_Permission_S

        /// <summary>
        /// 頁面權限檢查
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="nodeUrl"></param>
        /// <param name="canBrowse"></param>
        /// <param name="canInsert"></param>
        /// <param name="canModify"></param>
        /// <param name="canDelete"></param>
        public void Ousp_Admin_Node_Permission_S(int? accountID, string nodeUrl, ref bool? canBrowse, ref bool? canInsert, ref bool? canModify, ref bool? canDelete)
        {
            SqlParameter[] sqlParams = new SqlParameter[6];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@NodeUrl", nodeUrl);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].SqlDbType = SqlDbType.NVarChar;
            sqlParams[1].Size = 255;

            sqlParams[2] = new SqlParameter("@CanBrowse", canBrowse);
            sqlParams[2].Direction = ParameterDirection.Output;

            sqlParams[3] = new SqlParameter("@CanInsert", canInsert);
            sqlParams[3].Direction = ParameterDirection.Output;

            sqlParams[4] = new SqlParameter("@CanModify", canModify);
            sqlParams[4].Direction = ParameterDirection.Output;

            sqlParams[5] = new SqlParameter("@CanDelete", canDelete);
            sqlParams[5].Direction = ParameterDirection.Output;

            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Node_Permission_S", sqlParams);
            canBrowse = sqlParams[2].Value == System.DBNull.Value ? null : (bool?)sqlParams[2].Value;
            canInsert = sqlParams[3].Value == System.DBNull.Value ? null : (bool?)sqlParams[3].Value;
            canModify = sqlParams[4].Value == System.DBNull.Value ? null : (bool?)sqlParams[4].Value;
            canDelete = sqlParams[5].Value == System.DBNull.Value ? null : (bool?)sqlParams[5].Value;


        }// end of ... public void Ousp_Admin_Node_Permission_S(int? accountID, string nodeUrl, ref bool? canBrowse, ref bool? canInsert, ref bool? canModify, ref bool? canDelete)


        #endregion

        #region ousp_Admin_Node_S

        /// <summary>
        /// 取出所有節點資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="parentID"></param>
        public DataTable Ousp_Admin_Node_S(int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@ParentID", parentID);
            sqlParams[0].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Node_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Node_S(int? parentID)

        /// <summary>
        /// 取出所有節點資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="parentID"></param>
        public DataSet Ousp_Admin_Node_SToDataSet(int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            sqlParams[0] = new SqlParameter("@ParentID", parentID);
            sqlParams[0].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Node_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Node_SToDataSet(int? parentID)

        #endregion

        #region ousp_Admin_Node_Sort_U

        /// <summary>
        /// 更新節點排序
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="sourceNode"></param>
        /// <param name="targetNode"></param>
        /// <param name="sortType"> 0:與目標節點互換, 1:插入目標節點上方, 2:插入目標節點下方</param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Node_Sort_U(int? sourceNode, int? targetNode, byte? sortType, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[5];

            sqlParams[0] = new SqlParameter("@SourceNode", sourceNode);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@TargetNode", targetNode);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@SortType", sortType);
            sqlParams[2].Direction = ParameterDirection.Input;

            sqlParams[3] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[3].Direction = ParameterDirection.Output;

            sqlParams[4] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[4].Direction = ParameterDirection.Output;
            sqlParams[4].SqlDbType = SqlDbType.NVarChar;
            sqlParams[4].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Node_Sort_U", sqlParams);
            rtnCode = sqlParams[3].Value == System.DBNull.Value ? null : (int?)sqlParams[3].Value;
            rtnMsg = sqlParams[4].Value == System.DBNull.Value ? null : (string)sqlParams[4].Value;


        }// end of ... public void Ousp_Admin_Node_Sort_U(int? sourceNode, int? targetNode, byte? sortType, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Node_U

        /// <summary>
        /// 更新節點
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="nodeID"></param>
        /// <param name="nodeType"> 0:與目標節點互換, 1:插入目標節點上方, 2:插入目標節點下方</param>
        /// <param name="nodeName"></param>
        /// <param name="nodeUrl"></param>
        /// <param name="nodeTarget"></param>
        /// <param name="parentID"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Node_U(int? nodeID, byte? nodeType, string nodeName, string nodeUrl, byte? nodeTarget, int? parentID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[8];

            sqlParams[0] = new SqlParameter("@NodeID", nodeID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@NodeType", nodeType);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@NodeName", nodeName);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 30;

            sqlParams[3] = new SqlParameter("@NodeUrl", nodeUrl);
            sqlParams[3].Direction = ParameterDirection.Input;
            sqlParams[3].SqlDbType = SqlDbType.NVarChar;
            sqlParams[3].Size = 255;

            sqlParams[4] = new SqlParameter("@NodeTarget", nodeTarget);
            sqlParams[4].Direction = ParameterDirection.Input;

            sqlParams[5] = new SqlParameter("@ParentID", parentID);
            sqlParams[5].Direction = ParameterDirection.Input;

            sqlParams[6] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[6].Direction = ParameterDirection.Output;

            sqlParams[7] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[7].Direction = ParameterDirection.Output;
            sqlParams[7].SqlDbType = SqlDbType.NVarChar;
            sqlParams[7].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Node_U", sqlParams);
            rtnCode = sqlParams[6].Value == System.DBNull.Value ? null : (int?)sqlParams[6].Value;
            rtnMsg = sqlParams[7].Value == System.DBNull.Value ? null : (string)sqlParams[7].Value;


        }// end of ... public void Ousp_Admin_Node_U(int? nodeID, byte? nodeType, string nodeName, string nodeUrl, byte? nodeTarget, int? parentID, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Role_D

        /// <summary>
        /// 刪除角色
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="roleID"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Role_D(int? roleID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@RoleID", roleID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[1].Direction = ParameterDirection.Output;

            sqlParams[2] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[2].Direction = ParameterDirection.Output;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 100;



            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Role_D", sqlParams);
            rtnCode = sqlParams[1].Value == System.DBNull.Value ? null : (int?)sqlParams[1].Value;
            rtnMsg = sqlParams[2].Value == System.DBNull.Value ? null : (string)sqlParams[2].Value;


        }// end of ... public void Ousp_Admin_Role_D(int? roleID, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Role_I

        /// <summary>
        /// 更新角色
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="roleLevel"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Role_I(string roleName, byte? roleLevel, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[4];

            sqlParams[0] = new SqlParameter("@RoleName", roleName);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 20;

            sqlParams[1] = new SqlParameter("@RoleLevel", roleLevel);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[2].Direction = ParameterDirection.Output;

            sqlParams[3] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[3].Direction = ParameterDirection.Output;
            sqlParams[3].SqlDbType = SqlDbType.NVarChar;
            sqlParams[3].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Role_I", sqlParams);
            rtnCode = sqlParams[2].Value == System.DBNull.Value ? null : (int?)sqlParams[2].Value;
            rtnMsg = sqlParams[3].Value == System.DBNull.Value ? null : (string)sqlParams[3].Value;


        }// end of ... public void Ousp_Admin_Role_I(string roleName, byte? roleLevel, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Role_Node_Permission_S

        /// <summary>
        /// 依角色ID和ParentID取節點資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="roleID"></param>
        /// <param name="parentID"></param>
        public DataTable Ousp_Admin_Role_Node_Permission_S(int? roleID, int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@RoleID", roleID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@ParentID", parentID);
            sqlParams[1].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Role_Node_Permission_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Role_Node_Permission_S(int? roleID, int? parentID)

        /// <summary>
        /// 依角色ID和ParentID取節點資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="roleID"></param>
        /// <param name="parentID"></param>
        public DataSet Ousp_Admin_Role_Node_Permission_SToDataSet(int? roleID, int? parentID)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@RoleID", roleID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@ParentID", parentID);
            sqlParams[1].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Role_Node_Permission_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_Role_Node_Permission_SToDataSet(int? roleID, int? parentID)

        #endregion

        #region ousp_Admin_Role_Node_Permission_U

        /// <summary>
        /// 更新角色的節點權限
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="roleID"></param>
        /// <param name="nodeID"></param>
        /// <param name="canBrowse"></param>
        /// <param name="canInsert"></param>
        /// <param name="canModify"></param>
        /// <param name="canDelete"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Role_Node_Permission_U(int? roleID, int? nodeID, bool? canBrowse, bool? canInsert, bool? canModify, bool? canDelete, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[8];

            sqlParams[0] = new SqlParameter("@RoleID", roleID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@NodeID", nodeID);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@CanBrowse", canBrowse);
            sqlParams[2].Direction = ParameterDirection.Input;

            sqlParams[3] = new SqlParameter("@CanInsert", canInsert);
            sqlParams[3].Direction = ParameterDirection.Input;

            sqlParams[4] = new SqlParameter("@CanModify", canModify);
            sqlParams[4].Direction = ParameterDirection.Input;

            sqlParams[5] = new SqlParameter("@CanDelete", canDelete);
            sqlParams[5].Direction = ParameterDirection.Input;

            sqlParams[6] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[6].Direction = ParameterDirection.Output;

            sqlParams[7] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[7].Direction = ParameterDirection.Output;
            sqlParams[7].SqlDbType = SqlDbType.NVarChar;
            sqlParams[7].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Role_Node_Permission_U", sqlParams);
            rtnCode = sqlParams[6].Value == System.DBNull.Value ? null : (int?)sqlParams[6].Value;
            rtnMsg = sqlParams[7].Value == System.DBNull.Value ? null : (string)sqlParams[7].Value;


        }// end of ... public void Ousp_Admin_Role_Node_Permission_U(int? roleID, int? nodeID, bool? canBrowse, bool? canInsert, bool? canModify, bool? canDelete, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Role_S

        /// <summary>
        /// 取所有角色資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <param name="total"></param>
        public DataTable Ousp_Admin_Role_S(int? pageSize, int? pageNo, ref int? total)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@PageSize", pageSize);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@PageNo", pageNo);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@Total", total);
            sqlParams[2].Direction = ParameterDirection.Output;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Role_S", sqlParams);
            total = sqlParams[2].Value == System.DBNull.Value ? null : (int?)sqlParams[2].Value;

            return dt;

        }// end of ... public DataTable Ousp_Admin_Role_S(int? pageSize, int? pageNo, ref int? total)

        /// <summary>
        /// 取所有角色資訊
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <param name="total"></param>
        public DataSet Ousp_Admin_Role_SToDataSet(int? pageSize, int? pageNo, ref int? total)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@PageSize", pageSize);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@PageNo", pageNo);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@Total", total);
            sqlParams[2].Direction = ParameterDirection.Output;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_Role_S", sqlParams);
            total = sqlParams[2].Value == System.DBNull.Value ? null : (int?)sqlParams[2].Value;

            return ds;
        }// end of ... public DataSet Ousp_Admin_Role_SToDataSet(int? pageSize, int? pageNo, ref int? total)

        #endregion

        #region ousp_Admin_Role_U

        /// <summary>
        /// 更新角色名稱
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="roleID"></param>
        /// <param name="roleLevel"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Role_U(string roleName, int? roleID, byte? roleLevel, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[5];

            sqlParams[0] = new SqlParameter("@RoleName", roleName);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 20;

            sqlParams[1] = new SqlParameter("@RoleID", roleID);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@RoleLevel", roleLevel);
            sqlParams[2].Direction = ParameterDirection.Input;

            sqlParams[3] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[3].Direction = ParameterDirection.Output;

            sqlParams[4] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[4].Direction = ParameterDirection.Output;
            sqlParams[4].SqlDbType = SqlDbType.NVarChar;
            sqlParams[4].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Role_U", sqlParams);
            rtnCode = sqlParams[3].Value == System.DBNull.Value ? null : (int?)sqlParams[3].Value;
            rtnMsg = sqlParams[4].Value == System.DBNull.Value ? null : (string)sqlParams[4].Value;


        }// end of ... public void Ousp_Admin_Role_U(string roleName, int? roleID, byte? roleLevel, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_SystemLogin_S

        /// <summary>
        /// 系統登入判斷
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <param name="iPAddress"></param>
        /// <param name="rtnAccountID"></param>       
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_SystemLogin_S(string account, string password, string iPAddress, ref int? rtnAccountID, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[6];

            sqlParams[0] = new SqlParameter("@Account", account);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 16;

            sqlParams[1] = new SqlParameter("@Password", password);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].Size = 32;

            sqlParams[2] = new SqlParameter("@IPAddress", iPAddress);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 15;

            sqlParams[3] = new SqlParameter("@RtnAccountID", rtnAccountID);
            sqlParams[3].Direction = ParameterDirection.Output;

            sqlParams[4] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[4].Direction = ParameterDirection.Output;

            sqlParams[5] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[5].Direction = ParameterDirection.Output;
            sqlParams[5].SqlDbType = SqlDbType.NVarChar;
            sqlParams[5].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_SystemLogin_S", sqlParams);
            rtnAccountID = sqlParams[3].Value == System.DBNull.Value ? null : (int?)sqlParams[3].Value;

            rtnCode = sqlParams[4].Value == System.DBNull.Value ? null : (int?)sqlParams[4].Value;
            rtnMsg = sqlParams[5].Value == System.DBNull.Value ? null : (string)sqlParams[5].Value;


        }// end of ... public void Ousp_Admin_SystemLogin_S(string account, string password, string iPAddress, ref int? rtnAccountID, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_CheckIPPass_S

        /// <summary>
        /// 檢查IP
        /// 	Create Date,, by Author,,Name
        /// </summary>       
        /// <param name="adminIP"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_CheckIPPass_S(string adminIP, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@AdminIP", adminIP);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 20;

            sqlParams[1] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[1].Direction = ParameterDirection.Output;

            sqlParams[2] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[2].Direction = ParameterDirection.Output;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 100;

            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_CheckIPPass_S", sqlParams);
            rtnCode = sqlParams[1].Value == System.DBNull.Value ? null : (int?)sqlParams[1].Value;
            rtnMsg = sqlParams[2].Value == System.DBNull.Value ? null : (string)sqlParams[2].Value;


        }// end of ... public void Ousp_Admin_CheckIPPass_S(string account, string admin_IP, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Admin_IP_D

        /// <summary>
        /// 刪除公司IP
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="iD"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Admin_IP_D(int? iD, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@ID", iD);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[1].Direction = ParameterDirection.Output;

            sqlParams[2] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[2].Direction = ParameterDirection.Output;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 100;

            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Admin_IP_D", sqlParams);
            rtnCode = sqlParams[1].Value == System.DBNull.Value ? null : (int?)sqlParams[1].Value;
            rtnMsg = sqlParams[2].Value == System.DBNull.Value ? null : (string)sqlParams[2].Value;


        }// end of ... public void Ousp_Admin_Admin_IP_D(int? iD, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Admin_IP_I

        /// <summary>
        /// 新增IP
        /// 	Create Date,, by Author,,Name
        /// </summary>  
        /// <param name="adminIP"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public void Ousp_Admin_Admin_IP_I(string adminIP, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@AdminIP", adminIP);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 20;

            sqlParams[1] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[1].Direction = ParameterDirection.Output;

            sqlParams[2] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[2].Direction = ParameterDirection.Output;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 100;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_Admin_IP_I", sqlParams);
            rtnCode = sqlParams[1].Value == System.DBNull.Value ? null : (int?)sqlParams[1].Value;
            rtnMsg = sqlParams[2].Value == System.DBNull.Value ? null : (string)sqlParams[2].Value;


        }// end of ... public void Ousp_Admin_Admin_IP_I(int? companyID, string admin_IP, ref int? rtnCode, ref string rtnMsg)


        #endregion

        #region ousp_Admin_Admin_IP_S

        /// <summary>
        ///查詢所有IP
        /// 	Create Date,, by Author,,Name
        /// </summary>
        public DataTable Ousp_Admin_Admin_IP_S()
        {
            SqlParameter[] sqlParams = new SqlParameter[0];

            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Admin_IP_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_Admin_IP_S(int? companyID)



        #endregion

        #region ousp_Admin_Admin_IP_U

        /// <summary>
        /// 更新IP
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="iD"></param>
        /// <param name="adminIP"></param>
        /// <param name="rtnCode"></param>
        /// <param name="rtnMsg"></param>
        public DataTable Ousp_Admin_Admin_IP_U(int? iD, string adminIP, ref int? rtnCode, ref string rtnMsg)
        {
            SqlParameter[] sqlParams = new SqlParameter[4];

            sqlParams[0] = new SqlParameter("@ID", iD);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@AdminIP", adminIP);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].SqlDbType = SqlDbType.NVarChar;
            sqlParams[1].Size = 20;

            sqlParams[2] = new SqlParameter("@RtnCode", rtnCode);
            sqlParams[2].Direction = ParameterDirection.Output;

            sqlParams[3] = new SqlParameter("@RtnMsg", rtnMsg);
            sqlParams[3].Direction = ParameterDirection.Output;
            sqlParams[3].SqlDbType = SqlDbType.NVarChar;
            sqlParams[3].Size = 100;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_Admin_IP_U", sqlParams);
            rtnCode = sqlParams[2].Value == System.DBNull.Value ? null : (int?)sqlParams[2].Value;
            rtnMsg = sqlParams[3].Value == System.DBNull.Value ? null : (string)sqlParams[3].Value;

            return dt;

        }// end of ... public DataTable Ousp_Admin_Admin_IP_U(int? iD, int? companyID, string admin_IP, ref int? rtnCode, ref string rtnMsg)


        #endregion

    }//end of ... class
}//end of ... namespace
