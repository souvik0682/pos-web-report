using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using System.Data.SqlClient;
using System.Data.Common;

namespace POSWebRpt.Entity
{
    public class RoleEntity : IRole
    {
        #region IRole Members

        public bool? RoleStatus
        {
            get;
            set;
        }

        public bool Active
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

        public RoleEntity()
        {

        }

        public RoleEntity(DbDataReader reader)
        {
            this.Id = Convert.ToInt32(reader["RoleId"]);
            this.Name = Convert.ToString(reader["RoleName"]);

            if (reader["RoleStatus"] != DBNull.Value)
                this.RoleStatus = Convert.ToBoolean(reader["RoleStatus"]);

            this.Active = Convert.ToBoolean(reader["Active"]);
        }

        #endregion
    }

}
