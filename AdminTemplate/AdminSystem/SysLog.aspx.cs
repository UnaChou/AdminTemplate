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
    public partial class SysLog : BasePage
    {
        protected string tbl = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.TxB_ST.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
                this.TxB_ED.Text = DateTime.Now.ToString("yyyy/MM/dd");
            }

        }


        private void biding()
        {
            //日期區間最多24個月
            if (new TimeSpan(Convert.ToDateTime(TxB_ST.Text).Ticks - Convert.ToDateTime(TxB_ED.Text).Ticks).Days > (24 * 30))
            {
                new AdminTemplate.Common().alertMsg("日期區間最多24個月", null);
                return;
            }

            DataTable dt = new AdminTemplate.ORM.WebName_AdminLog.WebName_AdminLogSP(Config.ConnAdminLog).Ousp_Admin_AdminActionLog_S(this.txtAccount.Text, Convert.ToDateTime(this.TxB_ST.Text), Convert.ToDateTime(this.TxB_ED.Text).AddDays(1));

            int MaxQuerySize = Request.Browser.Browser == "IE" & Request.Browser.MajorVersion < 9 ? 5000 : 20000;

            if (dt.Rows.Count > 0)
            {
                MaxQuerySize = dt.Rows.Count < MaxQuerySize ? dt.Rows.Count : MaxQuerySize;
                this.QueryMemo.InnerHtml = dt.Rows.Count > 5000 & MaxQuerySize == 5000 ? "<span class=\"ui-corner-all\" style=\"padding:2px 4px;\">僅顯示" + dt.Rows.Count + "筆結果中的5000筆(升級瀏覽器以顯示更多結果)</span>" : "";


                for (int i = 0; i <= MaxQuerySize - 1; i++)
                {
                    Repeater1.Visible = true;

                    dt.DefaultView.RowFilter = "RowIndex >" + i.ToString() + " AND RowIndex <= " + (i + 100).ToString();
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();


                    tbl += RenderHTML(Repeater1);
                    i = i + 99;
                }
                Repeater1.Visible = false;

                this.QueryMsg.InnerHtml = "<span class=\"ui-state-highlight ui-corner-all\" style=\"padding:2px 4px;\">(查詢資料共" + MaxQuerySize + "筆)</span>";
            }
            else
            {
                this.QueryMsg.InnerHtml = "<span class=\"ui-state-highlight ui-corner-all\" style=\"padding:2px 4px;\">(查詢資料共" + dt.Rows.Count + "筆)</span>";
            }

        }


        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            biding();
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

            return sb.ToString().Replace(Environment.NewLine, "").Replace(Environment.NewLine, "").Replace(Environment.NewLine, "").Replace("'", "\\'");
        }

    }
}