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
        public String BillNo { get; set; }
        public DateTime BillDate { get; set; }
        public Int32 CashierID { get; set; }
        public String Cashier { get; set; }
        public String ItemCode { get; set; }
        public String ItemName { get; set; }
        public Decimal BasicAmount { get; set; }
        public Int32 Quantity { get; set; }
        public Decimal VAT { get; set; }
        public Decimal STax { get; set; }
        public Decimal RoundOff { get; set; }
        public Decimal BillAmount { get; set; }
        public Decimal BillAmoutCash { get; set; }
        public Decimal BillAmoutCreditCard { get; set; }
        public Decimal NetAmount { get; set; }
        public Decimal NetAmountCash { get; set; }
        public Decimal NetAmountCreditCard { get; set; }
        public Decimal RefundAmoutCash { get; set; }
        public Decimal RefundAmoutCreditCard { get; set; }
        public String RefundReason { get; set; }

        public String CounterName { get; set; }
        public String MachineName { get; set; }
        public DateTime LoginTime { get; set; }
        public DateTime LogoutTime { get; set; }
        public Decimal LoginBalance { get; set; }
        public Decimal LogutoutBalance { get; set; }

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
            this.BillNo = Convert.ToString(reader["BillNo"]);
            this.BillDate = Convert.ToDateTime(reader["BillDate"]);
            this.Cashier = Convert.ToString(reader["UserName"]);
            this.BasicAmount = Convert.ToDecimal(reader["BasicAmt"]);
            this.VAT = Convert.ToDecimal(reader["VAT"]);
            this.STax = Convert.ToDecimal(reader["Stax"]);
            //this.RoundOff = Convert.ToDecimal(reader["RoundOff"]);
            this.BillAmount = Convert.ToDecimal(reader["Total"]);
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

        public void LoadSalesRegister(SqlDataReader reader)
        {
            this.BillNo = Convert.ToString(reader["billno"]);
            this.BillDate = Convert.ToDateTime(reader["billdate"]);
            this.CounterName = Convert.ToString(reader["Counter"]);
            this.ItemName = Convert.ToString(reader["itemDescr"]);
            this.Quantity = Convert.ToInt32(reader["Qty"]);
            this.BasicAmount = Convert.ToDecimal(reader["BasicAmt"]);
            this.VAT = Convert.ToDecimal(reader["VATAmount"]);
            this.BillAmount = Convert.ToDecimal(reader["TotalAmount"]);
            this.RefundReason = Convert.ToString(reader["Reason"]);
        }

        #endregion
    }
}
