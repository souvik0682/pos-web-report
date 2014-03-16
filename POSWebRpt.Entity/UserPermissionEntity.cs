using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Common;

namespace POSWebRpt.Entity
{
    public class UserPermissionEntity : IUserPermission
    {
        #region IUserPermission Members

        public bool CanAdd
        {
            get;
            set;
        }

        public bool CanEdit
        {
            get;
            set;
        }

        public bool CanDelete
        {
            get;
            set;
        }

        public bool CanView
        {
            get;
            set;
        }

        #endregion

        #region Constructors

        #endregion
    }
}
