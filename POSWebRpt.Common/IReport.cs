using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Common
{
    public interface IReport
    {
        String BillType { get; set; }
        String BillNo { get; set; }
        DateTime BillDate { get; set; }
        String Cashier { get; set; }
        String ItemCode { get; set; }
        String ItemName { get; set; }
        Decimal BasicAmount { get; set; }
        Int32 Quantity { get; set; }
        Decimal VAT { get; set; }
        Decimal RoundOff { get; set; }
        Decimal BillAmount { get; set; }
        Decimal BillAmoutCash { get; set; }
        Decimal BillAmoutCreditCard { get; set; }
        Decimal RefundAmoutCash { get; set; }
        Decimal RefundAmoutCreditCard { get; set; }
        String RefundReason { get; set; }
        String CounterName { get; set; }
        String MachineName { get; set; }
        DateTime LoginTime { get; set; }
        DateTime LogoutTime { get; set; }
        Decimal LoginBalance { get; set; }
        Decimal LogutoutBalance { get; set; }

        Decimal OpeningBalance { get; set; }
        Decimal QuantityReceipt { get; set; }
        Decimal QuantityAdjusted { get; set; }
        Decimal QuantityRejected { get; set; }
        Decimal QuantitySold { get; set; }
        Decimal ClosingBalance { get; set; }
    }
}
