using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using POSWebRpt.Common;
using POSWebRpt.DAL.DBManager;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ResourceManager;

namespace POSWebRpt.DAL
{
    public class UserDAL : DataServiceBase
    {
        #region User

        public static int ChangePassword(IUser user)
        {
            int result = 0;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspChangePassword]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", user.Id);
                helper.Parameters.Add("@OldPwd", user.Password);
                helper.Parameters.Add("@NewPwd", user.NewPassword);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static void ValidateUser(IUser user)
        {
            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspValidateUser]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserName", user.Name);
                helper.Parameters.Add("@Password", user.Password);

                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    user.Id = Convert.ToInt32(helper.DataReader["UserId"]);
                    user.FirstName = Convert.ToString(helper.DataReader["FirstName"]);
                    user.LastName = Convert.ToString(helper.DataReader["LastName"]);
                    user.UserRole.Id = Convert.ToInt32(helper.DataReader["RoleId"]);
                    user.EmailId = Convert.ToString(helper.DataReader["emailID"]);
                }

                helper.Close();
            }
        }

        public static List<IUser> GetUserList(bool isActiveOnly, SearchCriteria searchCriteria)
        {
            List<IUser> lstUser = new List<IUser>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetUser]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@IsActiveOnly", isActiveOnly);
                helper.Parameters.Add("@SchUserName", searchCriteria.UserName);
                helper.Parameters.Add("@SchFirstName", searchCriteria.FirstName);
                helper.Parameters.Add("@SortExpression", searchCriteria.SortExpression);
                helper.Parameters.Add("@SortDirection", searchCriteria.SortDirection);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    IUser user = new UserEntity(helper.DataReader);
                    lstUser.Add(user);
                }

                helper.Close();
            }

            return lstUser;
        }

        public static IUser GetUser(int userId, bool isActiveOnly, SearchCriteria searchCriteria)
        {
            IUser user = null;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetUser]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", userId);
                helper.Parameters.Add("@IsActiveOnly", isActiveOnly);
                helper.Parameters.Add("@SortExpression", searchCriteria.SortExpression);
                helper.Parameters.Add("@SortDirection", searchCriteria.SortDirection);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    user = new UserEntity(helper.DataReader);
                }

                helper.Close();
            }

            return user;
        }

        public static int SaveUser(IUser user, int modifiedBy)
        {
            int result = 0;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspSaveUser]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", user.Id);
                helper.Parameters.Add("@UserName", user.Name);
                helper.Parameters.Add("@Pwd", user.Password);
                helper.Parameters.Add("@FirstName", user.FirstName);
                helper.Parameters.Add("@LastName", user.LastName);
                helper.Parameters.Add("@RoleId", user.UserRole.Id);
                helper.Parameters.Add("@EmailId", user.EmailId);
                helper.Parameters.Add("@IsActive", user.IsActive);
                helper.Parameters.Add("@ModifiedBy", modifiedBy);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static int DeleteUser(int userId, int modifiedBy)
        {
            int result = 0;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspDeleteUser]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", userId);
                helper.Parameters.Add("@ModifiedBy", modifiedBy);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static int ResetPassword(IUser user, int modifiedBy)
        {
            int result = 0;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspResetPassword]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", user.Id);
                helper.Parameters.Add("@Pwd", user.Password);
                helper.Parameters.Add("@ModifiedBy", modifiedBy);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static DataSet GetAdminUsers(int LoggedUserId)
        {
            DataSet ds = new DataSet();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetAdminUsers]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@LoggedUserId", LoggedUserId);
                helper.Open();
                ds = helper.ExecuteDataSet();
                helper.Close();
            }

            return ds;
        }

        public static DataSet GetUserById(int userId)
        {
            DataSet ds = new DataSet();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetUserById]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", userId);
                helper.Open();
                ds = helper.ExecuteDataSet();
                helper.Close();
            }

            return ds;
        }

        #endregion

        #region Role

        public static List<IRole> GetRole(bool isActiveOnly, SearchCriteria searchCriteria)
        {
            List<IRole> lstRole = new List<IRole>();

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetRole]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@IsActiveOnly", isActiveOnly);
                helper.Parameters.Add("@SchRole", searchCriteria.RoleName);
                helper.Parameters.Add("@SortExpression", searchCriteria.SortExpression);
                helper.Parameters.Add("@SortDirection", searchCriteria.SortDirection);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    IRole role = new RoleEntity(helper.DataReader);
                    lstRole.Add(role);
                }

                helper.Close();
            }

            return lstRole;
        }

        public static IRole GetRole(int roleId, bool isActiveOnly, SearchCriteria searchCriteria)
        {
            IRole role = null;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetRole]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@RoleId", roleId);
                helper.Parameters.Add("@IsActiveOnly", isActiveOnly);
                helper.Parameters.Add("@SortExpression", searchCriteria.SortExpression);
                helper.Parameters.Add("@SortDirection", searchCriteria.SortDirection);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    role = new RoleEntity(helper.DataReader);
                }

                helper.Close();
            }

            return role;
        }

        public static int SaveRole(IRole role, string xmlDoc, int modifiedBy)
        {
            int result = 0;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspSaveRole]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@RoleID", role.Id);
                helper.Parameters.Add("@RoleName", role.Name);
                helper.Parameters.Add("@XMLDoc", xmlDoc);
                helper.Parameters.Add("@ModifiedBy", modifiedBy);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static int DeleteRole(int roleId, int modifiedBy)
        {
            int result = 0;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspDeleteRole]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@RoleId", roleId);
                helper.Parameters.Add("@ModifiedBy", modifiedBy);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static int ChangeRoleStatus(int roleId, bool status, int modifiedBy)
        {
            int result = 0;
            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspChangeRoleStatus]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@RoleId", roleId);
                helper.Parameters.Add("@RoleStatus", status);
                helper.Parameters.Add("@ModifiedBy", modifiedBy);
                helper.Open();
                result = helper.ExecuteNonQuery();
                helper.Close();
            }

            return result;
        }

        public static List<IRoleMenu> GetMenuByRole(int roleId, int mainId)
        {
            List<IRoleMenu> lstMenu = new List<IRoleMenu>();
            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetMenuByRole]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@RoleId", roleId);
                helper.Parameters.Add("@MainId", mainId);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    IRoleMenu menu = new RoleMenuEntity(helper.DataReader);
                    lstMenu.Add(menu);
                }

                helper.Close();
            }

            return lstMenu;
        }

        public static IRoleMenu GetMenuAccessByUser(int userId, int menuId)
        {
            IRoleMenu roleMenu = null;

            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetMenuAccessByUser]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", userId);
                helper.Parameters.Add("@MenuId", menuId);
                helper.Open();
                helper.ExecuteReader(CommandBehavior.CloseConnection);

                while (helper.DataReader.Read())
                {
                    roleMenu = new RoleMenuEntity(helper.DataReader);
                }

                helper.Close();
            }

            return roleMenu;
        }


        public static DataTable GetUserSpecificMenuList(int UserID)
        {
            DataSet ds = new DataSet();
            using (SqlDataHelper helper = new SqlDataHelper(ConnectionString))
            {
                helper.CommandText = "[webadmin].[uspGetUserSpecificMenuList]";
                helper.CommandType = CommandType.StoredProcedure;
                helper.Parameters.Add("@UserId", UserID);
                helper.Open();
                ds = helper.ExecuteDataSet();
                helper.Close();
            }

            return ds.Tables[0];
        }

        #endregion

    }
}
