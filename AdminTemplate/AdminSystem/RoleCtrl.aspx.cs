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
    public partial class RoleCtrl : BasePage
    {
        protected int PageSize = 10;

        protected int Total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.Form["fnMode"]))
            {
                if (Request.Form["fnMode"] == "search")
                {
                    RoleSearch();
                }
                else if (Request.Form["fnMode"] == "add" & _CanInsert == true)
                {
                    _LogInsert("");
                    RoleAdd();
                }
                else if (Request.Form["fnMode"] == "btnUpdate" & _CanModify == true)
                {
                    _LogUpDate("");
                    RoleUpdate();
                }
                else if (Request.Form["fnMode"] == "btnDelete" & _CanDelete == true)
                {
                    _LogDelete("");
                    RoleDelete();
                }
                else
                {
                    Response.Write("err:參數錯誤");
                    Response.End();
                }

            }

            GetRoleData(1);

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


        protected void RoleSearch()
        {
            if (string.IsNullOrEmpty(Request.Form["p"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            GetRoleData(Convert.ToInt32(Request.Form["p"]));
            Response.Write(RenderHTML(this.rptRoleData) + "<div id='rtnData' total='" + Total.ToString() + "'></div>");
            Response.End();

        }

        /// <summary>
        /// Get role information
        /// </summary>

        protected void GetRoleData(int PageNo)
        {
            int? iTotal = 0;
            DataTable dtRole = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_S(PageSize, PageNo, ref iTotal);

            if (dtRole.Rows.Count > 0)
            {
                this.rptRoleData.DataSource = dtRole;
                this.rptRoleData.DataBind();
                Total = (int)iTotal;
            }


        }


        protected void RoleAdd()
        {
            if (string.IsNullOrEmpty(Request.Form["RoleName"]) || string.IsNullOrEmpty(Request.Form["RoleLevel"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (!new AdminTemplate.Common().IsInterger(Request.Form["RoleLevel"], 1))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int iRoleLevel = Int32.Parse(Request.Form["RoleLevel"]);
            if (iRoleLevel > 2 || iRoleLevel < 0)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_I(Request.Form["RoleName"], Convert.ToByte(iRoleLevel), ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetRoleData(1);
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptRoleData) + "<div id='rtnData' msg='" + RtnMsg + "' total='" + Total.ToString() + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }


        protected void RoleUpdate()
        {
            if (string.IsNullOrEmpty(Request.Form["RoleName"]) || string.IsNullOrEmpty(Request.Form["args"]) || string.IsNullOrEmpty(Request.Form["RoleLevel"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 4)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (!new AdminTemplate.Common().IsInterger(Request.Form["RoleLevel"], 1))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            byte iRoleLevel = Convert.ToByte(Request.Form["RoleLevel"]);
            if (iRoleLevel > 2 || iRoleLevel < 0)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_U(Request.Form["RoleName"], Convert.ToInt32(Request.Form["args"].Split('_')[2]), iRoleLevel, ref RtnCode, ref RtnMsg);


            if (RtnCode == 1)
            {
                GetRoleData(Convert.ToInt32(Request.Form["args"].Split('_')[3]));
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptRoleData) + "<div id='rtnData' msg='" + RtnMsg + "' total='" + Total.ToString() + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }


        protected void RoleDelete()
        {
            if (string.IsNullOrEmpty(Request.Form["args"]))
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            if (Request.Form["args"].IndexOf("_") == -1 || Request.Form["args"].Split('_').Length != 4)
            {
                Response.Write("err:參數錯誤");
                Response.End();
            }

            int? RtnCode = 0;
            string RtnMsg = "";
            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Role_D(Convert.ToInt32(Request.Form["args"].Split('_')[2]), ref RtnCode, ref RtnMsg);

            if (RtnCode == 1)
            {
                GetRoleData(Convert.ToInt32(Request.Form["args"].Split('_')[3]));
            }

            Response.Write((RtnCode == 1 ? RenderHTML(this.rptRoleData) + "<div id='rtnData' msg='" + RtnMsg + "' total='" + Total.ToString() + "'></div>" : "err:" + RtnMsg + "#" + RtnCode.ToString()));
            Response.End();

        }

    }
}