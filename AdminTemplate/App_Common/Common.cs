using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.IO;
using System.Collections.Specialized;

namespace AdminTemplate
{
    public class Common
    {

        //功能：執行Javascript
        public void RunJavaScript(string str, bool ScriptTags)
        {
            Page page = (Page)HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", str, ScriptTags);
        }

        //功能：顯示訊息視窗
        public void alertMsg(string msg)
        {
            Page page = (Page)HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "alert('" + msg.Replace("'", "") + "');", true);
        }

        //功能：顯示訊息視窗,可導頁
        public void alertMsg(string msg, string sPage)
        {
            Page page = (Page)HttpContext.Current.Handler;

            if (sPage != null)
            {
                page.ClientScript.RegisterStartupScript(page.GetType(), "", "alert('" + msg.Replace("'", "") + "');location.href='" + sPage + "';", true);
            }
            else
            {
                page.ClientScript.RegisterStartupScript(page.GetType(), "", "alert('" + msg.Replace("'", "") + "');", true);
            }
        }

        //功能：產生字串的SHA256雜湊，轉換為Base64編碼字串
        public string SHA256CryptBase64(string strText)
        {
            SHA256 sha256 = new SHA256CryptoServiceProvider();
            byte[] source = Encoding.UTF8.GetBytes(strText);
            byte[] crypto = sha256.ComputeHash(source);
            string result = Convert.ToBase64String(crypto);
            return result;
        }

        //功能：產生字串的SHA256雜湊，轉換為十六進位字串
        public string SHA256CryptHex(string strText)
        {
            SHA256 sha256 = new SHA256CryptoServiceProvider();
            byte[] source = Encoding.UTF8.GetBytes(strText);
            byte[] crypto = sha256.ComputeHash(source);
            string result = BitConverter.ToString(crypto).Replace("-", string.Empty);
            return result;
        }

