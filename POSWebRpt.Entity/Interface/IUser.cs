using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Entity.Interface
{
    /// <summary>
    /// Specifies the basic contract for base entity.
    /// </summary>
    /// <typeparam name="T">The type of identifier.</typeparam>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public interface IUser
    {
        /// <summary>
        /// Gets or sets the identifier.
        /// </summary>
        /// <value>
        /// The identifier.
        /// </value>
        int UserId { get; set; }


        /// <summary>
        /// Gets or sets the description.
        /// </summary>
        /// <value>
        /// The description.
        /// </value>
        string UserName { get; set; }

        string FirstName { get; set; }

        string MiddleName { get; set; }

        string LastName { get; set; }

        string FullName { get; }

        string EmailId { get; set; }

        string Designation { get; set; }
    }
}
