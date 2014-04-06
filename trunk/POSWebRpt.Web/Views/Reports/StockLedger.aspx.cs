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

namespace POSWebRpt.Web.Views.Reports
{
    public partial class StockLedger : System.Web.UI.Page
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
            RetriveParameters();
            CheckUserAccess();

            if (!IsPostBack)
            {

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
                GeneralFunctions.RegisterErrorAlertScript(this, ex.Message);
            }
        }

        #endregion

        #region Private Methods

        private void SetAttributes()
        {
            if (!IsPostBack)
            {
                btnShow.ToolTip = ResourceManager.GetStringWithoutName("R00058");
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

        private void GenerateReport()
        {
            ReportBLL cls = new ReportBLL();
            LocalReportManager reportManager = new LocalReportManager(rptViewer, "StockLedger", ConfigurationManager.AppSettings["ReportNamespace"].ToString(), ConfigurationManager.AppSettings["ReportPath"].ToString());
            ReportCriteria criteria = new ReportCriteria();
            BuildCriteria(criteria);
            List<ReportEntity> lstData = ReportBLL.GetStockLedger(criteria);

            ReportDataSource dsGeneral = new ReportDataSource("dsReportData", lstData);
            reportManager.AddParameter("FromDate", string.Empty);
            reportManager.AddParameter("ToDate", string.Empty);
            reportManager.AddDataSource(dsGeneral);
            reportManager.Show();
        }

        private void BuildCriteria(ReportCriteria criteria)
        {

        }

        #endregion

    }
}