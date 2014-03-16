using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using POSWebRpt.Utilities;

namespace POSWebRpt.Entity
{
    public class ActionResult : IActionResult
    {
        public ActionResult(int result)
        {
            if (result == 0)
                this.Result = ResultType.RecordNotAffected;
            else if (result > 0)
                this.Result = ResultType.Success;
            else
                this.Result = ResultType.Failure;
        }

        public ResultType Result { get; set; }
        public bool HasMessage
        {
            get
            {
                return (this.Message != string.Empty) ? true : false;
            }
        }

        public string Message { get; set; }
    }
}
