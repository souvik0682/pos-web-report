using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Utilities;

namespace POSWebRpt.Common
{
    public interface ISearchCriteria
    {
        PageName CurrentPage { get; set; }
        IList<string> StringParams { get; set; }
        int PageIndex { get; set; }
        int PageSize { get; set; }
        string SortExpression { get; set; }
        string SortDirection { get; set; }
    }
}
