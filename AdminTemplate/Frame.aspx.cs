using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminTamplateProgram
{
    public partial class Frame : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = System.Web.Configuration.WebConfigurationManager.AppSettings["WebName"] + "後台管理系統";


            if (Session["FrameUrl"] != null && !string.IsNullOrEmpty(Session["FrameUrl"].ToString()))
            {
                freContent.Attributes["src"] = Session["FrameUrl"].ToString();
            }
            else
            {
                freContent.Attributes["src"] = "Main.aspx";
            }
        }
    }
}