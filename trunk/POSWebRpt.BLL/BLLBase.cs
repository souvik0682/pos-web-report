using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.BLL
{
    /// <summary>
    /// Acts as a base class for all Business Logic Layer classes.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createdate>21/08/2010</createdate>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>21/08/2010</createddate>
    public class BLLBase
    {
        #region Public Static Properties

        /// <summary>
        /// Gets or sets the name of the log file.
        /// </summary>
        /// <value>The name of the log file.</value>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>21/08/2010</createddate>
        public static string LogFileName
        {
            get;
            set;
        }

        #endregion
    }
}
