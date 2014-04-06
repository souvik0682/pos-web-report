using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.DAL.DBManager;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;

namespace POSWebRpt.DAL
{
    /// <summary>
    /// Represents Data Access Layer for common Module.
    /// This class is inherited from the <see cref="REC.DAL.DBManager.DataServiceBase"/> class.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>11/06/2012</createddate>
    public class CommonDAL : DataServiceBase
    {
        #region Common

        /// <summary>
        /// Saves the error log.
        /// </summary>
        /// <param name="userId">The user id.</param>
        /// <param name="message">The message.</param>
        /// <param name="stackTrace">The stack trace.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        public static void SaveErrorLog(int userId, string message, string stackTrace)
        {
            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.Open();
                helper.CommandText = "[webadmin].[uspSaveError]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", userId);
                helper.Parameters.Add("@ErrorMessage", message);
                helper.Parameters.Add("@StackTrace", stackTrace);
                helper.ExecuteNonQuery();
                helper.Close();
            }
        }

        #endregion
    }
}
