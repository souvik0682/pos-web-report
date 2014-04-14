using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using System.Data.SqlClient;

namespace POSWebRpt.Entity
{
    public class ReportEntity : IReport
    {
        #region IReport Members

        public String BillType { get; set; }
        public Int32 BillNo { get; set; }
        public DateTime BillDate { get; set; }
        public Int32 CashierID { get; set; }
        public String Cashier { get; set; }
        public Int32 ItemGroupId { get; set; }
        public String ItemGroupName { get; set; }
        public Int32 ItemId { get; set; }
        public String ItemName { get; set; }
        public Decimal BasicAmount { get; set; }
        public Int32 Quantity { get; set; }
        public Decimal VAT { get; set; }
        public Decimal STax { get; set; }
        public Decimal RoundOff { get; set; }
        public Decimal BillAmount { get; set; }
        public Decimal BillAmoutCash { get; set; }
        public Decimal BillAmoutCreditCard { get; set; }
        public Decimal RefundAmoutCash { get; set; }
        public Decimal RefundAmoutCreditCard { get; set; }
        public Decimal NetAmount { get; set; }
        public Decimal NetAmountCash { get; set; }
        public Decimal NetAmountCreditCard { get; set; }
        public String RefundReason { get; set; }
        public int CounterId { get; set; }
        public String CounterName { get; set; }
        public String MachineName { get; set; }
        public DateTime LoginTime { get; set; }
        public DateTime LogoutTime { get; set; }
        public Decimal LoginBalance { get; set; }
        public Decimal LogoutBalance { get; set; }
        public Decimal OpeningBalance { get; set; }
        public Decimal QuantityReceipt { get; set; }
        public Decimal QuantityAdjusted { get; set; }
        public Decimal QuantityRejected { get; set; }
        public Decimal QuantitySold { get; set; }
        public Decimal ClosingBalance { get; set; }

        #endregion

        #region Constructors

        public ReportEntity()
        {

        }

        public ReportEntity(SqlDataReader reader)
        {

        }

        #endregion

        #region Constructors

        public void LoadBillWiseSaleRefund(SqlDataReader reader)
        {
            this.BillType = Convert.ToString(reader["BillType"]);
            this.BillNo = Convert.ToInt32(reader["BillNo"]);
            this.BillDate = Convert.ToDateTime(reader["BillDate"]);
            this.Cashier = Convert.ToString(reader["UserName"]);
            this.BasicAmount = Convert.ToDecimal(reader["BasicAmt"]);
            this.VAT = Convert.ToDecimal(reader["VAT"]);
            this.STax = Convert.ToDecimal(reader["Stax"]);
            this.RoundOff = Convert.ToDecimal(reader["RoundOff"]);
            this.BillAmount = Convert.ToDecimal(reader["Total"]);
        }

        public void LoadCashierLog(SqlDataReader reader)
        {
            this.MachineName = Convert.ToString(reader[""]);
            this.CashierID = Convert.ToInt32(reader[""]);
            this.Cashier = Convert.ToString(reader[""]);
            this.LoginTime = Convert.ToDateTime(reader[""]);
            this.LogoutTime = Convert.ToDateTime(reader[""]);
            this.LoginBalance = Convert.ToDecimal(reader[""]);
            this.LogoutBalance = Convert.ToDecimal(reader[""]);
        }

        public void LoadCashierWiseSale(SqlDataReader reader)
        {
            this.BillDate = Convert.ToDateTime(reader["billdate"]);
            this.BillAmoutCash = Convert.ToDecimal(reader["BAMT"]);
            this.BillAmoutCreditCard = Convert.ToDecimal(reader["CAMT"]);
            this.RefundAmoutCash = Convert.ToDecimal(reader["RAMT"]);
            this.RefundAmoutCreditCard = Convert.ToDecimal(reader["CRAMT"]);
            this.Cashier = Convert.ToString(reader["UserName"]);
            this.NetAmountCash = this.BillAmoutCash - this.RefundAmoutCash;
            this.NetAmountCreditCard = this.BillAmoutCreditCard - this.RefundAmoutCreditCard;
        }

        public void LoadItemWiseSale(SqlDataReader reader)
        {
            this.CounterId = Convert.ToInt32(reader["fk_MainItemGroupID"]);
            this.CounterName = Convert.ToString(reader["Descr"]);
            this.ItemGroupName = Convert.ToString(reader["descr1"]);
            this.ItemId = Convert.ToInt32(reader["fk_itemID"]);
            this.ItemName = Convert.ToString(reader["ItemDescr"]);
            this.Quantity = Convert.ToInt32(reader["TQTY"]);
            this.BasicAmount = Convert.ToDecimal(reader["TBASIC"]);
            this.VAT = Convert.ToDecimal(reader["TVAT"]);
            this.STax = Convert.ToDecimal(reader["TSTAX"]);
            this.BillAmount = Convert.ToDecimal(reader["TTotal"]);
        }

        public void LoadCounterWiseSaleSummary(SqlDataReader reader)
        {
            this.CounterId = Convert.ToInt32(reader["fk_MainItemGroupID"]);
            this.CounterName = Convert.ToString(reader["Descr"]);
            this.ItemGroupName = Convert.ToString(reader["descr1"]);
            this.ItemId = Convert.ToInt32(reader["fk_itemID"]);
            this.ItemName = Convert.ToString(reader["ItemDescr"]);
            this.Quantity = Convert.ToInt32(reader["TQTY"]);
            this.BasicAmount = Convert.ToDecimal(reader["TBASIC"]);
            this.VAT = Convert.ToDecimal(reader["TVAT"]);
            this.STax = Convert.ToDecimal(reader["TSTAX"]);
            this.BillAmount = Convert.ToDecimal(reader["TTotal"]);
        }

        public void LoadSalesRegister(SqlDataReader reader)
        {
            this.BillNo = Convert.ToInt32(reader["billno"]);
            this.BillDate = Convert.ToDateTime(reader["billdate"]);
            this.CounterName = Convert.ToString(reader["Descr"]);
            this.ItemName = Convert.ToString(reader["itemDescr"]);
            this.Quantity = Convert.ToInt32(reader["Qty"]);
            this.BasicAmount = Convert.ToDecimal(reader["BasicAmt"]);
            this.VAT = Convert.ToDecimal(reader["VATAmount"]);
            this.BillAmount = Convert.ToDecimal(reader["TotalAmount"]);
            this.RefundReason = Convert.ToString(reader["Reason"]);
        }

        public void LoadStockLedger(SqlDataReader reader)
        {
            this.CounterName = Convert.ToString(reader["Descr"]);
            this.ItemGroupName = Convert.ToString(reader["descr1"]);
            this.ItemId = Convert.ToInt32(reader["pk_itemID"]);
            this.ItemName = Convert.ToString(reader["ItemDescr"]);
            this.OpeningBalance = Convert.ToInt32(reader["TQTY"]);
            this.QuantityReceipt = Convert.ToInt32(reader["TQTY"]);
            this.QuantityAdjusted = Convert.ToInt32(reader["TQTY"]);
            this.QuantityRejected = Convert.ToInt32(reader["TQTY"]);
            this.QuantitySold = Convert.ToInt32(reader["TQTY"]);
            this.ClosingBalance = Convert.ToInt32(reader["TQTY"]);
        }

        public void LoadItemWiseVat(SqlDataReader reader)
        {

        }

        public void LoadRestaurantWiseVat(SqlDataReader reader)
        {

        }

        #endregion
    }
}
