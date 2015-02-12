using AdminTemplate;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminTemplate.AdminSystem
{
    public partial class AdminIPCtrl : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //###檢查頁面權限!!
            //Call AdminTemplate.CheckReadPagePermission()
            if (!(Page.IsPostBack == true))
            {
                GvwDataBind();
            }

        }

        public static bool IsIPAddress(string str1)
        {
            if (str1 == null || str1 == string.Empty || str1.Length < 7 || str1.Length > 15)
            {
                return false;
            }
            string regformat = "^\\d{1,3}[\\.]\\d{1,3}[\\.]\\d{1,3}[\\.]\\d{1,3}$";
            Regex regex = new Regex(regformat, RegexOptions.IgnoreCase);
            return regex.IsMatch(str1);
        }


        protected void btnNewSubmit_Click(object sender, System.EventArgs e)
        {
            string strIP = tbxIP.Text;

            if (string.IsNullOrEmpty(strIP))
            {
                new AdminTemplate.Common().alertMsg("請輸入IP!");
                return;
            }

            if (IsIPAddress(strIP) == false)
            {
                new AdminTemplate.Common().alertMsg("IP 格式錯誤!");
                return;
            }

            _LogInsert("");

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Admin_IP_I(strIP, ref RtnCode, ref RtnMsg);


            if (RtnCode == 1)
            {
                tbxIP.Text = null;
                new AdminTemplate.Common().alertMsg("IP建立成功!");
                GvwDataBind();
            }
            else
            {
                new AdminTemplate.Common().alertMsg(RtnMsg);
                return;
            }
        }


        protected void gvwData_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            this.gvwData.PageIndex = e.NewPageIndex;
            GvwDataBind();

        }

        public void GvwDataBind()
        {
            gvwData.DataSource = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Admin_IP_S();
            gvwData.DataBind();
        }


        protected void gvwData_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int iautoID = Convert.ToInt32(gvwData.DataKeys[e.RowIndex].Values["ID"].ToString());

            string strAdminIP = ((TextBox)gvwData.Rows[e.RowIndex].FindControl("txtRealIP")).Text;

            if (string.IsNullOrEmpty(strAdminIP))
            {
                new AdminTemplate.Common().alertMsg("請輸入IP!");
                return;
            }

            if (IsIPAddress(strAdminIP) == false)
            {
                new AdminTemplate.Common().alertMsg("IP 格式錯誤!");
                return;
            }

            _LogUpDate("");

            int? RtnCode = 0;
            string RtnMsg = "";

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Admin_IP_U(iautoID, strAdminIP, ref RtnCode, ref RtnMsg);

            this.gvwData.EditIndex = -1;
            GvwDataBind();


            if (RtnCode == 1)
            {
                tbxIP.Text = null;
                new AdminTemplate.Common().alertMsg("更新成功!");
                GvwDataBind();


            }
            else
            {
                new AdminTemplate.Common().alertMsg(RtnMsg);
                return;

            }

        }


        protected void gvwData_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int iautoID = Convert.ToInt32(gvwData.DataKeys[e.RowIndex].Values["ID"].ToString());


            try
            {
                _LogDelete("");

                int? RtnCode = 0;
                string RtnMsg = "";
                new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Admin_IP_D(iautoID, ref RtnCode, ref RtnMsg);
                GvwDataBind();

                if (RtnCode == 1)
                {
                    tbxIP.Text = null;
                    new AdminTemplate.Common().alertMsg("刪除成功!");
                    GvwDataBind();


                }
                else
                {
                    new AdminTemplate.Common().alertMsg(RtnMsg);
                    return;

                }

            }
            catch (Exception ex)
            {
                new AdminTemplate.Common().alertMsg("系統發生錯誤，請洽管理人員！");
            }

            GvwDataBind();

        }


        protected void gvwData_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            this.gvwData.EditIndex = e.NewEditIndex;
            GvwDataBind();

        }


        protected void gvwData_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            this.gvwData.EditIndex = -1;
            GvwDataBind();
            new AdminTemplate.Common().alertMsg("取消更新!");
        }

    }
}