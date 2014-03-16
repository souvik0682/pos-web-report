using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Common
{
    public interface IUser : IBase<int>, ICommon
    {
        string Password { get; set; }
        string NewPassword { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string UserFullName { get; }
        IRole UserRole { get; set; }
        string EmailId { get; set; }
        bool IsActive { get; set; }
    }
}
