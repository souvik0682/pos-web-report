using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using POSWebRpt.Entity;
using Utilities.DbManager;
using POSWebRpt.DAL.DBManager;

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

        public static List<IItemGroup> GetItemGroup(char mode,int lvl ,Int64 userId)
        {
            List<IItemGroup> lstGroup = new List<IItemGroup>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[dbo].[sp_Manage_ITEMGROUP]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@Mode", mode);
                helper.Parameters.Add("@UserID", userId);
                helper.Parameters.Add("@Lvl", lvl);
                helper.Parameters.Add("@Result", SqlDbType.Int, ParameterDirection.Output);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    IItemGroup group = new ItemGroupEntity(helper.DataReader);
                    lstGroup.Add(group);
                }

                helper.Close();
            }

            return lstGroup;
        }
    }
}
