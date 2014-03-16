using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Utilities;

namespace POSWebRpt.Common
{
    public interface IActionResult
    {
        ResultType Result { get; set; }
        bool HasMessage { get; }
        string Message { get; set; }
    }
}
