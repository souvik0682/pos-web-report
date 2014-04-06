using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using POSWebRpt.DAL;
using POSWebRpt.DAL.DBManager;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ResourceManager;

namespace POSWebRpt.BLL
{
    public class ReportBLL
    {
        public static List<ReportEntity> GetBillWiseSaleRefund(ReportCriteria criteria)
        {
            return ReportDAL.GetBillWiseSaleRefund(criteria);
        }

        public static List<ReportEntity> GetCashierLog(ReportCriteria criteria)
        {
            return ReportDAL.GetCashierLog(criteria);
        }

        public static List<ReportEntity> GetCashierWiseSale(ReportCriteria criteria)
        {
            return ReportDAL.GetCashierWiseSale(criteria);
        }

        //public static List<ReportEntity> GetCashierWiseSaleSummary(ReportCriteria criteria)
        //{
        //    return ReportDAL.GetCashierWiseSaleSummary(criteria);
        //}

        public static List<ReportEntity> GetItemWiseSale(ReportCriteria criteria)
        {
            return ReportDAL.GetItemWiseSale(criteria);
        }

        //public static List<ReportEntity> GetItemWiseSaleWithCombo(ReportCriteria criteria)
        //{
        //    return ReportDAL.GetItemWiseSaleWithCombo(criteria);
        //}

        public static List<ReportEntity> GetSaleRegister(ReportCriteria criteria)
        {
            return ReportDAL.GetSaleRegister(criteria);
        }

        public static List<ReportEntity> GetStockLedger(ReportCriteria criteria)
        {
            return ReportDAL.GetStockLedger(criteria);
        }

        public static List<ReportEntity> GetItemWiseVat(ReportCriteria criteria)
        {
            return ReportDAL.GetItemWiseVat(criteria);
        }

        public static List<ReportEntity> GetRestaurantWiseVat(ReportCriteria criteria)
        {
            return ReportDAL.GetRestaurantWiseVat(criteria);
        }
    }
}
