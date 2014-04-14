using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using POSWebRpt.BLL;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ReportManager;
using POSWebRpt.Utilities.ResourceManager;
using POSWebRpt.Common;
using System.Data;

namespace POSWebRpt.Web.Views.Reports
{
    public partial class ItemWiseSale : System.Web.UI.Page
    {
        #region Private Member Variables

        private IFormatProvider _culture = new CultureInfo(ConfigurationManager.AppSettings["Culture"].ToString());
        private int _userId = 0;
        private bool _canAdd = false;
        private bool _canEdit = false;
        private bool _canDelete = false;
        private bool _canView = false;

        #endregion

        #region Protected Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try
                {
                    RetriveParameters();
                    CheckUserAccess();
                    SetAttributes();
                    LoadCounters();
                }
                catch (Exception ex)
                {
                    CommonBLL.HandleException(ex, this.Server.MapPath(this.Request.ApplicationPath).Replace("/", "\\"));
                    ToggleErrorPanel(true, ex.Message);
                }
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                GenerateReport();
            }
            catch (Exception ex)
            {
                CommonBLL.HandleException(ex, this.Server.MapPath(this.Request.ApplicationPath).Replace("/", "\\"));
                ToggleErrorPanel(true, ex.Message);
            }
        }

        #endregion

        #region Private Methods

        private void SetAttributes()
        {
            if (!IsPostBack)
            {
                btnShow.ToolTip = ResourceManager.GetStringWithoutName("R00058");
                ceFromDt.Format = Convert.ToString(ConfigurationManager.AppSettings["DateFormat"]);
                ceToDt.Format = Convert.ToString(ConfigurationManager.AppSettings["DateFormat"]);
                rfvFromDt.ErrorMessage = ResourceManager.GetStringWithoutName("R00062");
                rfvToDt.ErrorMessage = ResourceManager.GetStringWithoutName("R00063");
            }
        }

        private void RetriveParameters()
        {
            _userId = UserBLL.GetLoggedInUserId();

            //Get user permission.
            UserBLL.GetUserPermission(out _canAdd, out _canEdit, out _canDelete, out _canView);
        }

        private void CheckUserAccess()
        {
            if (!_canView)
            {
                Response.Redirect("~/Unauthorized.aspx");
            }
        }

        //private void PopulateTransactionType()
        //{
        //    List<BaseEntity<string>> lstType = CommonBLL.GetTransactionType();
        //    GeneralFunctions.PopulateDropDownList<BaseEntity<string>>(ddlTxnType, lstType, "Id", "Desc", false);
        //}

        //private void PopulateCounter()
        //{
        //    List<IItemGroup> lstCounter = CommonBLL.GetCounter();
        //    GeneralFunctions.PopulateDropDownListAll<IItemGroup>(ddlCounter, lstCounter, "Id", "Name");
        //}

        private void GenerateReport()
        {
            ReportBLL cls = new ReportBLL();
            LocalReportManager reportManager = new LocalReportManager(rptViewer, "ItemWiseSale", ConfigurationManager.AppSettings["ReportNamespace"].ToString(), ConfigurationManager.AppSettings["ReportPath"].ToString());
            ReportCriteria criteria = new ReportCriteria();
            BuildCriteria(criteria);
            List<ReportEntity> lstData = ReportBLL.GetItemWiseSale(criteria);

            ReportDataSource dsGeneral = new ReportDataSource("dsReportData", lstData);
            reportManager.AddParameter("FromDate", txtFromDt.Text.Trim());
            reportManager.AddParameter("ToDate", txtToDt.Text.Trim());
            reportManager.AddDataSource(dsGeneral);
            reportManager.Show();
        }

        private void BuildCriteria(ReportCriteria criteria)
        {
            if (txtFromDt.Text.Trim() != string.Empty) criteria.FromDate = Convert.ToDateTime(txtFromDt.Text, _culture);
            if (txtToDt.Text.Trim() != string.Empty) criteria.ToDate = Convert.ToDateTime(txtToDt.Text, _culture);
            //criteria.TransactionType = ddlTxnType.SelectedValue;
            criteria.CounterId = Convert.ToInt32(ddlCounters.SelectedValue);
        }

        private void ToggleErrorPanel(bool isVisible, string errorMessage)
        {
            if (isVisible)
            {
                dvSync.Style["display"] = "";
                dvErrMsg.InnerHtml = GeneralFunctions.FormatErrorMessage(errorMessage);
            }
            else
            {
                dvSync.Style["display"] = "none";
                dvErrMsg.InnerHtml = string.Empty;
            }
        }

        private void LoadCounters()
        {
            DataSet ds = new ReportBLL().GetAllItemGroup();
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.NewRow();
            dr["ItemGroupID"] = "0";
            dr["Descr"] = "All Counters";
            dt.Rows.InsertAt(dr, 0);
            ddlCounters.DataValueField = "ItemGroupID";
            ddlCounters.DataTextField = "Descr";
            ddlCounters.DataSource = dt;
            ddlCounters.DataBind();
        }

        #endregion

        protected void ddlCounters_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

    }
}