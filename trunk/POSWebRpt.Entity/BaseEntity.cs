using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POSWebRpt.Entity.Interface;

namespace POSWebRpt.Entity
{
    /// <summary>
    /// Represents a base class for common entities.
    /// </summary>
    /// <typeparam name="T">The type of identifier.</typeparam>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public class BaseEntity<T> : IEntityBase<T>
    {
        #region IEntityBase<T> Members

        /// <summary>
        /// Gets or sets the identifier.
        /// </summary>
        /// <value>
        /// The identifier.
        /// </value>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>18/06/2013</createddate>
        public T Id
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the description.
        /// </summary>
        /// <value>
        /// The description.
        /// </value>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>18/06/2013</createddate>
        public string Desc
        {
            get;
            set;
        }

        #endregion


    }
}
