using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Web;

namespace AdminTemplate
{
    public class Login
    {
        private static AdminTemplate.AdminLog log;

        public Login()
        {
        }

        /// <summary>
        /// 登入動作
        /// </summary>
        /// <param name="strAccount"></param>
        /// <param name="strPassword"></param>
        /// <returns></returns>
        /// <remarks></remarks>
        public static bool AdminLogin(string strAccount, string strPassword)
        {

            bool LoginState = false;

            int? RtnAccountID = 0;
            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_SystemLogin_S(strAccount, new AdminTemplate.Common().MD5CryptHex(strPassword), HttpContext.Current.Request.UserHostAddress, ref RtnAccountID, ref RtnCode, ref RtnMsg);


            if (RtnCode == 1)
            {
                HttpContext.Current.Session["AccountID"] = RtnAccountID;
                HttpContext.Current.Session["Account"] = strAccount;

                isLogin = true;

                log = new AdminTemplate.AdminLog((int)RtnAccountID, strAccount, "");
                LoginState = true;

            }
            else
            {
                log = new AdminTemplate.AdminLog(0, strAccount, "");
                log.log_login(RtnMsg);
                LoginState = false;

                HttpContext.Current.Session["LoginError"] = RtnMsg;

            }

            return LoginState;
        }

        #region "宣告取得頁面參數"
        //Private AccountID As Integer = 0
        //Private Account As String = ""
        //Private DepartID As Integer = 0
        //Private Depart As String = ""

        private static bool IsCache_GameIDList = false;
        /// <summary>
        /// AccountID
        /// </summary>
        public static int _AccountID
        {
            get
            {
                int aid = 0;

                if (HttpContext.Current.Session["AccountID"] != null)
                {

                    aid = Convert.ToInt32(HttpContext.Current.Session["AccountID"]);
                }
                return aid;
            }
        }

        /// <summary>
        /// Account
        /// </summary>
        public static string _Account
        {
            get
            {
                string sAcc = "";

                if (HttpContext.Current.Session["Account"] != null)
                {
                    sAcc = HttpContext.Current.Session["Account"].ToString();
                }

                return sAcc;
            }
        }

        /// <summary>
        /// DepartID
        /// </summary>
        public static int _DepartID
        {
            get
            {
                int did = 0;

                if (HttpContext.Current.Session["DepartID"] != null)
                {
                    did = Convert.ToInt32(HttpContext.Current.Session["DepartID"]);
                }

                return did;
            }
        }

        /// <summary>
        /// Department
        /// </summary>
        public static string _Depart
        {
            get { return HttpUtility.UrlDecode(HttpContext.Current.Session["Depart"].ToString()); }
        }

        /// <summary>
        /// GameIDList IsCache, True:from Session, False:from DB
        /// </summary>
        public static bool _IsCache_GameIDList
        {
            get { return IsCache_GameIDList; }
        }

        /// <summary>
        /// GameIDList (DataTable)
        /// </summary>
        //Public ReadOnly Property _GameIDList() As DataTable
        //    Get
        //        Return GameIDList(Me._AccountID, True)
        //    End Get
        //End Property

        /// <summary>
        /// Check the login account has permissions to the specified game 
        /// </summary>
        //Public ReadOnly Property _PermissionByGame(ByVal GameID As Integer) As Boolean
        //    Get
        //        Dim dv As DataView = Me._GameIDList.DefaultView
        //        dv.RowFilter = "GameID = " & GameID.ToString()
        //        Return IIf(dv.Count = 0, False, True)
        //    End Get
        //End Property

        private static bool isLogin;
        public static bool _isLogin
        {
            get { return isLogin; }
        }

        #endregion

        #region "登入檢查"
        /// <summary>
        /// 登入
        /// </summary>
        /// <remarks></remarks>

        public static void LoginCheck()
        {

            if (HttpContext.Current.Session["Account"] == null)
            {
                new AdminTemplate.Common().RunJavaScript("top.location='" + Config.AppPath + "/Default.aspx" + "';", true);
            }

        }

        public static bool CheckLogin()
        {

            if (HttpContext.Current.Session["Account"] == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// 登出
        /// </summary>
        /// <remarks></remarks>

        public static void LoginOut()
        {
            AdminLog log = new AdminLog(_AccountID, _Account, "");
            log.log_logout("", "");

            HttpContext.Current.Session.Clear();

            HttpContext.Current.Response.Write("<script>parent.top.location.href='" + Config.AppPath + "/Default.aspx';</script>");
        }

        #endregion
    }
}
