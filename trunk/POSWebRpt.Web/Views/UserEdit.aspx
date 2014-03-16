<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="POSWebRpt.Web.Views.UserEdit" MasterPageFile="~/Site.Master" Title=":: POS :: Add / Edit User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">    
    <script type="text/javascript">
        LoadScript();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <div id="headercaption">ADD / EDIT USER</div>
    <div style="margin:0px auto;width:450px;">
        <fieldset style="width:100%;">
            <legend>Add / Edit User</legend>
            <table border="0" cellpadding="3" cellspacing="3" width="100%">
                <tr>
                    <td style="width:150px;">User Name:<span class="errormessage1">*</span></td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="textboxuppercase" MaxLength="10" Width="250"></asp:TextBox><br />
                        <span id="spnName" runat="server" class="errormessage" style="display:none;"></span>
                        <%--<asp:RequiredFieldValidator ID="rfvUserName" runat="server" CssClass="errormessage" ControlToValidate="txtUserName" Display="Dynamic" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>First Name:<span class="errormessage1">*</span></td>
                    <td>
                        <asp:TextBox ID="txtFName" runat="server" CssClass="textboxuppercase" MaxLength="30" Width="250"></asp:TextBox><br />
                        <span id="spnFName" runat="server" class="errormessage" style="display:none;"></span>
                        <%--<asp:RequiredFieldValidator ID="rfvFName" runat="server" CssClass="errormessage" ControlToValidate="txtFName" Display="Dynamic" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>Last Name:<span class="errormessage1">*</span></td>
                    <td>
                        <asp:TextBox ID="txtLName" runat="server" CssClass="textboxuppercase" MaxLength="30" Width="250"></asp:TextBox><br />
                        <span id="spnLName" runat="server" class="errormessage" style="display:none;"></span>
                        <%--<asp:RequiredFieldValidator ID="rfvLName" runat="server" CssClass="errormessage" ControlToValidate="txtLName" Display="Dynamic" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>Email Id:<span class="errormessage1">*</span></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textboxuppercase" MaxLength="100" Width="250"></asp:TextBox><br />
                        <span id="spnEmail" runat="server" class="errormessage" style="display:none;"></span>
                        <%--<asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="errormessage" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" CssClass="errormessage" ValidationGroup="Save" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Role:<span class="errormessage1">*</span></td>
                    <td>
                        <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="false" Width="150px" CssClass="chzn-select medium-select single"></asp:DropDownList><br />
                        <span id="spnRole" runat="server" class="errormessage" style="display:none;"></span>
                        <%--<asp:RequiredFieldValidator ID="rfvRole" runat="server" CssClass="errormessage" ControlToValidate="ddlRole" InitialValue="0" Display="Dynamic" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>Is Active?:</td>
                    <td><asp:CheckBox ID="chkActive" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;&nbsp;<asp:Button ID="btnBack" runat="server" Text="Back"/>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>