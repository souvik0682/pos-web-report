using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using POSWebRpt.BLL;
using POSWebRpt.Common;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ResourceManager;

namespace POSWebRpt.Web.Views.Security
{
    public partial class UserEdit : System.Web.UI.Page
    {
        #region Private Member Variables

        private int _userId = 0;
        private int _uId = 0;
        private bool _canAdd = false;
        private bool _canEdit = false;
        private bool _canDelete = false;
        private bool _canView = false;

        #endregion

        #region Protected Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            RetriveParameters();
            CheckUserAccess();
            SetAttributes();

            if (!IsPostBack)
            {
                PopulateRole();
                PopulateLocation();
                LoadData();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveUser();
        }

        #endregion

        #region Private Methods

        private void RetriveParameters()
        {
            _userId = UserBLL.GetLoggedInUserId();

            //Get user permission.
            UserBLL.GetUserPermission(out _canAdd, out _canEdit, out _canDelete, out _canView);

            if (!ReferenceEquals(Request.QueryString["id"], null))
            {
                Int32.TryParse(GeneralFunctions.DecryptQueryString(Request.QueryString["id"].ToString()), out _uId);
            }
        }

        private void SetAttributes()
        {
            spnName.Style["display"] = "none";
            spnFName.Style["display"] = "none";
            spnLName.Style["display"] = "none";
            spnEmail.Style["display"] = "none";
            spnRole.Style["display"] = "none";

            if (!IsPostBack)
            {
                if (_uId == -1) //Add mode
                {
                    if (!_canAdd) btnSave.Visible = false;
                }
                else
                {
                    if (!_canEdit) btnSave.Visible = false;
                }

                btnSave.ToolTip = ResourceManager.GetStringWithoutName("R00060");
                btnBack.ToolTip = ResourceManager.GetStringWithoutName("R00061");
                btnBack.OnClientClick = "javascript:return RedirectAfterCancelClick('UserList.aspx','" + ResourceManager.GetStringWithoutName("R00025") + "')";
                revEmail.ValidationExpression = Constants.EMAIL_REGX_EXP;
                revEmail.ErrorMessage = ResourceManager.GetStringWithoutName("R00051");

                spnName.InnerText = ResourceManager.GetStringWithoutName("R00046");
                spnFName.InnerText = ResourceManager.GetStringWithoutName("R00047");
                spnLName.InnerText = ResourceManager.GetStringWithoutName("R00048");
                spnEmail.InnerText = ResourceManager.GetStringWithoutName("R00049");
                spnRole.InnerText = ResourceManager.GetStringWithoutName("R00050");
            }

            if (_uId == -1)
            {
                chkActive.Checked = true;
                chkActive.Enabled = false;
            }

            if (_uId > 0)
            {
                txtUserName.Enabled = false;
            }
        }

