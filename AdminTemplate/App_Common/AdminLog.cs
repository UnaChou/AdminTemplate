using System;
using System.Web;

namespace AdminTemplate
{
    public class AdminLog
    {
        public AdminLog(int uid, string account, string node)
        {
            _accountID = uid;
            _account = account;
            _actionNode = node;
        }

        public void log_login(string paras)
        {
            saveLog("登入", "", paras);
        }

        public void log_logout(string note, string paras)
        {
            saveLog("登出", note, paras);
        }

        public void log_Insert(string note, string paras)
        {
            saveLog("新增", note, paras);
        }

        public void log_Select(string note, string paras)
        {
            saveLog("查询", note, paras);
        }

        public void log_Delete(string note, string paras)
        {
            saveLog("刪除", note, paras);
        }

        public void log_UpDate(string note, string paras)
        {
            saveLog("修改", note, paras);
        }

        public void log_Other(string process, string note, string paras)
        {
            saveLog(process, note, paras);
        }

        private void saveLog(string actionType, string note, string strParas)
        {
            string strIP = new AdminTemplate.Common().GetClientIP();
            if (string.IsNullOrEmpty(strIP))
                strIP = new AdminTemplate.Common().GetClientIP();

            new AdminTemplate.ORM.WebName_AdminLog.WebName_AdminLogSP(Config.ConnAdminLog).Ousp_Admin_AdminActionLog_I(_accountID, _account, _actionNode, strIP, actionType, note, strParas.Replace("'", ""));

        }

        private int _accountID;
        private string _account;
        private string _actionNode;
    }



}
