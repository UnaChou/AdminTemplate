using AdminTemplate;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminTamplateProgram
{
    public partial class AccountCtrl : BasePage
    {
        protected int PageSize = 10;
        protected int Total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.Form["fnMode"]))
            {
                if (Request.Form["fnMode"] == "search")
                {
                    AccountSearch();
                    //ElseIf Request.Form["fnMode") = "UpdateGameList" Then
                    //    GetAccountGameByFranchiseid()
                }
                else if (Request.Form["fnMode"] == "add" & _CanInsert == true)
                {
                    _LogInsert("");
                    AccountAdd();
                }
                else if (Request.Form["fnMode"] == "btnEdit" & _CanModify == true)
                {
                    GetAccountRole();
                }
                else if (Request.Form["fnMode"] == "btnUpdate" & _CanModify == true)
                {
                    //_LogUpDate()
                    AccountUpdate();
                }
                else if (Request.Form["fnMode"] == "btnDelete" & _CanDelete == true)
                {
                    _LogDelete("");
                    AccountDelete();
                }
                else
                {
                    Response.Write("err:操作錯誤");
                    Response.End();
                }

            }


            GetRoleList();

            GetAccountData(1, "");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        /// <summary>
        /// Outputs server control content
        /// </summary>
        /// <param name="Ctrl">server control</param>
        /// <returns></returns>
        private string RenderHTML(System.Web.UI.Control Ctrl)
        {
            StringBuilder sb = new StringBuilder();

            StringWriter sw = new StringWriter(sb);

            HtmlTextWriter htw = new HtmlTextWriter(sw);

            Ctrl.RenderControl(htw);

            sw.Close();

            htw.Close();

            return sb.ToString().Replace(Environment.NewLine, "").Replace(Environment.NewLine, "").Replace(Environment.NewLine, "");
        }


        /// <summary>
        /// Get the list of roles
        /// </summary>

        private void GetRoleList()
        {
            DataTable dtRole = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_Role_S();
            if (dtRole.Rows.Count > 0)
            {
                this.rptRoleList.DataSource = dtRole;
                this.rptRoleList.DataBind();
            }

        }


        private void GetAccountRole()
        {
            DataTable dtRole = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_Role_ByAccountID_S(Convert.ToInt32(Request.Form["AccountID"]));
            string RtnStr = "";
            if (dtRole.Rows.Count > 0)
            {
                for (int i = 0; i <= dtRole.Rows.Count - 1; i++)
                {
                    RtnStr += dtRole.Rows[i]["RoleID"].ToString() + ",";
                }
            }

            //Response.Write(RtnStr)
            //Response.End()

            Response.Write(RtnStr + ";");
            //GetAccountGame()
        }


        /// <summary>
        /// 查尋帳號
        /// </summary>
        /// <remarks></remarks>

        private void AccountSearch()
        {
            if (string.IsNullOrEmpty(Request.Form["p"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            //If Not Request.Form["DepartID") = 0 Then
            GetAccountData(Convert.ToInt32(Request.Form["p"]), Request.Form["Account"].ToString());
            Response.Write(RenderHTML(this.rptAccountData) + "<div id='rtnData' total='" + Total.ToString() + "'></div>");
            Response.End();
            //End If

        }

        /// <summary>
        /// 取得帳號資料
        /// </summary>
        private void GetAccountData(int PageNo, string Account)
        {
            //Response.Write("PageNo" & PageNo & "; PageSize" & PageSize & "; DepartID" & DepartID & "; Account" + Account)
            //Response.End()

            int? iTotal = 0;
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_Account_S(PageSize, PageNo, Account, ref iTotal);

            if (dtNode.Rows.Count > 0)
            {
                this.rptAccountData.DataSource = dtNode;
                this.rptAccountData.DataBind();
                Total = (int)iTotal;
            }

        }

        /// <summary>
        /// 新增帳號
        /// </summary>
        /// <remarks></remarks>

        private void AccountAdd()
        {
            string strAccount = Request.Form["AccountNew"];
            string strRoleID = Request.Form["RoleID"];
            string strGameID = Request.Form["GameID"];
            string strPassword = Request.Form["Password"];

            if (string.IsNullOrEmpty(strAccount) || string.IsNullOrEmpty(strRoleID) || string.IsNullOrEmpty(strGameID) || string.IsNullOrEmpty(strPassword))
            {
                Response.Write("err:參數錯誤0");
                Response.End();
            }

            if (strAccount.Length < 3 || strAccount.Length > 16)
            {
                Response.Write("err:帳號長度 3 ~ 16 個字元");
                Response.End();
            }

            string strValid = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            int intI = 0;

            for (intI = 0; intI <= strAccount.Length - 1; intI++)
            {
                if (strValid.IndexOf(strAccount[intI]) < 0)
                {
                    Response.Write("err:帳號請輸入英文或是數字，不可包含符號、空格或非英文文字。");
                    Response.End();
                }
            }


            if (strPassword.Length < 4 || strPassword.Length > 16)
            {
                Response.Write("err:密碼長度 4 ~ 16 個字元");
                Response.End();
            }

            int intIPwd = 0;
            string strValidENG = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            for (int I = 0; I <= strPassword.Length - 1; I++)
            {
                if (strValidENG.IndexOf(strPassword[I]) >= 0)
                {
                    intIPwd += 1;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }

            string strValiddg = "0123456789";
            for (int I = 0; I <= strPassword.Length - 1; I++)
            {
                if (strValiddg.IndexOf(strPassword[I]) >= 0)
                {
                    intIPwd += 1;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }

            string strValidSg = "~`!@#$%^&*()_-+=|\\}]{['\\/?><.:,;\" ";
            for (int I = 0; I <= strPassword.Length - 1; I++)
            {
                if (strValidSg.IndexOf(strPassword[I]) >= 0)
                {
                    intIPwd += 1;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }

            // 英文 數字 符號
            if (intIPwd < 2)
            {
                Response.Write("err:密碼須包含英文、數字與符號");
                Response.End();
            }

            strPassword = new AdminTemplate.Common().MD5CryptHex(strPassword);

            string[] arrRole = strRoleID.Split(',');
            for (int i = 0; i <= arrRole.Length - 2; i++)
            {
                if (!new AdminTemplate.Common().IsInterger(arrRole[i], 10))
                {
                    Response.Write("err:參數錯誤1");
                    Response.End();
                }
            }

            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_I(strAccount, strPassword, strRoleID, strGameID, ref RtnCode, ref RtnMsg);

            //103=帳號新增成功, 角色新增失敗
            if (RtnCode == 1 | RtnCode == 103)
            {
                GetAccountData(1, "");
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptAccountData) + "<div id='rtnData' msg='" + RtnMsg + "' total='" + Total.ToString() + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }

        /// <summary>
        /// 更新帳號
        /// </summary>
        /// <remarks></remarks>

        private void AccountUpdate()
        {
            string strAccount = Request.Form["AccountNew"];
            string strRoleID = Request.Form["RoleID"];
            string strGameID = Request.Form["GameID"];
            string strPassword = Request.Form["Password"];

            if (string.IsNullOrEmpty(strAccount) || string.IsNullOrEmpty(strRoleID) || string.IsNullOrEmpty(strGameID) || string.IsNullOrEmpty(Request.Form["args"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            // string strValid = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            if (strPassword.Length > 0)
            {
                if (strPassword.Length < 4 || strPassword.Length > 16)
                {
                    Response.Write("err:密碼長度 4 ~ 16 個字元");
                    Response.End();
                }

                int intIPwd = 0;
                string strValidENG = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                for (int I = 0; I <= strPassword.Length - 1; I++)
                {
                    if (strValidENG.IndexOf(strPassword[I]) >= 0)
                    {
                        intIPwd += 1;
                        break; // TODO: might not be correct. Was : Exit For
                    }
                }

                string strValiddg = "0123456789";
                for (int I = 0; I <= strPassword.Length - 1; I++)
                {
                    if (strValiddg.IndexOf(strPassword[I]) >= 0)
                    {
                        intIPwd += 1;
                        break; // TODO: might not be correct. Was : Exit For
                    }
                }

                string strValidSg = "~`!@#$%^&*()_-+=|\\}]{['\\/?><.:,;\" ";
                for (int I = 0; I <= strPassword.Length - 1; I++)
                {
                    if (strValidSg.IndexOf(strPassword[I]) >= 0)
                    {
                        intIPwd += 1;
                        break; // TODO: might not be correct. Was : Exit For
                    }
                }

                // 英文 數字 符號
                if (intIPwd < 2)
                {
                    Response.Write("err:密碼須包含英文、數字與符號");
                    Response.End();
                }

                strPassword = new AdminTemplate.Common().MD5CryptHex(strPassword);
            }


            string[] arrRole = strRoleID.Split(',');
            for (int i = 0; i <= arrRole.Length - 2; i++)
            {
                if (!new AdminTemplate.Common().IsInterger(arrRole[i], 10))
                {
                    Response.Write("err:參數錯誤1");
                    Response.End();
                }
            }

            //if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 4)
            //{
            //    Response.Write("err:參數錯誤2");
            //    Response.End();
            //}


            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_U(strAccount, strPassword, strRoleID, strGameID, Convert.ToInt32(Request.Form["args"].Split('_')[2]), ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetAccountData(Convert.ToInt32(Request.Form["p"]), Request.Form["Account"]);
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptAccountData) + "<div id='rtnData' msg='" + RtnMsg + "' total='" + Total.ToString() + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }

        /// <summary>
        /// 刪除帳號
        /// </summary>
        /// <remarks></remarks>

        private void AccountDelete()
        {
            if (string.IsNullOrEmpty(Request.Form["args"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 3)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_D(Convert.ToInt32(Request.Form["args"].Split('_')[2]), ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetAccountData(Convert.ToInt32(Request.Form["p"]), Request.Form["Account"]);
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptAccountData) + "<div id='rtnData' msg='" + RtnMsg + "' total='" + Total.ToString() + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }

    }
}