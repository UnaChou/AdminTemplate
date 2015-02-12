using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminTemplate;

namespace AdminTamplateProgram
{
    public partial class Default : System.Web.UI.Page
    {
        protected string sWebName;

        protected void Page_Load(object sender, EventArgs e)
        {
            sWebName = System.Web.Configuration.WebConfigurationManager.AppSettings["WebName"];
            Page.Title = sWebName + "後台管理系統";
            lblWebName.Text = sWebName;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string strAccount = tbxAccount.Text;
            string strPassword = tbxPassword.Text;
            string client_ip = null;

            if (string.IsNullOrEmpty(strAccount))
            {
                new AdminTemplate.Common().alertMsg("請輸入帳號", null);
                return;
            }

            if (strAccount.Length < 3 || strAccount.Length > 16)
            {
                new AdminTemplate.Common().alertMsg("帳號長度 3 ~ 16 個定元", null);
                return;
            }

            string strValid = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            int intI = 0;

            for (intI = 0; intI <= strAccount.Length - 1; intI++)
            {
                if (strValid.IndexOf(strAccount[intI]) < 0)
                {
                    new AdminTemplate.Common().alertMsg("帳號請輸入英文或是數字，不可包含符號、空格或非英文文字。", null);
                    return;
                }
            }

            if (string.IsNullOrEmpty(strPassword))
            {
                new AdminTemplate.Common().alertMsg("請輸入密碼", null);
                return;
            }

            if (strPassword.Length < 4 || strPassword.Length > 16)
            {
                new AdminTemplate.Common().alertMsg("密碼長度 4 ~ 16 個字元", null);
                return;
            }

            bool isLogin = AdminTemplate.Login.AdminLogin(strAccount, strPassword);

            if (isLogin)
            {
                client_ip = new AdminTemplate.Common().GetClientIP() == "::1" ? "127.0.0.1" : new AdminTemplate.Common().GetClientIP();

                Session["Account"] = strAccount;

                if (checkIPPass(strAccount, client_ip))
                {
                    //登入完成檢查 帳密是否超過期限 >> 先不管這邊
                    if (getLastUpdatePWD(strAccount, client_ip))
                    {
                        Response.Redirect("~/Frame.aspx");
                    }
                    //NULL或超過90天
                    else
                    {
                        new AdminTemplate.Common().alertMsg("您是第一次登入的使用者或密碼己使用超過90天，請修改密碼。", "/AdminSystem/Account.aspx");
                    }
                }
                //不是合法的IP
                else
                {
                    new AdminTemplate.Common().alertMsg("不是合法的IP", null);
                }
            }
            else
            {
                new AdminTemplate.Common().alertMsg(Session["LoginError"].ToString(), null);
            }
        }

        //###檢查IP位置是否合法
        private bool checkIPPass(string strAccount, string sClient_ip)
        {

            if (new CheckOfficeIP().CheckIsOfficeIP())
            {
                return true;
            }
            else
            {
                int? RtnCode = 0;
                string RtnMsg = "";

                new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_CheckIPPass_S(sClient_ip, ref RtnCode, ref RtnMsg);

                if (RtnCode == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

        }

        //###取出最後更新密碼時間
        private bool getLastUpdatePWD(string Account, string sClient_ip)
        {
            DateTime? LastUpdatePWD = Convert.ToDateTime("2001/1/1");
            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_LastUpdatePWD_SU(Account, sClient_ip, ref LastUpdatePWD, ref RtnCode, ref RtnMsg);

            if (string.IsNullOrEmpty(LastUpdatePWD.ToString()))
            {
                return false;
            }
            else
            {
                // 90天後更新密碼
                if (DateTime.Now.Date.Subtract((DateTime)LastUpdatePWD).TotalDays > 90)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
    }
}