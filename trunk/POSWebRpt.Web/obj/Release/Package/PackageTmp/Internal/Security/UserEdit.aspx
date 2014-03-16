<%@ Page Title=":: RQM :: User Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="REC.Web.Internal.Security.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">   
    <div id="pageheader">ADD / EDIT USER</div>
    <div id="dvSync" runat="server" style="padding: 5px 0px 5px 0px; display: none;">
        <table width="100%" class="synpanel">
            <tr>
                <td>
                    <div id="dvErrMsg" runat="server"></div>
                </td>
                <td style="text-align: right; width: 2%;">
                    <img alt="Click to close" src="../../Images/Close-Button.bmp" title="Click to close" onclick="closeErrorPanel()" />
                </td>
            </tr>
        </table>
    </div>
    <center>
        <fieldset style="width: 500px;">
            <legend>Add / Edit User</legend>          
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="label" style="width: 130px;">User Name:<span class="mandatorysymbol">*</span></td>
                    <td><asp:TextBox ID="txtUserName" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="rfvUserName" runat="server" CssClass="errormessage" ControlToValidate="txtUserName" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>                        
                </tr>                        
                <tr>
                    <td class="label">First Name: <span class="mandatorysymbol">*</span></td>
                    <td><asp:TextBox ID="txt1stName" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="rfv1stName" runat="server" CssClass="errormessage" ControlToValidate="txt1stName" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>                        
                </tr>
                <tr>
                    <td class="label">Middle Name:</td>
                    <td><asp:TextBox ID="txtMiddle" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="label">Last Name:<span class="mandatorysymbol">*</span></td>
                    <td><asp:TextBox ID="txtLast" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="rfvlastName" runat="server" CssClass="errormessage" ControlToValidate="txtLast" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>                        
                </tr>
                <tr>
                    <td class="label">User Group:<span class="mandatorysymbol">*</span></td>
                    <td><asp:DropDownList ID="ddlGroup" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="rfvGrp" runat="server" CssClass="errormessage" ControlToValidate="ddlGroup" Display="Dynamic" ForeColor="" InitialValue="0" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>                        
                </tr>
                <tr>
                    <td class="label">E-Mail:</td>
                    <td><asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>                            
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" CssClass="errormessage" Display="Dynamic" ForeColor="" ValidationGroup="Save"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="label">Designation:</td>
                    <td><asp:TextBox ID="txtDes" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="label">Is Active:</td>
                    <td><asp:CheckBox ID="chkIsActive" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="label">Profile Picture:</td>
                    <td>
                        <asp:Image ID="imgDoc" runat="server" ImageUrl="~/Internal/Security/ShowImage.aspx" Height="100px" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-top:5px;">&nbsp;</td>
                    <td style="padding-top:5px;">
                        <div id="dvFileUpload">
                            <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;
                            <asp:Label ID="lblUploadMessage" runat="server" CssClass="errormessage"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
            <div style="width: 100%; padding: 25px 0px 10px 0px;">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='UserList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>

