using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Common
{
    public interface IReport
    {
        String BillType { get; set; }
        Int32 BillNo { get; set; }
        DateTime BillDate { get; set; }
        Int32 CashierID { get; set; }
        String Cashier { get; set; }
        Int32 ItemGroupId { get; set; }
        String ItemGroupName { get; set; }
        Int32 ItemId { get; set; }
        String ItemName { get; set; }
        Decimal BasicAmount { get; set; }
        Int32 Quantity { get; set; }
        Decimal VAT { get; set; }
        Decimal STax { get; set; }
        Decimal RoundOff { get; set; }
        Decimal BillAmount { get; set; }
        Decimal BillAmoutCash { get; set; }
        Decimal BillAmoutCreditCard { get; set; }
        Decimal RefundAmoutCash { get; set; }
        Decimal RefundAmoutCreditCard { get; set; }
        Decimal NetAmount { get; set; }
        Decimal NetAmountCash { get; set; }
        Decimal NetAmountCreditCard { get; set; }
        String RefundReason { get; set; }
        Int32 CounterId { get; set; }
        String CounterName { get; set; }
        String MachineName { get; set; }
        DateTime LoginTime { get; set; }
        DateTime LogoutTime { get; set; }
        Decimal LoginBalance { get; set; }
        Decimal LogoutBalance { get; set; }
        Decimal OpeningBalance { get; set; }
        Decimal QuantityReceipt { get; set; }
        Decimal QuantityAdjusted { get; set; }
        Decimal QuantityRejected { get; set; }
        Decimal QuantitySold { get; set; }
        Decimal ClosingBalance { get; set; }
        Decimal VATPercentage { get; set; }
        Decimal TotalQuantity { get; set; }
        Decimal TotalVAT { get; set; }
        Decimal TotalAmount { get; set; }
    }
}
