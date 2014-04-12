using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Common
{
    public interface IItemGroup : IBase<int>
    {
        int RefGroupId { get; set; }
        string RefDesc { get; set; }
    }
}
