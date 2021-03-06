﻿using AdminTemplate;
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
    public partial class PermissionRole : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.Form["fnMode"]))
            {
                if (Request.Form["fnMode"] == "search")
                {
                    NodeSearch();
                }
                else if (Request.Form["fnMode"] == "btnUpdate" & (_CanInsert == true | _CanModify == true))
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

            GetRoleList();

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
            int? iTotal = 0;

            DataTable dtRole = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_S(1000, 1, ref iTotal);

            if (dtRole.Rows.Count > 0)
            {
                this.ddlRoleList.DataSource = dtRole;
                dtRole.DefaultView.RowFilter = "RoleLevel <> 1";
                dtRole.DefaultView.Sort = "RoleID";
                this.ddlRoleList.DataTextField = "RoleName";
                this.ddlRoleList.DataValueField = "RoleID";
                this.ddlRoleList.DataBind();
            }

        }

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
            if (string.IsNullOrEmpty(Request.Form["RoleID"]) || string.IsNullOrEmpty(Request.Form["ParentID"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            GetNodeData(Convert.ToInt32(Request.Form["RoleID"]), Convert.ToInt32(Request.Form["ParentID"]));

            Response.End();

        }


        private void GetNodeData(int RoleID, int ParentID)
        {
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_Node_Permission_S(RoleID, ParentID);
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
            else
            {
                Response.Write("Empty");
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

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_Node_Permission_U(Convert.ToInt32(Request.Form["args"].Split('_')[3]), Convert.ToInt32(Request.Form["args"].Split('_')[2]), sBoolen == arrPermission[0], sBoolen == arrPermission[1], sBoolen == arrPermission[2], sBoolen == arrPermission[3], ref RtnCode, ref RtnMsg);
            if (RtnCode == 1)
            {
                GetNodeData(Convert.ToInt32(Request.Form["args"].Split('_')[3]), Convert.ToInt32(Request.Form["args"].Split('_')[4]));
            }

            Response.Write((RtnCode == 1 ? "<div id='rtnData' msg='" + RtnMsg + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }

    }
}