using AdminTemplate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminTamplateProgram
{
    public partial class FrameTopBar1 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Lbl_Account.Text = "Hi,<font color='green'>" + AdminTemplate.Login._Account + "</font>";
        }

        protected void Btn_LogOut_Click(object sender, EventArgs e)
        {
            AdminTemplate.Login.LoginOut();
        }
    }
}