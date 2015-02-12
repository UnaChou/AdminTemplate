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

namespace AdminTemplate.AdminSystem
{
    public partial class PermissionAccount : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.Form["fnMode"]))
            {
                if (Request.Form["fnMode"] == "search")
                {
                    NodeSearch();
                    //ElseIf Request.Form["fnMode") = "bindAccount" Then
                    //    BindAccount()
                }
                else if (Request.Form["fnMode"] == "btnUpdate" && (_CanInsert == true | _CanModify == true))
                {
                    _LogUpDate("");
                    PermissionUpdate();
                }
                else
                {
                    Response.Write("err:操作錯誤");
                    Response.End();
                }

            }

            GetAccountList(0);

            GetNodeList();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        /// <summary>
        /// Outputs server control content
        /// </summary>
        /// <param name="Ctrl">server control</param>
        /// <returns></returns>
        private string RenderHTML(Control Ctrl)
        {
            StringBuilder sb = new StringBuilder();

            StringWriter sw = new StringWriter(sb);

            HtmlTextWriter htw = new HtmlTextWriter(sw);

            Ctrl.RenderControl(htw);

            sw.Close();

            htw.Close();

            return sb.ToString().Replace(Environment.NewLine, "").Replace(Environment.NewLine, "").Replace(Environment.NewLine, "");
        }


        private void GetAccountList(int DepartID)
        {
            DataTable dtAccount = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_S();

            if (dtAccount.Rows.Count > 0)
            {
                this.ddlAccountList.DataSource = dtAccount;
                this.ddlAccountList.DataTextField = "Account";
                this.ddlAccountList.DataValueField = "AccountID";
                this.ddlAccountList.DataBind();
            }

        }

        //Private Sub BindAccount()

        //    If String.IsNullOrEmpty(Request.Form["DepartID")) Then
        //        Response.Write("err:參數錯誤")
        //        Response.End()
        //    End If

        //    GetAccountList(Request.Form["DepartID"))
        //    Response.Write(RenderHTML(Me.ddlAccountList))
        //    Response.End()

        //End Sub

        /// <summary>
        /// Get the list of page nodes
        /// </summary>

        private void GetNodeList()
        {
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_ByParentID_S(0);

            if (dtNode.Rows.Count > 0)
            {
                this.ddlNodeList.DataSource = dtNode;
                this.ddlNodeList.DataTextField = "NodeName";
                this.ddlNodeList.DataValueField = "NodeID";
                this.ddlNodeList.DataBind();
            }

        }


        private void NodeSearch()
        {
            if (string.IsNullOrEmpty(Request.Form["AccountID"]) || string.IsNullOrEmpty(Request.Form["ParentID"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            GetNodeData(Convert.ToInt32(Request.Form["AccountID"]), Convert.ToInt32(Request.Form["ParentID"]));
            //Response.Write(RenderHTML(Me.rptNodeData))
            Response.End();

        }


        private void GetNodeData(int AccountID, int ParentID)
        {
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_Node_Permission_S(AccountID, ParentID);

            if (dtNode.Rows.Count > 0)
            {
                if (ParentID == 0)
                {
                    DataRow[] dtNodeDir = dtNode.Select("ParentID = 0");
                    foreach (DataRow drDir in dtNodeDir)
                    {
                        dtNode.DefaultView.RowFilter = "ParentID = " + drDir["NodeID"].ToString() + " OR NodeID = " + drDir["NodeID"].ToString();
                        if (dtNode.DefaultView.Count > 0)
                        {
                            this.rptNodeData.DataSource = dtNode;
                            this.rptNodeData.DataBind();
                            Response.Write(RenderHTML(this.rptNodeData) + "<br />");
                        }

                    }
                }
                else
                {
                    this.rptNodeData.DataSource = dtNode;
                    this.rptNodeData.DataBind();
                    Response.Write(RenderHTML(this.rptNodeData));
                }
            }

        }


        private void PermissionUpdate()
        {
            if (string.IsNullOrEmpty(Request.Form["args"]) || string.IsNullOrEmpty(Request.Form["permission"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 5)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["permission"].IndexOf("_") == -1 || Request.Form["permission"].Split('_').Length != 4)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            string[] arrPermission = Request.Form["permission"].Split('_');

            if (!new AdminTemplate.Common().IsInterger(Request.Form["args"].Split('_')[2], 10) || !new AdminTemplate.Common().IsInterger(Request.Form["args"].Split('_')[3], 10) || !new AdminTemplate.Common().IsInterger(Request.Form["args"].Split('_')[4], 10) || !new AdminTemplate.Common().IsInterger(arrPermission[0], 1) || !new AdminTemplate.Common().IsInterger(arrPermission[1], 1) || !new AdminTemplate.Common().IsInterger(arrPermission[2], 1) || !new AdminTemplate.Common().IsInterger(arrPermission[3], 1))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["args"].Split('_')[1] == "0")
            {
                arrPermission[1] = "0";
                arrPermission[2] = "0";
                arrPermission[3] = "0";
            }

            string sBoolen = "1";

            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Account_Node_Permission_U(Convert.ToInt32(Request.Form["args"].Split('_')[3]), Convert.ToInt32(Request.Form["args"].Split('_')[2]), sBoolen == arrPermission[0], sBoolen == arrPermission[1], sBoolen == arrPermission[2], sBoolen == arrPermission[3], ref RtnCode, ref RtnMsg);
            if (RtnCode == 1)
            {
                GetNodeData(Convert.ToInt32(Request.Form["args"].Split('_')[3]), Convert.ToInt32(Request.Form["args"].Split('_')[4]));
            }

            Response.Write((RtnCode == 1 ? "<div id='rtnData' msg='" + RtnMsg + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }
    }
}