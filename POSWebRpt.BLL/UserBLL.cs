using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using POSWebRpt.BLL.Settings;
using POSWebRpt.DAL;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ResourceManager;
using POSWebRpt.Common;
using POSWebRpt.Utilities.Cryptography;
namespace POSWebRpt.BLL
{
    public class UserBLL
    {
        #region Common

        public static bool ValidateImageFile(string fileName, out string message)
        {
            bool isValid = false;
            message = string.Empty;
            string ext = GeneralFunctions.GetFileExtension(fileName);

            if (!string.IsNullOrEmpty(fileName))
            {
                if (ext.ToUpper() == "JPG" || ext.ToUpper() == "JPEG" || ext.ToUpper() == "BMP" || ext.ToUpper() == "PNG" || ext.ToUpper() == "GIF" || ext.ToUpper() == "TIF")
                {
                    isValid = true;
                }
                else
                {
                    message = ResourceManager.GetStringWithoutName("R00059");
                }
            }
            else
            {
                isValid = true;
            }

            return isValid;
        }

        #endregion

        #region User

        public static string GetDefaultPassword()
        {
            return Encryption.Encrypt(Constants.DEFAULT_PASSWORD);
        }

        public static bool ValidateUser(IUser user)
        {
            UserDAL.ValidateUser(user);
            return (user.Id > 0) ? true : false;
        }

        public static int GetLoggedInUserId()
        {
            int userId = 0;

            if (!ReferenceEquals(System.Web.HttpContext.Current.Session[Constants.SESSION_USER_INFO], null))
            {
                IUser user = (IUser)System.Web.HttpContext.Current.Session[Constants.SESSION_USER_INFO];

                if (!ReferenceEquals(user, null))
                {
                    userId = user.Id;
                }
            }

            return userId;
        }

        public static int GetLoggedInUserRoleId()
        {
            int roleId = 0;

            if (!ReferenceEquals(System.Web.HttpContext.Current.Session[Constants.SESSION_USER_INFO], null))
            {
                IUser user = (IUser)System.Web.HttpContext.Current.Session[Constants.SESSION_USER_INFO];

                if (!ReferenceEquals(user, null) && user.Id > 0)
                {
                    if (!ReferenceEquals(user.UserRole, null))
                    {
                        roleId = user.UserRole.Id;
                    }
                }
            }

            return roleId;
        }

        private static void SetDefaultSearchCriteriaForUser(SearchCriteria searchCriteria)
        {
            searchCriteria.SortExpression = "UserName";
            searchCriteria.SortDirection = "ASC";
        }

        public static List<IUser> GetAllUserList(SearchCriteria searchCriteria)
        {
            return UserDAL.GetUserList(false, searchCriteria);
        }

        public static List<IUser> GetActiveUserList()
        {
            SearchCriteria searchCriteria = new SearchCriteria();
            SetDefaultSearchCriteriaForUser(searchCriteria);
            return UserDAL.GetUserList(true, searchCriteria);
        }

        public static IUser GetUser(int userId)
        {
            SearchCriteria searchCriteria = new SearchCriteria();
            SetDefaultSearchCriteriaForUser(searchCriteria);
            return UserDAL.GetUser(userId, false, searchCriteria);
        }

        public static DataSet GetUserById(int userId)
        {
            return UserDAL.GetUserById(userId);
        }

        public static IActionResult SaveUser(IUser user, int modifiedBy)
        {
            string message = string.Empty;
            int result = UserDAL.SaveUser(user, modifiedBy);
            IActionResult actionResult = new ActionResult(result);

            if (result == -3) //Duplicate record exists
                message = ResourceManager.GetStringWithoutName("R00039");
            else if (result == -1) //Transaction error
                message = ResourceManager.GetStringWithoutName("R00020");
            else if (result == 0) //No records saved
                message = ResourceManager.GetStringWithoutName("R00016");
            else if (result > 0) //Successfully saved
                message = ResourceManager.GetStringWithoutName("R00014");

            actionResult.Message = message;
            return actionResult;
        }

        public static IActionResult DeleteUser(int userId, int modifiedBy)
        {
            string message = string.Empty;
            int result = UserDAL.DeleteUser(userId, modifiedBy);
            IActionResult actionResult = new ActionResult(result);

            if (result == 0) //No records deleted
                message = ResourceManager.GetStringWithoutName("R00017");
            else if (result > 0) //Successfully deleted
                message = ResourceManager.GetStringWithoutName("R00015");
            else if (result == -1) //Transaction error
                message = ResourceManager.GetStringWithoutName("R00020");
            else //Transaction data exists
                message = ResourceManager.GetStringWithoutName("R00019");

            actionResult.Message = message;
            return actionResult;
        }

        public static IActionResult ChangePassword(IUser user)
        {
            string message = string.Empty;
            int result = UserDAL.ChangePassword(user);
            IActionResult actionResult = new ActionResult(result);

            if (result == 0) //No records saved
                message = ResourceManager.GetStringWithoutName("R00016");
            else if (result > 0) //Successfully saved
                message = ResourceManager.GetStringWithoutName("R00014");

            actionResult.Message = message;
            return actionResult;
        }

        public static IActionResult ResetPassword(IUser user, int modifiedBy)
        {
            user.Password = GetDefaultPassword();

            string message = string.Empty;
            int result = UserDAL.ResetPassword(user, modifiedBy);
            IActionResult actionResult = new ActionResult(result);

            if (result == 0) //No records saved
                message = ResourceManager.GetStringWithoutName("R00041");
            else if (result > 0) //Successfully saved
                message = ResourceManager.GetStringWithoutName("R00040");

            actionResult.Message = message;
            return actionResult;
        }

