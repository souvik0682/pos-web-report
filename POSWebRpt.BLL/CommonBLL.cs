using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using POSWebRpt.Common;
using POSWebRpt.DAL;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ResourceManager;

namespace POSWebRpt.BLL
{
    public class CommonBLL : BLLBase
    {
        #region Common

        /// <summary>
        /// Handles the exception.
        /// </summary>
        /// <param name="ex">The <see cref="System.Exception"/> object.</param>
        /// <param name="logFilePath">The log file path.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>02/12/2012</createddate>
        public static void HandleException(Exception ex, string logFilePath)
        {
            int userId = 0;
            string userDetail = string.Empty;
            string baseException = string.Empty;

            if (ex.GetType() != typeof(System.Threading.ThreadAbortException))
            {
                if (System.Web.HttpContext.Current.Session[Constants.SESSION_USER_INFO] != null)
                {
                    IUser user = (IUser)System.Web.HttpContext.Current.Session[Constants.SESSION_USER_INFO];

                    if (!ReferenceEquals(user, null))
                    {
                        userId = user.Id;
                        //userDetail = user.Id.ToString() + ", " + user.FirstName + " " + user.LastName;
                    }
                }

                if (ex.GetBaseException() != null)
                {
                    baseException = ex.GetBaseException().ToString();
                }
                else
                {
                    baseException = ex.StackTrace;
                }

                try
                {
                    CommonDAL.SaveErrorLog(userId, ex.Message, baseException);
                }
                catch
                {
                    //try
                    //{
                    //    string message = DateTime.UtcNow.ToShortDateString().ToString() + " "
                    //            + DateTime.UtcNow.ToLongTimeString().ToString() + " ==> " + "User Id: " + userDetail + "\r\n"
                    //            + ex.GetBaseException().ToString();

                    //    GeneralFunctions.WriteErrorLog(logFilePath + LogFileName, message);
                    //}
                    //catch
                    //{
                    //    // Consume the exception.
                    //}
                }
            }
        }

        /// <summary>
        /// Sets the default search criteria.
        /// </summary>
        /// <param name="criteria">The <see cref="REC.Entity.SearchCriteria" /> object.</param>
        /// <param name="sortExpression">The sort expression.</param>
        /// <param name="currentPage">The current page.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        ///   <createddate>26/06/2013</createddate>
        public static void SetDefaultSearchCriteria(SearchCriteria criteria, string sortExpression, PageName currentPage)
        {
            string sortDirection = "ASC";

            criteria.SortExpression = sortExpression;
            criteria.SortDirection = sortDirection;
            criteria.CurrentPage = currentPage;
            criteria.PageSize = Settings.Settings.PageSize;
            HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA] = criteria;
        }

        /// <summary>
        /// Changes the sort expression.
        /// </summary>
        /// <param name="sortExpression">The sort expression.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>26/06/2013</createddate>
        public static void ChangeSortExpression(string sortExpression)
        {
            if (!ReferenceEquals(HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA], null))
            {
                SearchCriteria criteria = (SearchCriteria)HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA];

                if (!ReferenceEquals(criteria, null))
                {
                    criteria.SortExpression = sortExpression;
                    criteria.SortDirection = (criteria.SortDirection == "ASC") ? "DESC" : "ASC";
                }
            }
        }

        /// <summary>
        /// Saves the new index of the page.
        /// </summary>
        /// <param name="newIndex">The new index.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>26/06/2013</createddate>
        public static void SaveNewPageIndex(int newIndex)
        {
            if (!ReferenceEquals(HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA], null))
            {
                SearchCriteria criteria = (SearchCriteria)HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA];

                if (!ReferenceEquals(criteria, null))
                {
                    criteria.PageIndex = newIndex;
                }
            }
        }

        /// <summary>
        /// Saves the new size of the page.
        /// </summary>
        /// <param name="newPageSize">New size of the page.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>26/06/2013</createddate>
        public static void SaveNewPageSize(int newPageSize)
        {
            if (!ReferenceEquals(HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA], null))
            {
                SearchCriteria criteria = (SearchCriteria)HttpContext.Current.Session[Constants.SESSION_SEARCH_CRITERIA];

                if (!ReferenceEquals(criteria, null))
                {
                    criteria.PageSize = newPageSize;
                }
            }
        }

        #region Email

        public static bool SendMail(string from, string displayName, string mailTo, string cc, string subject, string body, string mailServerIP)
        {
            bool sent = true;

            try
            {
                if (mailTo != "")
                {
                    MailMessage MyMail = new MailMessage();
                    MyMail.To.Add(new MailAddress(mailTo));
                    MyMail.Priority = MailPriority.High;
                    MyMail.From = new MailAddress(from, displayName);

                    if (cc != "")
                    {
                        MailAddress ccAddr = new MailAddress(cc);
                        MyMail.CC.Add(ccAddr);
                    }

                    MyMail.Subject = subject;
                    MyMail.Body = GetMessageBody(body);
                    //MyMail.BodyEncoding = System.Text.Encoding.ASCII;
                    MyMail.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient(mailServerIP);
                    client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                    client.Send(MyMail);
                }
                else { sent = false; }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return sent;
        }

        public static bool SendMail(string from, string displayName, string mailTo, string cc, string subject, string body, string mailServerIP, string mailUserAccount, string mailUserPwd)
        {
            bool sent = true;

            try
            {
                if (mailTo != "")
                {
                    MailMessage MyMail = new MailMessage();
                    MyMail.To.Add(new MailAddress(mailTo));
                    MyMail.Priority = MailPriority.High;
                    MyMail.From = new MailAddress(from, displayName);

                    if (cc != "")
                    {
                        MailAddress ccAddr = new MailAddress(cc);
                        MyMail.CC.Add(ccAddr);
                    }

                    MyMail.Subject = subject;
                    MyMail.Body = GetMessageBody(body);
                    //MyMail.BodyEncoding = System.Text.Encoding.ASCII;
                    MyMail.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient(mailServerIP, 25);
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    System.Net.NetworkCredential credential = new System.Net.NetworkCredential(mailUserAccount, mailUserPwd);
                    client.Credentials = credential;
                    client.Send(MyMail);
                }
                else { sent = false; }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return sent;
        }

        public static string GetMessageBody(string strBodyContent)
        {
            try
            {
                StringBuilder sbMsgBody = new StringBuilder();
                //sbMsgBody.Append("<font face='Verdana, Arial, Helvetica, sans-serif' size='10' color='#8B4B0D'>Daily Sales Call</font>");
                //sbMsgBody.Append("<br />");
                //sbMsgBody.Append("<br /><br /><br />");
                sbMsgBody.Append("<html><body>");
                sbMsgBody.Append("<font face=verdana size=2>" + strBodyContent + "</font>");
                sbMsgBody.Append("</body></html>");

                return sbMsgBody.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #endregion

        public static List<BaseEntity<string>> GetTransactionType()
        {
            List<BaseEntity<string>> lstType = new List<BaseEntity<string>>();
            lstType.Add(new BaseEntity<string>() { Id = "A", Desc = "All" });
            lstType.Add(new BaseEntity<string>() { Id = "B", Desc = "Bill" });
            lstType.Add(new BaseEntity<string>() { Id = "R", Desc = "Refund" });
            return lstType;
        }

        public static List<IItemGroup> GetCounter()
        {
            return CommonDAL.GetItemGroup('T', 0, 1);
        }
    }
}