using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using POSWebRpt.DAL.DBManager;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;

namespace POSWebRpt.DAL
{
    public class ReportDAL : DataServiceBase
    {
        public static List<ReportEntity> GetBillWiseSaleRefund(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[dbo].[sp_rpt_SALEREFUNDREGISTER]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@TranType", criteria.TransactionTypeId);
                helper.Parameters.Add("@StartDate", criteria.FromDate);
                helper.Parameters.Add("@EndDate", criteria.ToDate);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity();
                    report.LoadBillWiseSaleRefund(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetCashierLog(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetCashierWiseSale(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[dbo].[sp_rpt_CASHIERWISESALENEW]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@Mode", criteria.CashierId);
                helper.Parameters.Add("@StartDate", criteria.FromDate);
                helper.Parameters.Add("@EndDate", criteria.ToDate);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity();
                    report.LoadCashierWiseSale(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        //public static List<ReportEntity> GetCashierWiseSaleSummary(ReportCriteria criteria)
        //{
        //    List<ReportEntity> lstData = new List<ReportEntity>();

        //    using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
        //    {
        //        helper.CommandText = "[dbo].[sp_rpt_CASHIERWISESALE]";
        //        helper.CommandType = CommandType.StoredProcedure;
        //        helper.Parameters.Add("@", 1);
        //        helper.Open();
        //        helper.ExecuteReader(CommandBehavior.CloseConnection);

        //        while (helper.DataReader.Read())
        //        {
        //            ReportEntity report = new ReportEntity(helper.DataReader);
        //            lstData.Add(report);
        //        }

        //        helper.Close();
        //    }

        //    return lstData;
        //}

        public static List<ReportEntity> GetItemWiseSale(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetItemWiseSaleWithCombo(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetSaleRegister(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetStockLedger(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetItemWiseVat(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }

        public static List<ReportEntity> GetRestaurantWiseVat(ReportCriteria criteria)
        {
            List<ReportEntity> lstData = new List<ReportEntity>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[rpt].[]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@", 1);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    ReportEntity report = new ReportEntity(helper.DataReader);
                    lstData.Add(report);
                }

                helper.Close();
            }

            return lstData;
        }
    }
}
