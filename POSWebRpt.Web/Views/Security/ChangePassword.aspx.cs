using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using POSWebRpt.BLL;
using POSWebRpt.Common;
using POSWebRpt.Entity;
using POSWebRpt.Utilities;
using POSWebRpt.Utilities.ResourceManager;
using POSWebRpt.Utilities.Cryptography;

namespace POSWebRpt.Web.Views.Security
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        #region Private Member Variables

        private int _userId = 0;

        #endregion

        #region Protected Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            RetriveParameters();
            CheckUserAccess();
            SetAttributes();
        }

        protected void btnChangePwd_Click(object sender, EventArgs e)
        {
            string oldPassword = Encryption.Encrypt(txtOldPwd.Text.Trim());
            string newPassword = Encryption.Encrypt(txtNewPwd.Text.Trim());

            IUser user = new UserEntity();
            user.Id = _userId;
            user.Password = oldPassword;
            user.NewPassword = newPassword;
            IActionResult result = UserBLL.ChangePassword(user);

            if (result.HasMessage)
            {
                Session.Abandon();
                Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script>javascript:alert('" + ResourceManager.GetStringWithoutName("R00032") + "');window.location.href='../Login.aspx'</script>");
            }
        }

        #endregion

        #region Private Methods

        private void RetriveParameters()
        {
            if (!ReferenceEquals(Request.QueryString["id"], null) && Convert.ToString(Request.QueryString["id"]) != string.Empty)
            {
                int.TryParse(GeneralFunctions.DecryptQueryString(Convert.ToString(Request.QueryString["id"])), out _userId);
            }
            else
            {
                _userId = UserBLL.GetLoggedInUserId();
            }
        }

        private void CheckUserAccess()
        {
            if (_userId == 0)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        private void SetAttributes()
        {
            if (!IsPostBack)
            {
                rfvOldPwd.ErrorMessage = ResourceManager.GetStringWithoutName("R00026");
                rfvNewPwd.ErrorMessage = ResourceManager.GetStringWithoutName("R00027");
                rfvRePwd.ErrorMessage = ResourceManager.GetStringWithoutName("R00028");
                cvRePwd.ErrorMessage = ResourceManager.GetStringWithoutName("R00029");
            }
        }

        #endregion
    }
}