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

namespace POSWebRpt.Web.Views
{
    public partial class RoleEdit : System.Web.UI.Page
    {
        #region Private Member Variables

        private int _userId = 0;
        private int _roleId = 0;
        private bool _canAdd = false;
        private bool _canEdit = false;
        private bool _canDelete = false;
        private bool _canView = false;

        private enum MainMenuItem
        {
            Home = 1,
            Settings = 2,
            Reports = 3,
            Change_Password = 4
        };

        #endregion

        #region Protected Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            RetriveParameters();
            CheckUserAccess();
            SetAttributes();

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void gvwMst_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                PopulateControlsForGridView(gvwMst, e.Row);
            }
        }

        protected void gvwRpt_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                PopulateControlsForGridView(gvwRpt, e.Row);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveRole();
        }

        #endregion

        #region Private Methods

        private void SetAttributes()
        {
            if (!IsPostBack)
            {
                if (_roleId == -1) //Add mode
                {
                    if (!_canAdd) btnSave.Visible = false;
                }
                else
                {
                    if (!_canEdit) btnSave.Visible = false;
                }

                btnBack.OnClientClick = "javascript:return RedirectAfterCancelClick('RoleList.aspx','" + ResourceManager.GetStringWithoutName("R00025") + "')";
                rfvRole.ErrorMessage = ResourceManager.GetStringWithoutName("R00038");
            }
        }

        private void RetriveParameters()
        {
            _userId = UserBLL.GetLoggedInUserId();

            //Get user permission.
            UserBLL.GetUserPermission(out _canAdd, out _canEdit, out _canDelete, out _canView);

            if (!ReferenceEquals(Request.QueryString["id"], null))
            {
                Int32.TryParse(GeneralFunctions.DecryptQueryString(Request.QueryString["id"].ToString()), out _roleId);
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

            if (!_canView)
            {
                Response.Redirect("~/Unauthorized.aspx");
            }

            if (_roleId == 0)
                Response.Redirect("~/View/ManageRole.aspx");
        }

        private void PopulateControlsForGridView(GridView gvw, GridViewRow row)
        {
            GeneralFunctions.ApplyGridViewAlternateItemStyle(row, 6);

            //ScriptManager sManager = ScriptManager.GetCurrent(this);

            ((Label)row.FindControl("lblSlNo")).Text = ((gvw.PageSize * gvw.PageIndex) + row.RowIndex + 1).ToString();
            ((HiddenField)row.FindControl("hdnAccessId")).Value = Convert.ToString(DataBinder.Eval(row.DataItem, "MenuAccessID"));
            ((HiddenField)row.FindControl("hdnMenuId")).Value = Convert.ToString(DataBinder.Eval(row.DataItem, "MenuID"));

            row.Cells[1].Text = Convert.ToString(DataBinder.Eval(row.DataItem, "MenuName"));

            //Add
            if (Convert.ToBoolean(DataBinder.Eval(row.DataItem, "CanAdd")))
                ((CheckBox)row.FindControl("chkAdd")).Checked = true;
            else
                ((CheckBox)row.FindControl("chkAdd")).Checked = false;

            //Edit
            if (Convert.ToBoolean(DataBinder.Eval(row.DataItem, "CanEdit")))
                ((CheckBox)row.FindControl("chkEdit")).Checked = true;
            else
                ((CheckBox)row.FindControl("chkEdit")).Checked = false;

            //Delete
            if (Convert.ToBoolean(DataBinder.Eval(row.DataItem, "CanDelete")))
                ((CheckBox)row.FindControl("chkDel")).Checked = true;
            else
                ((CheckBox)row.FindControl("chkDel")).Checked = false;

            //View
            if (Convert.ToBoolean(DataBinder.Eval(row.DataItem, "CanView")))
                ((CheckBox)row.FindControl("chkView")).Checked = true;
            else
                ((CheckBox)row.FindControl("chkView")).Checked = false;
        }

        private void LoadData()
        {
            IRole role = UserBLL.GetRole(_roleId);

            if (!ReferenceEquals(role, null))
            {
                txtRole.Text = role.Name;
            }

            gvwMst.DataSource = UserBLL.GetMenuByRole(_roleId, (int)MainMenuItem.Settings);
            gvwMst.DataBind();

            gvwRpt.DataSource = UserBLL.GetMenuByRole(_roleId, (int)MainMenuItem.Reports);
            gvwRpt.DataBind();
        }

        private void SaveRole()
        {
            List<RoleMenuEntity> lstRoleMenu = new List<RoleMenuEntity>();
            IRole role = new RoleEntity();

            string message = string.Empty;
            BuildRoleEntity(role);
            BuildRoleMenuEntity(lstRoleMenu);
            IActionResult result = UserBLL.SaveRole(lstRoleMenu, role, _userId);

            if (result.HasMessage)
            {
                if (_roleId == -1)
                {
                    Response.Redirect("~/Views/RoleList.aspx");
                }
                else
                {
                    GeneralFunctions.RegisterAlertScript(this, result.Message);
                }

            }
        }

        private void BuildRoleEntity(IRole role)
        {
            role.Id = _roleId;
            role.Name = txtRole.Text.Trim();
        }

        private void BuildRoleMenu(List<RoleMenuEntity> lstRoleMenu, GridView gvw)
        {
            for (int index = 0; index < gvw.Rows.Count; index++)
            {
                RoleMenuEntity roleMenu = new RoleMenuEntity();

                HiddenField hdnAccessId = (HiddenField)gvw.Rows[index].FindControl("hdnAccessId");
                HiddenField hdnMenuId = (HiddenField)gvw.Rows[index].FindControl("hdnMenuId");
                CheckBox chkAdd = (CheckBox)gvw.Rows[index].FindControl("chkAdd");
                CheckBox chkEdit = (CheckBox)gvw.Rows[index].FindControl("chkEdit");
                CheckBox chkDel = (CheckBox)gvw.Rows[index].FindControl("chkDel");
                CheckBox chkView = (CheckBox)gvw.Rows[index].FindControl("chkView");

                int menuAccessId = 0;
                int menuId = 0;
                int.TryParse(hdnAccessId.Value, out menuAccessId);
                int.TryParse(hdnMenuId.Value, out menuId);

                roleMenu.MenuAccessID = menuAccessId;
                roleMenu.MenuID = menuId;
                roleMenu.CanAdd = chkAdd.Checked;
                roleMenu.CanEdit = chkEdit.Checked;
                roleMenu.CanDelete = chkDel.Checked;
                roleMenu.CanView = chkView.Checked;

                lstRoleMenu.Add(roleMenu);
            }
        }

        private void BuildRoleMenuEntity(List<RoleMenuEntity> lstRoleMenu)
        {
            BuildRoleMenu(lstRoleMenu, gvwMst);
            BuildRoleMenu(lstRoleMenu, gvwRpt);
        }

        #endregion
    }
}