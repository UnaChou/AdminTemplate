using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminTemplate;

namespace AdminTamplateProgram
{
    public partial class FrameLeftBar : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //### 產生目錄
            renderMenu();
        }

        protected void renderMenu()
        {
            DataTable dtNode = new AdminTemplate.ORM.WebName_Admin.WebName_AdminSP(Config.ConnAdmin).Ousp_Admin_Node_Menu_S(AdminTemplate.Login._AccountID);

            if (dtNode.Rows.Count > 0)
            {
                DataRow[] dtNodeDir = dtNode.Select("ParentID = 0", "SortNo, NodeID");
                StringBuilder sb = new StringBuilder();
                foreach (DataRow drDir in dtNodeDir)
                {
                    //### 產生目錄節點                   
                    sb.AppendLine("<h3><a href=\"#\">" + drDir["NodeName"].ToString() + "</a></h3>");
                    sb.AppendLine("<div>");

                    //### 產生頁面結點
                    string[] arrTarget = { "freContent", "_blank" };
                    DataRow[] dtNodePage = dtNode.Select("ParentID = " + drDir["NodeID"].ToString(), "SortNo, NodeID");
                    foreach (DataRow drPage in dtNodePage)
                    {
                        sb.AppendLine("<a class=\"btnMenu\" target=\"" + arrTarget[Int32.Parse(drPage["NodeTarget"].ToString())] + "\" href=\"" + Config.AppPath + drPage["NodeUrl"].ToString() + "\">" + drPage["NodeName"].ToString() + "</a>");
                    }

                    sb.AppendLine("</div>");
                }

                this.ltlMenu.Text = sb.ToString();
            }
            else
            {
                //### 尚未建立目錄
                this.ltlMenu.Text = "<a target=\"freContent\" href=\"../AdminSystem/NodeCtrl.aspx\">尚未建立目錄，前往建立</a>";
            }

        }
    }
}