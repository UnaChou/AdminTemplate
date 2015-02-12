using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web;

namespace AdminTemplate
{
    public class BasePage : System.Web.UI.Page
    {
        public AdminTemplate.Login Login;
        private AdminTemplate.AdminLog log;

        #region "頁面初始化 Page_Init"

        protected override void OnInit(EventArgs e)
        {
            Login = new Login();
            Login.LoginCheck();

            //### 定义 head 加载内容
            HtmlGenericControl objScript = new HtmlGenericControl("script");

            objScript.Attributes.Add("type", "text/javascript");
            objScript.Attributes.Add("src", Config.AppPath + "/Javascript/jquery-1.11.2.min.js");
            Page.Header.Controls.AddAt(1, objScript);

            objScript = new HtmlGenericControl("script");
            objScript.Attributes.Add("type", "text/javascript");
            objScript.Attributes.Add("src", Config.AppPath + "/Javascript/jquery-migrate-1.2.1.min.js"); //原使用jquery-1.5.1.min,部分function新版移除
            Page.Header.Controls.AddAt(2, objScript);

            objScript = new HtmlGenericControl("script");
            objScript.Attributes.Add("type", "text/javascript");
            objScript.Attributes.Add("src", Config.AppPath + "/Javascript/jquery-ui-1.10.4.custom.min.js");
            Page.Header.Controls.AddAt(3, objScript);

            objScript = new HtmlGenericControl("script");
            objScript.Attributes.Add("type", "text/javascript");
            objScript.Attributes.Add("src", Config.AppPath + "/Javascript/jquery-ui-widget.js");
            Page.Header.Controls.AddAt(4, objScript);

            objScript = new HtmlGenericControl("script");
            objScript.Attributes.Add("type", "text/javascript");
            objScript.Attributes.Add("src", Config.AppPath + "/Javascript/Common.js");
            Page.Header.Controls.AddAt(5, objScript);

            base.OnInit(e);
        }

        public override string StyleSheetTheme
        {
            get { return base.StyleSheetTheme; }
            set
            {
                if ((Request.Cookies["jquery-ui-theme"] != null))
                {
                    if ((Request.Cookies["jquery-ui-theme"].Value != null))
                    {
                        value = Request.Cookies["jquery-ui-theme"].Value;
                    }
                }
                base.StyleSheetTheme = value;
            }
        }
        #endregion

        #region "Page_Load"

        protected override void OnLoad(EventArgs e)
        {
            //### 檢查頁面權限
            SetNodePermission();

            string message = "";
            if (!IsPostBack && !this._thisURL.StartsWith("/Frame/"))
            {
                if (!(bool)CanSelect)
                {
                    message = "權限不足";
                }

                log = new AdminLog(Login._AccountID, Login._Account, _thisURL);
                log.log_Select("", "");
            }

            if (!(bool)CanSelect && !this._thisURL.StartsWith("/Frame/"))
            {
                new AdminTemplate.Common().alertMsg(message, Config.AppPath + "/main.aspx");
            }


            //這行一定要，它才會override
            base.OnLoad(e);
        }
        #endregion

        #region "頁面參數設定"

        private string thisURL;
        private bool? CanSelect = false;
        private bool? CanInsert = false;
        private bool? CanModify = false;
        private bool? CanDelete = false;

        /// <summary>
        /// 取得設定頁面網址
        /// </summary>
        protected string _thisURL
        {
            get
            {
                if (string.IsNullOrEmpty(thisURL))
                {
                    if (string.IsNullOrEmpty(Config.AppPath))
                    {
                        thisURL = HttpContext.Current.Request.Path;
                    }
                    else
                    {
                        thisURL = HttpContext.Current.Request.Path.Replace(Config.AppPath, "");
                    }
                }

                return thisURL;
            }
            set { thisURL = value; }
        }

        /// <summary>
        /// 新增權限
        /// </summary>
        protected bool _CanInsert
        {
            get { return (bool)CanInsert; }
        }

        /// <summary>
        /// 修改權限
        /// </summary>
        protected bool _CanModify
        {
            get { return (bool)CanModify; }
        }

        /// <summary>
        /// 刪除權限
        /// </summary>
        protected bool _CanDelete
        {
            get { return (bool)CanDelete; }
        }

        /// <summary>
        /// Log 新增
        /// </summary>
        /// <remarks></remarks>
        protected void _LogInsert(string note)
        {
            log = new AdminLog(Login._AccountID, Login._Account, _thisURL);

            log.log_Insert(note, split());
        }

        /// <summary>
        /// Log 修改
        /// </summary>
        /// <remarks></remarks>
        protected void _LogUpDate(string note)
        {
            log = new AdminLog(Login._AccountID, Login._Account, _thisURL);
            log.log_UpDate(note, split());
        }

        /// <summary>
        /// Log 刪除
        /// </summary>
        /// <remarks></remarks>
        protected void _LogDelete(string note)
        {
            log = new AdminLog(Login._AccountID, Login._Account, _thisURL);
            log.log_Delete(note, split());
        }

        /// <summary>
        /// Log 其它
        /// </summary>
        /// <remarks></remarks>
        protected void _LogOthers(string process, string note)
        {
            log = new AdminLog(Login._AccountID, Login._Account, _thisURL);

            log.log_Other(process, note, split());
        }

        private string split()
        {
            string para_s = "";
            string para_l = "";
            for (int i = 0; i <= Request.Form.Count - 1; i++)
            {
                if (!Request.Form.GetKey(i).Contains("__"))
                {
                    if (Request.Form[i].Length > 100)
                    {
                        para_l += "&" + Request.Form.Keys[i] + "=" + Request.Form[i].Substring(0, 100);
                    }
                    else
                    {
                        para_s += "&" + Request.Form.Keys[i] + "=" + Request.Form[i];
                    }

                }
            }
            return para_s + para_l;
        }

        #endregion

        #region "頁面權限檢查"

        protected void SetNodePermission()
        {
            if (this._thisURL.StartsWith("/frame/").ToString() == "/frame/")
            {
                this.CanSelect = true;
                return;
            }
            if (this._thisURL == "N")
            {
                this.CanSelect = true;
                return;
            }

            new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_Permission_S(Login._AccountID, _thisURL, ref CanSelect, ref CanInsert, ref CanModify, ref CanDelete);

        }

        #endregion
    }
}
