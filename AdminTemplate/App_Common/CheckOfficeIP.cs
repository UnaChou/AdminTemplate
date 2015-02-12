using System;
using System.Web;

namespace AdminTemplate
{
    public class CheckOfficeIP
    {
        public bool CheckIsOfficeIP()
        {
            //###是否是公司的IP
            bool bOfficeIP = false;
            string bByPassIP = ",60.251.100.50,60.251.100.51,60.251.100.52,60.251.100.53,60.251.100.54,175.98.112.98,175.98.112.99,175.98.112.100,175.98.112.101,175.98.112.102,61.63.12.97,175.98.112.98,";

            //###原廠的IP，請依各遊戲修改!!
            bByPassIP = bByPassIP + "::1,127.0.0.1,";

            //加入 TOKEN 的IP
            if (bByPassIP.IndexOf("," + HttpContext.Current.Request.ServerVariables["Remote_Addr"] + ",") >= 0 || HttpContext.Current.Request.ServerVariables["Remote_Addr"].Contains("10.10.98."))
            {
                //If bByPassIP.IndexOf("," & Current.Request.ServerVariables("Remote_Addr") & ",") >= 0 Then
                bOfficeIP = true;
            }

            return bOfficeIP;

        }
    }
}
