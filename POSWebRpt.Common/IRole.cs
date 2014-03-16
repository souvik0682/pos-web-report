using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Common
{
    public interface IRole : IBase<int>
    {
        bool? RoleStatus { get; set; }
        bool Active { get; set; }
    }
}
