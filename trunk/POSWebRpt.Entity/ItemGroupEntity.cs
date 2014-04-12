using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using System.Data.SqlClient;

namespace POSWebRpt.Entity
{
    public class ItemGroupEntity : IItemGroup
    {
        #region IItemGroup Members

        public int RefGroupId
        {
            get;
            set;
        }

        public string RefDesc
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

        public ItemGroupEntity()
        {

        }

        public ItemGroupEntity(SqlDataReader reader)
        {
            this.Id = Convert.ToInt32(reader["ITEMGROUPID"]);
            this.Name = Convert.ToString(reader["DESCR"]);
            this.RefGroupId = Convert.ToInt32(reader["REFGROUPID"]);
            this.RefDesc = Convert.ToString(reader["REFDESC"]);
        }

        #endregion
    }

}