        //功能：產生字串的MD5雜湊，轉換為Base64編碼字串
        public string MD5CryptBase64(string strText)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] source = Encoding.UTF8.GetBytes(strText);
            byte[] crypto = md5.ComputeHash(source);
            string result = Convert.ToBase64String(crypto);
            return result;
        }

        //功能：產生字串的MD5雜湊，轉換為十六進位字串
        public string MD5CryptHex(string strText)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] source = Encoding.UTF8.GetBytes(strText);
            byte[] crypto = md5.ComputeHash(source);
            string result = BitConverter.ToString(crypto).Replace("-", string.Empty);
            return result;
        }

        //功能：取得Client端的IPv4位址
        public string GetClientIPv4()
        {
            string ipv4 = String.Empty;

            foreach (IPAddress ip in Dns.GetHostAddresses(GetClientIP()))
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    ipv4 = ip.ToString();
                    break;
                }
            }

            if (ipv4 != String.Empty)
            {
                return ipv4;
            }

            foreach (IPAddress ip in Dns.GetHostEntry(GetClientIP()).AddressList)
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    ipv4 = ip.ToString();
                    break;
                }
            }

            return ipv4;
        }

        //功能：取得Client端IP位址
        public string GetClientIP()
        {
            if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] == null) //沒有使用PROXY
            {
                return HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            else
            {
                return HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }
        }

        //功能：將查詢結果存到DataTable
        public DataTable QueryToDataTable(string connstr, string sStoreProcName, IDataParameter[] parameters)
        {
            connstr = ConfigurationManager.ConnectionStrings[connstr].ConnectionString;

            SqlCommand cmd = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = sStoreProcName
            };

            cmd.Parameters.AddRange(parameters);

            SqlConnection conn = new SqlConnection(connstr);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            using (conn)
            {
                cmd.Connection = conn;
                da.Fill(dt);
            }

            return dt;
        }

        //功能：將查詢結果存到DataSet
        public DataSet QueryToDataSet(string connstr, string sStoreProcName, IDataParameter[] parameters)
        {
            connstr = ConfigurationManager.ConnectionStrings[connstr].ConnectionString;

            SqlCommand cmd = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = sStoreProcName
            };

            cmd.Parameters.AddRange(parameters);

            SqlConnection conn = new SqlConnection(connstr);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            using (conn)
            {
                cmd.Connection = conn;
                da.Fill(ds);
            }

            return ds;
        }

        //功能：執行SQL命令
        public int CommandExecuteNonQuery(string connstr, string sStoreProcName, IDataParameter[] parameters)
        {
            connstr = ConfigurationManager.ConnectionStrings[connstr].ConnectionString;

            SqlCommand cmd = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = sStoreProcName
            };

            cmd.Parameters.AddRange(parameters);

            int ret = 0;
            SqlConnection conn = new SqlConnection(connstr);

            using (conn)
            {
                conn.Open();
                cmd.Connection = conn;
                ret = cmd.ExecuteNonQuery();
            }

            return ret;
        }

        //功能：將時間轉成UnixTimeStamp
        public int DateTimeToUnixTimeStamp(DateTime time)
        {
            DateTime st = new DateTime(1970, 1, 1);
            int uts = Convert.ToInt32(((TimeSpan)time.Subtract(st)).TotalSeconds);
            return uts;
        }

        //功能：將UnixTimeStamp轉成時間
        public DateTime UnixTimeStampToDateTime(int uts)
        {
            DateTime time = (new DateTime(1970, 1, 1)).AddSeconds(uts);
            return time;
        }

        //功能：判斷是否為測試機
        public static bool IsTestMode()
        {
            if (ConfigurationManager.AppSettings["TestMode"] == null)
                return false;
            if (ConfigurationManager.AppSettings["TestMode"] == "true")
                return true;

            return false;
        }

        //功能：取得連線字串
        public string GetConnStr()
        {
            string connstr = "";

            if (Common.IsTestMode())
            {
                connstr = ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
            }
            else
            {

            }

            return connstr;
        }

        //功能：使用WebRequest進行HTTP POST
        public string WebRequestPost(string url, string postData)
        {
            string responseFromServer = "";

            WebRequest request = WebRequest.Create(url);

            byte[] byteArray = Encoding.UTF8.GetBytes(postData);

            request.Method = "POST";
            request.ContentLength = byteArray.Length;
            request.ContentType = "application/x-www-form-urlencoded";

            using (Stream reqStream = request.GetRequestStream())
            {
                reqStream.Write(byteArray, 0, byteArray.Length);
            }

            using (WebResponse response = request.GetResponse())
            {
                using (Stream resStream = response.GetResponseStream())
                {
                    using (StreamReader reader = new StreamReader(resStream))
                    {
                        responseFromServer = reader.ReadToEnd();
                    }
                }
            }

            return responseFromServer;
        }

        //功能：使用WebClient進行HTTP POST
        public string WebClientPost(string url, string postData)
        {
            string responseFromServer = "";

            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                wc.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
                responseFromServer = wc.UploadString(url, postData);
            }

            return responseFromServer;
        }

        //功能：使用FormSubmit進行HTTP POST
        public void RedirectAndPOST(string url, NameValueCollection data)
        {
            HttpContext.Current.Response.Clear();

            StringBuilder sb = new StringBuilder();

            sb.Append("<html>");
            sb.Append("<body onload='document.forms[0].submit()'>");
            sb.Append("<form action='" + url + "' method='post'>");

            foreach (string key in data)
            {
                sb.Append("<input type='hidden' name='" + key + "' value='" + data[key] + "'>");
            }

            sb.Append("</form>");
            sb.Append("</body>");
            sb.Append("</html>");

            HttpContext.Current.Response.Write(sb.ToString());
            HttpContext.Current.Response.End();
        }

        //功能：判斷是否為數字
        public bool IsInterger(string str, int len)
        {
            long temp;

            if (!Int64.TryParse(str, out temp))
            {
                return false;
            }

            if (temp.ToString().Length > len)
            {
                return false;
            }

            return true;
        }
    }
}