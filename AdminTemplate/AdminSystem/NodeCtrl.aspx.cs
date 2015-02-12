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
    public partial class NodeCtrl : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.Form["fnMode"]))
            {
                if (Request.Form["fnMode"] == "search")
                {
                    NodeSearch();
                }
                else if (Request.Form["fnMode"] == "add" & _CanInsert == true)
                {
                    _LogInsert("");
                    NodeAdd();
                }
                else if (Request.Form["fnMode"] == "btnUpdate" & _CanModify == true)
                {
                    _LogUpDate("");
                    NodeUpdate();
                }
                else if (Request.Form["fnMode"] == "btnDelete" & _CanDelete == true)
                {
                    _LogDelete("");
                    NodeDelete();
                }
                else if (Request.Form["fnMode"] == "sort" & _CanModify == true)
                {
                    _LogOthers("節點排序", "");
                    NodeSort();
                }
                else
                {
                    Response.Write("err:操作錯誤");
                    Response.End();
                }

            }

            GetNodeList();

            GetNodeData(0);
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

        /// <summary>
        /// Get node list
        /// </summary>

        private void GetNodeList()
        {
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_ByParentID_S(0);

            if (dtNode.Rows.Count > 0)
            {
                this.ddlNodeParent.DataSource = dtNode;
                this.ddlNodeParent.DataTextField = "NodeName";
                this.ddlNodeParent.DataValueField = "NodeID";
                this.ddlNodeParent.DataBind();

                this.ddlNodeList.DataSource = dtNode;
                this.ddlNodeList.DataTextField = "NodeName";
                this.ddlNodeList.DataValueField = "NodeID";
                this.ddlNodeList.DataBind();
            }

        }


        private void NodeSearch()
        {
            if (string.IsNullOrEmpty(Request.Form["ParentID"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            GetNodeData(Convert.ToInt32(Request.Form["ParentID"]));
            Response.Write(RenderHTML(this.rptNodeData) + "<div id='rtnData'>" + RenderHTML(this.rptNodeSort) + "</div>");
            Response.End();

        }

        /// <summary>
        /// Get node information
        /// </summary>

        private void GetNodeData(int ParentID)
        {
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_S(ParentID);

            if (dtNode.Rows.Count > 0)
            {
                this.rptNodeData.DataSource = dtNode;
                this.rptNodeData.DataBind();
                dtNode.DefaultView.RowFilter = "NodeType < 2";
                this.rptNodeSort.DataSource = dtNode;
                this.rptNodeSort.DataBind();
            }

        }


        private void NodeAdd()
        {
            if (string.IsNullOrEmpty(Request.Form["NodeType"]) || string.IsNullOrEmpty(Request.Form["NodeName"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            string strNodeUrl = string.Empty;

            if (!new AdminTemplate.Common().IsInterger(Request.Form["NodeType"], 1))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            byte iNodeType = Convert.ToByte(Request.Form["NodeType"]);
            if (iNodeType > 2 || iNodeType < 0)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int iParentID = 0;
            byte iNodeTarget = 0;
            if (iNodeType == 1 || iNodeType == 2)
            {
                if (string.IsNullOrEmpty(Request.Form["NodeUrl"]) || string.IsNullOrEmpty(Request.Form["NodeTarget"]) || string.IsNullOrEmpty(Request.Form["ParentID"]))
                {
                    Response.Write("err:參數錯誤");
                    Response.End();
                }
                strNodeUrl = Request.Form["NodeUrl"];
                iNodeTarget = Convert.ToByte(Request.Form["NodeTarget"]);
                iParentID = Int16.Parse(Request.Form["ParentID"]);
                if (iNodeTarget > 2 || iNodeType < 0)
                {
                    Response.Write("err:參數錯誤");
                    Response.End();
                }
            }

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_I(iNodeType, Request.Form["NodeName"].ToString(), strNodeUrl, iNodeTarget, iParentID, ref RtnCode, ref RtnMsg);
            if (RtnCode == 1)
            {
                GetNodeData(iParentID);
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptNodeData) + "<div id='SortData'>" + RenderHTML(this.rptNodeSort) + "</div>" + "<div id='rtnData' msg='" + RtnMsg + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }


        private void NodeUpdate()
        {
            if (string.IsNullOrEmpty(Request.Form["NodeType"]) || string.IsNullOrEmpty(Request.Form["NodeName"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 3)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            string strNodeUrl = string.Empty;

            if (!new AdminTemplate.Common().IsInterger(Request.Form["NodeType"], 1))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            byte iNodeType = Convert.ToByte(Request.Form["NodeType"]);
            if (iNodeType > 2 || iNodeType < 0)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int iParentID = 0;
            byte iNodeTarget = 0;
            if (iNodeType == 1 || iNodeType == 2)
            {
                if (string.IsNullOrEmpty(Request.Form["NodeUrl"]) || string.IsNullOrEmpty(Request.Form["NodeTarget"]) || string.IsNullOrEmpty(Request.Form["ParentID"]))
                {
                    Response.Write("err:參數錯誤");
                    Response.End();
                }
                strNodeUrl = Request.Form["NodeUrl"];
                iNodeTarget = Convert.ToByte(Request.Form["NodeTarget"]);
                iParentID = Int32.Parse(Request.Form["ParentID"]);
                if (iNodeTarget > 2 || iNodeType < 0)
                {
                    Response.Write("err:參數錯誤");
                    Response.End();
                }
            }

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_U(Convert.ToInt32(Request.Form["args"].Split('_')[2]), iNodeType, Request.Form["NodeName"], strNodeUrl, iNodeTarget, iParentID, ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetNodeData(iParentID);
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptNodeData) + "<div id='SortData'>" + RenderHTML(this.rptNodeSort) + "</div>" + "<div id='rtnData' msg='" + RtnMsg + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }


        private void NodeDelete()
        {
            if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 4)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_D(Convert.ToInt32(Request.Form["args"].Split('_')[2]), ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetNodeData(Convert.ToInt32(Request.Form["args"].Split('_')[3]));
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptNodeData) + "<div id='SortData'>" + RenderHTML(this.rptNodeSort) + "</div>" + "<div id='rtnData' msg='" + RtnMsg + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }


        private void NodeSort()
        {
            if (string.IsNullOrEmpty(Request.Form["SourceNode"]) || string.IsNullOrEmpty(Request.Form["TargetNode"]) || string.IsNullOrEmpty(Request.Form["SortType"]) || string.IsNullOrEmpty(Request.Form["ParentID"]))
            {
                Response.Write("err:參數錯誤1");
                Response.End();
            }
            int temp;
            if (!Int32.TryParse(Request.Form["SourceNode"], out temp) || !Int32.TryParse(Request.Form["TargetNode"], out temp) || !Int32.TryParse(Request.Form["SortType"], out temp) || !Int32.TryParse(Request.Form["ParentID"], out temp))
            {
                Response.Write("err:參數錯誤2");
                Response.End();
            }

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_Sort_U(Convert.ToInt32(Request.Form["SourceNode"]), Convert.ToInt32(Request.Form["TargetNode"]), Convert.ToByte(Request.Form["SortType"]), ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetNodeData(Convert.ToInt32(Request.Form["ParentID"]));
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptNodeData) + "<div id='SortData'>" + RenderHTML(this.rptNodeSort) + "</div>" + "<div id='rtnData' msg='" + RtnMsg + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }
    }
}