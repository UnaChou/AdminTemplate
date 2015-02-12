using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace AdminTemplate.ORM.WebName_AdminLog
{
    public partial class WebName_AdminLogSP
    {

        protected string _DbConfigKey;
        public string DbConfigKey
        {
            get { return this._DbConfigKey; }
            set { this._DbConfigKey = value; }
        }
        public WebName_AdminLogSP(string dbConfigKey)
        {
            this.DbConfigKey = dbConfigKey;
        }


        #region ousp_Admin_AdminActionLog_I

        /// <summary>
        /// 後台LOG記錄
        /// 	20110908 by Nick
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="account"></param>
        /// <param name="actionNode"></param>
        /// <param name="actionIP"></param>
        /// <param name="actionType"></param>
        /// <param name="note"></param>
        /// <param name="parameter"></param>
        public void Ousp_Admin_AdminActionLog_I(int? accountID, string account, string actionNode, string actionIP, string actionType, string note, string parameter)
        {
            SqlParameter[] sqlParams = new SqlParameter[7];

            sqlParams[0] = new SqlParameter("@AccountID", accountID);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[1] = new SqlParameter("@Account", account);
            sqlParams[1].Direction = ParameterDirection.Input;
            sqlParams[1].SqlDbType = SqlDbType.NVarChar;
            sqlParams[1].Size = 16;

            sqlParams[2] = new SqlParameter("@ActionNode", actionNode);
            sqlParams[2].Direction = ParameterDirection.Input;
            sqlParams[2].SqlDbType = SqlDbType.NVarChar;
            sqlParams[2].Size = 255;

            sqlParams[3] = new SqlParameter("@ActionIP", actionIP);
            sqlParams[3].Direction = ParameterDirection.Input;
            sqlParams[3].SqlDbType = SqlDbType.NVarChar;
            sqlParams[3].Size = 20;

            sqlParams[4] = new SqlParameter("@ActionType", actionType);
            sqlParams[4].Direction = ParameterDirection.Input;
            sqlParams[4].SqlDbType = SqlDbType.NVarChar;
            sqlParams[4].Size = 10;

            sqlParams[5] = new SqlParameter("@Note", note);
            sqlParams[5].Direction = ParameterDirection.Input;
            sqlParams[5].SqlDbType = SqlDbType.NVarChar;
            sqlParams[5].Size = 100;

            sqlParams[6] = new SqlParameter("@Parameter", parameter);
            sqlParams[6].Direction = ParameterDirection.Input;
            sqlParams[6].SqlDbType = SqlDbType.NVarChar;
            sqlParams[6].Size = 800;


            new AdminTemplate.Common().CommandExecuteNonQuery(DbConfigKey, "Ousp_Admin_AdminActionLog_I", sqlParams);


        }// end of ... public void Ousp_Admin_AdminActionLog_I(int? accountID, string account, string actionNode, string actionIP, string actionType, string note, string parameter)


        #endregion

        #region ousp_Admin_AdminActionLog_S

        /// <summary>
        /// Description,,
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="account"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        public DataTable Ousp_Admin_AdminActionLog_S(string account, DateTime? startDate, DateTime? endDate)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@Account", account);
            sqlParams[0].Direction = ParameterDirection.Input;
            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 16;

            sqlParams[1] = new SqlParameter("@StartDate", startDate);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@EndDate", endDate);
            sqlParams[2].Direction = ParameterDirection.Input;


            DataTable dt = new AdminTemplate.Common().QueryToDataTable(DbConfigKey, "Ousp_Admin_AdminActionLog_S", sqlParams);

            return dt;

        }// end of ... public DataTable Ousp_Admin_AdminActionLog_S(string account, DateTime? startDate, DateTime? endDate)

        /// <summary>
        /// Description,,
        /// 	Create Date,, by Author,,Name
        /// </summary>
        /// <param name="account"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        public DataSet Ousp_Admin_AdminActionLog_SToDataSet(string account, DateTime? startDate, DateTime? endDate)
        {
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@Account", account);
            sqlParams[0].Direction = ParameterDirection.Input;

            sqlParams[0].SqlDbType = SqlDbType.NVarChar;
            sqlParams[0].Size = 16;

            sqlParams[1] = new SqlParameter("@StartDate", startDate);
            sqlParams[1].Direction = ParameterDirection.Input;

            sqlParams[2] = new SqlParameter("@EndDate", endDate);
            sqlParams[2].Direction = ParameterDirection.Input;

            DataSet ds = new AdminTemplate.Common().QueryToDataSet(DbConfigKey, "Ousp_Admin_AdminActionLog_S", sqlParams);

            return ds;
        }// end of ... public DataSet Ousp_Admin_AdminActionLog_SToDataSet(string account, DateTime? startDate, DateTime? endDate)

        #endregion


    }//end of ... class
}//end of ... namespace
