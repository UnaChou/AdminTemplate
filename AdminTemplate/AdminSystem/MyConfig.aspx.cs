using AdminTemplate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminTemplate.AdminSystem
{
    public partial class MyConfig : BasePage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            _thisURL = "N";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strOldPassword = txtPw.Text;
            string strNewPassword = txtPwNew.Text;
            string strCnfPassword = txtPwConfirm.Text;

            if (string.IsNullOrEmpty(strOldPassword))
            {
                new AdminTemplate.Common().alertMsg("請輸入原密碼", null);
                return;
            }

            if (string.IsNullOrEmpty(strNewPassword))
            {
                new AdminTemplate.Common().alertMsg("請輸入新密碼", null);
                return;
            }

            if (string.IsNullOrEmpty(strCnfPassword))
            {
                new AdminTemplate.Common().alertMsg("請輸入確認密碼", null);
                return;
            }

            if (strNewPassword.Length < 4 | strNewPassword.Length > 16)
            {
                new AdminTemplate.Common().alertMsg("新密碼須為 4 ~ 16 個字元", null);
                return;
            }


            int intIPwd = 0;
            string strValidENG = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            for (int I = 0; I <= strNewPassword.Length - 1; I++)
            {
                if (strValidENG.IndexOf(strNewPassword[I]) >= 0)
                {
                    intIPwd += 1;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }

            string strValiddg = "0123456789";
            for (int I = 0; I <= strNewPassword.Length - 1; I++)
            {
                if (strValiddg.IndexOf(strNewPassword[I]) >= 0)
                {
                    intIPwd += 1;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }

            string strValidSg = "~`!@#$%^&*()_-+=|\\}]{['\\/?><.:,;\" ";
            for (int I = 0; I <= strNewPassword.Length - 1; I++)
            {
                if (strValidSg.IndexOf(strNewPassword[I]) >= 0)
                {
                    intIPwd += 1;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }


            // 英文 數字 符號
            if (intIPwd < 2)
            {
                new AdminTemplate.Common().alertMsg("新密碼須包含英文、數字與符號", null);
                return;
            }

            if (strNewPassword == strOldPassword)
            {
                new AdminTemplate.Common().alertMsg("新密碼與舊密碼相同，請重新輸入。", null);
                return;
            }

            if (strNewPassword != strCnfPassword)
            {
                new AdminTemplate.Common().alertMsg("新密碼與確認密碼不相同，請重新輸入。", null);
                return;
            }

            strOldPassword = new AdminTemplate.Common().MD5CryptHex(strOldPassword);
            strNewPassword = new AdminTemplate.Common().MD5CryptHex(strNewPassword);

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_PWD_U(AdminTemplate.Login._AccountID, strOldPassword, strNewPassword, ref RtnCode, ref RtnMsg);


            if (RtnCode == 1)
            {
                Response.Write("<script>alert('密碼已變更，現在將自動登出系統，請重新登入。');parent.top.location.href='../Default.aspx'</script>");
                Response.End();
                return;


            }
            else
            {
                new AdminTemplate.Common().alertMsg(RtnMsg, null);
                return;

            }
        }
    }
}