        private void CheckUserAccess()
        {
            if (!ReferenceEquals(Session[Constants.SESSION_USER_INFO], null))
            {
                IUser user = (IUser)Session[Constants.SESSION_USER_INFO];

                if (ReferenceEquals(user, null) || user.Id == 0)
                {
                    Response.Redirect("~/Login.aspx");
                }

                if (user.UserRole.Id != (int)UserRole.Admin)
                {
                    Response.Redirect("~/Unauthorized.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }

            if (_uId == 0)
                Response.Redirect("~/View/ManageUser.aspx");

            if (!_canView)
            {
                Response.Redirect("~/Unauthorized.aspx");
            }
        }

        //private bool IsSalesRole(int roleId)
        //{
        //    bool isSalesRole = false;

        //    if (roleId == (int)UserRole.SalesExecutive)
        //    {
        //        isSalesRole = true;
        //    }
        //    else
        //    {
        //        isSalesRole = false;
        //    }

        //    //IRole role = new CommonBLL().GetRole(roleId);
        //    //bool isSalesRole = false;

        //    //if (!ReferenceEquals(role, null))
        //    //{
        //    //    if (role.SalesRole.HasValue && role.SalesRole.Value == 'Y')
        //    //    {
        //    //        isSalesRole = true;
        //    //    }
        //    //}

        //    return isSalesRole;
        //}

        private void PopulateRole()
        {
            List<IRole> lstRole = UserBLL.GetActiveRole();
            GeneralFunctions.PopulateDropDownList(ddlRole, lstRole, "Id", "Name", true);
        }

        private void PopulateLocation()
        {
            //CommonBLL commonBll = new CommonBLL();
            //List<ILocation> lstLoc = commonBll.GetActiveLocation();
            //GeneralFunctions.PopulateDropDownList(ddlLoc, lstLoc, "Id", "Name", true);
        }

        private void LoadData()
        {
            IUser user = UserBLL.GetUser(_uId);

            if (!ReferenceEquals(user, null))
            {
                txtUserName.Text = user.Name;
                txtFName.Text = user.FirstName;
                txtLName.Text = user.LastName;
                txtEmail.Text = user.EmailId;
                ddlRole.SelectedValue = Convert.ToString(user.UserRole.Id);

                //if (user.AllowMutipleLocation)
                //    ddlMultiLoc.SelectedValue = "1";
                //else
                //    ddlMultiLoc.SelectedValue = "0";

                if (user.IsActive)
                    chkActive.Checked = true;
                else
                    chkActive.Checked = false;

                if (_uId == 1)
                    chkActive.Enabled = false;
            }
        }

        private bool ValidateControls(IUser user)
        {
            bool isValid = true;

            if (user.Name == string.Empty)
            {
                isValid = false;
                spnName.Style["display"] = "";
            }

            if (user.FirstName == string.Empty)
            {
                isValid = false;
                spnFName.Style["display"] = "";
            }

            if (user.LastName == string.Empty)
            {
                isValid = false;
                spnLName.Style["display"] = "";
            }

            if (user.EmailId == string.Empty)
            {
                isValid = false;
                spnEmail.Style["display"] = "";
            }

            if (user.UserRole.Id == 0)
            {
                isValid = false;
                spnRole.Style["display"] = "";
            }
            //else
            //{
            //    if (user.UserRole.LocationSpecific.HasValue && user.UserRole.LocationSpecific.Value)
            //    {
            //        if (user.UserLocation.Id == 0)
            //        {
            //            isValid = false;
            //            spnLoc.Style["display"] = "";
            //        }
            //    }
            //}

            //if (user.UserLocation.Id == 0)
            //{
            //    isValid = false;
            //    spnLoc.Style["display"] = "";
            //}
            //else
            //{
            //    if(user.UserRole.LocationSpecific.Value)
            //        user.UserRole.
            //}

            return isValid;
        }

        private void SaveUser()
        {
            IUser user = new UserEntity();
            BuildUserEntity(user);

            if (ValidateControls(user))
            {
                IActionResult result = UserBLL.SaveUser(user, _userId);

                if (result.HasMessage)
                {
                    if (_uId == -1)
                    {
                        SendEmail(user);
                        Response.Redirect("~/Views/UserList.aspx");
                    }

                    else
                    {
                        GeneralFunctions.RegisterAlertScript(this, result.Message);
                    }
                }
            }
        }

        private void BuildUserEntity(IUser user)
        {
            user.Id = _uId;
            user.Name = txtUserName.Text.Trim().ToUpper();
            user.Password = UserBLL.GetDefaultPassword();
            user.FirstName = txtFName.Text.Trim().ToUpper();
            user.LastName = txtLName.Text.Trim().ToUpper();
            user.EmailId = txtEmail.Text.Trim().ToUpper();
            user.UserRole.Id = Convert.ToInt32(ddlRole.SelectedValue);
            //user.UserLocation.Id = Convert.ToInt32(ddlLoc.SelectedValue);

            //IRole role = UserBLL.GetRole(Convert.ToInt32(ddlRole.SelectedValue));

            //user.UserRole.LocationSpecific = false;

            //if (!ReferenceEquals(role, null))
            //{
            //    if (role.LocationSpecific.HasValue && role.LocationSpecific.Value)
            //    {
            //        user.UserRole.LocationSpecific = true;
            //    }
            //}

            //if (ddlMultiLoc.SelectedValue == "1")
            //    user.AllowMutipleLocation = true;
            //else
            //    user.AllowMutipleLocation = false;

            if (chkActive.Checked)
                user.IsActive = true;
            else
                user.IsActive = false;
        }

        private void SendEmail(IUser user)
        {
            string url = Convert.ToString(ConfigurationManager.AppSettings["ApplicationUrl"]) + "/View/ChangePassword.aspx?id=" + GeneralFunctions.EncryptQueryString(user.Id.ToString());
            string msgBody = "Hello " + user.UserFullName + "<br/>We have received new account creation request for your account " + user.Name + ". <br/>If this request was initiated by you, please click on following link and change your password:<br/><a href='" + url + "'>" + url + "</a>";

            try
            {
                CommonBLL.SendMail(Convert.ToString(ConfigurationManager.AppSettings["Sender"]), Convert.ToString(ConfigurationManager.AppSettings["DisplayName"]), user.EmailId, string.Empty, "New account creation", msgBody, Convert.ToString(ConfigurationManager.AppSettings["MailServerIP"]), Convert.ToString(ConfigurationManager.AppSettings["MailUserAccount"]), Convert.ToString(ConfigurationManager.AppSettings["MailUserPwd"]));
            }
            catch (Exception ex)
            {
                CommonBLL.HandleException(ex, this.Server.MapPath(this.Request.ApplicationPath).Replace("/", "\\"));
            }
        }

        #endregion
    }
}