using System;
using System.Web;

namespace AdminTemplate
{
    public class Config
    {
        /// <summary>
        /// 取出虛擬台路徑
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        public static string AppPath
        {
            get
            {
                string _AppPath = HttpContext.Current.Request.ApplicationPath;
                return (_AppPath == "/" ? string.Empty : _AppPath);
            }
        }

        /// <summary>
        /// 取出站台 cookies
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        public static string Domain_Cookie
        {
            get { return Resources.Resource.Domain_Cookies; }
        }

        /// <summary>
        /// 預設 SMTP Server
        /// </summary>
        public static string SmtpServer
        {
            get { return Resources.Resource.SMTPIP; }
        }

        /// <summary>
        /// 模式(0:正式 1:測式)
        /// </summary>
        public static string TestMode
        {
            get { return "TestMode"; }
        }

        /// <summary>
        /// 後臺連線字串
        /// 後台系統架構專用，其餘功能請勿使用
        /// </summary>
        public static string ConnAdmin
        {
            get { return "WebName_Admin_SP"; }
        }

        /// <summary>
        /// 後臺LOG連線字串
        /// </summary>
        public static string ConnAdminLog
        {
            get { return "WebName_AdminLog_SP"; }
        }
    }
}
