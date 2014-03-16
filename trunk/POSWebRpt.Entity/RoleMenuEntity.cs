using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using System.Data.SqlClient;

namespace POSWebRpt.Entity
{
    public class RoleMenuEntity : IRoleMenu
    {
        #region IRoleMenu Members

        public int MenuAccessID
        {
            get;
            set;
        }

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

        #region IMenu Members

        public int MenuID
        {
            get;
            set;
        }

        public int MainID
        {
            get;
            set;
        }

        public int SubID
        {
            get;
            set;
        }

        public int SubSubID
        {
            get;
            set;
        }

        public string MenuName
        {
            get;
            set;
        }

        #endregion

        #region IBase<int> Members

        public int Id
        {
            get;
            set;
        }

        public string Name
        {
            get;
            set;
        }

        #endregion

        #region Constructors

        public RoleMenuEntity()
        {

        }

        public RoleMenuEntity(SqlDataReader reader)
        {
            this.MenuAccessID = Convert.ToInt32(reader["MenuAccessID"]);
            this.Id = Convert.ToInt32(reader["RoleID"]);
            this.MenuID = Convert.ToInt32(reader["MenuID"]);
            this.CanAdd = Convert.ToBoolean(reader["CanAdd"]);
            this.CanEdit = Convert.ToBoolean(reader["CanEdit"]);
            this.CanDelete = Convert.ToBoolean(reader["CanDelete"]);
            this.CanView = Convert.ToBoolean(reader["CanView"]);
            this.MenuName = Convert.ToString(reader["MenuName"]);
        }

        #endregion
    }
}
