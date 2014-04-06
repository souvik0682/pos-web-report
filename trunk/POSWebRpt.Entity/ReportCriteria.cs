using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Utilities;

namespace POSWebRpt.Entity
{
    [Serializable]
    public class ReportCriteria
    {
        #region Public Properties

        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public int CashierId { get; set; }
        public int TransactionTypeId { get; set; }
        public int CounterId { get; set; }

        #endregion

        #region Constructor

        #endregion

        #region Public Methods

        public void Clear()
        {

        }

        #endregion
    }
}
