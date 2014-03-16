using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Utilities;

namespace POSWebRpt.Entity
{
    [Serializable]
    public class SearchCriteria
    {
        #region Public Properties

        public PageName CurrentPage { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public string SortExpression { get; set; }
        public string SortDirection { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string RoleName { get; set; }

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