        public static DataSet GetAdminUsers(int LoggedUserId)
        {
            return UserDAL.GetAdminUsers(LoggedUserId);
        }

        #endregion

        #region Role

        private static void SetDefaultSearchCriteriaForRole(SearchCriteria searchCriteria)
        {
            searchCriteria.SortExpression = "Role";
            searchCriteria.SortDirection = "ASC";
        }

        public static void GetUserPermission(out bool canAdd, out bool canEdit, out bool canDelete, out bool canView)
        {
            canAdd = false;
            canEdit = false;
            canDelete = false;
            canView = false;

            if (!ReferenceEquals(System.Web.HttpContext.Current.Session[Constants.SESSION_USER_PERMISSION], null))
            {
                IUserPermission userPermission = (IUserPermission)System.Web.HttpContext.Current.Session[Constants.SESSION_USER_PERMISSION];

                if (!ReferenceEquals(userPermission, null))
                {
                    canAdd = userPermission.CanAdd;
                    canEdit = userPermission.CanEdit;
                    canDelete = userPermission.CanDelete;
                    canView = userPermission.CanView;
                }
            }
        }

        public List<IRole> GetAllRole(SearchCriteria searchCriteria)
        {
            return UserDAL.GetRole(false, searchCriteria);
        }

        public static List<IRole> GetActiveRole()
        {
            SearchCriteria searchCriteria = new SearchCriteria();
            SetDefaultSearchCriteriaForRole(searchCriteria);
            return UserDAL.GetRole(true, searchCriteria);
        }

        public static IRole GetRole(int roleId)
        {
            SearchCriteria searchCriteria = new SearchCriteria();
            SetDefaultSearchCriteriaForRole(searchCriteria);
            return UserDAL.GetRole(roleId, false, searchCriteria);
        }

        public static IActionResult SaveRole(List<RoleMenuEntity> lstRoleMenu, IRole role, int modifiedBy)
        {
            string message = string.Empty;
            string xmlDoc = GeneralFunctions.Serialize(lstRoleMenu);
            int result = UserDAL.SaveRole(role, xmlDoc, modifiedBy);
            IActionResult actionResult = new ActionResult(result);

            if (result == -3) //Duplicate record exists
                message = ResourceManager.GetStringWithoutName("R00018");
            else if (result == -1) //Transaction error
                message = ResourceManager.GetStringWithoutName("R00020");
            else if (result == 0) //No records saved
                message = ResourceManager.GetStringWithoutName("R00016");
            else if (result > 0) //Successfully saved
                message = ResourceManager.GetStringWithoutName("R00014");

            actionResult.Message = message;
            return actionResult;
        }

        public static IActionResult DeleteRole(int roleId, int modifiedBy)
        {
            string message = string.Empty;
            int result = UserDAL.DeleteRole(roleId, modifiedBy);
            IActionResult actionResult = new ActionResult(result);

            if (result == 0) //No records deleted
                message = ResourceManager.GetStringWithoutName("R00017");
            else if (result > 0) //Successfully deleted
                message = ResourceManager.GetStringWithoutName("R00015");
            else if (result == -1) //Transaction error
                message = ResourceManager.GetStringWithoutName("R00020");
            else //Transaction data exists
                message = ResourceManager.GetStringWithoutName("R00019");

            actionResult.Message = message;
            return actionResult;
        }

        public static IActionResult ChangeRoleStatus(int roleId, bool status, int modifiedBy)
        {
            string message = string.Empty;
            int result = UserDAL.ChangeRoleStatus(roleId, status, modifiedBy);
            IActionResult actionResult = new ActionResult(result);

            if (result == 0) //No records saved
                message = ResourceManager.GetStringWithoutName("R00016");
            else if (result > 0) //Successfully saved
                message = ResourceManager.GetStringWithoutName("R00014");

            actionResult.Message = message;
            return actionResult;
        }

        public static List<IRoleMenu> GetMenuByRole(int roleId, int mainId)
        {
            return UserDAL.GetMenuByRole(roleId, mainId);
        }

        public static IUserPermission GetMenuAccessByUser(int userId, int menuId)
        {
            IUserPermission userPermission = new UserPermissionEntity();

            IRoleMenu roleMenuAccess = UserDAL.GetMenuAccessByUser(userId, menuId);

            if (!ReferenceEquals(roleMenuAccess, null))
            {
                userPermission.CanAdd = roleMenuAccess.CanAdd;
                userPermission.CanEdit = roleMenuAccess.CanEdit;
                userPermission.CanDelete = roleMenuAccess.CanDelete;
                userPermission.CanView = roleMenuAccess.CanView;
            }

            return userPermission;
        }

        //public static void GetUserPermission(out bool canAdd, out bool canEdit, out bool canDelete, out bool canView)
        //{
        //    canAdd = false;
        //    canEdit = false;
        //    canDelete = false;
        //    canView = false;

        //    if (!ReferenceEquals(System.Web.HttpContext.Current.Session[Constants.SESSION_USER_PERMISSION], null))
        //    {
        //        IUserPermission userPermission = (IUserPermission)System.Web.HttpContext.Current.Session[Constants.SESSION_USER_PERMISSION];

        //        if (!ReferenceEquals(userPermission, null))
        //        {
        //            canAdd = userPermission.CanAdd;
        //            canEdit = userPermission.CanEdit;
        //            canDelete = userPermission.CanDelete;
        //            canView = userPermission.CanView;
        //        }
        //    }
        //}

        public static DataTable GetUserSpecificMenuList(int UserID)
        {
            return UserDAL.GetUserSpecificMenuList(UserID);
        }

        #endregion

    }
}
