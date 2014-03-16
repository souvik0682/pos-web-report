<%@ Page Language="C#" Title=":: RQM :: Login" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="REC.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="CSS/login-box.css" rel="stylesheet" type="text/css" />
</head>
<body class="login_box_bg">
    <form id="form1" runat="server">
    <div id="dvLogin" runat="server">
        <div id="login-box">
            <table style="border: none;">
                <tr>
                    <td colspan="2" style="padding-bottom:10px;">
                        <div id="loginheader">
                            <div class="message">
                                <h2>Login</h2>
                            </div>
                            <div class="logo">
                                <img alt="" src="Images/REC_LOGO.jpg" style="width: 100px;height: 37px; margin-top: -4px;" />                                
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="login-box-label">Username:</td>
                </tr>
                <tr>
                    <td>
                        <div id="login-box-field" class="login-box-uname">
                            <asp:TextBox ID="txtUserName" runat="server" name="q" class="form-login" title="Username" size="30" MaxLength="50"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="errormessage" ControlToValidate="txtUserName" ValidationGroup="Login" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblMsgUsername" runat="server" CssClass="errormessage"></asp:Label>
                        </div>
                    </td>
                    <td class="mandatorysymbol">*</td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top: 10px;" class="login-box-label">Password:</td>
                </tr>
                <tr>
                    <td>
                        <div id="login-box-field" class="login-box-password">
                            <asp:TextBox ID="txtPassword" runat="server" name="q" class="form-login" title="Password" size="30" MaxLength="50" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvPwd" runat="server" CssClass="errormessage" ControlToValidate="txtPassword" ValidationGroup="Login" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblMsgPassword" runat="server" CssClass="errormessage"></asp:Label>
                        </div>
                    </td>
                    <td class="mandatorysymbol">*</td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;" colspan="2">
                        <asp:Button ID="btnLogin" runat="server" value="login" ValidationGroup="Login" CssClass="loginbtn" OnClick="btnLogin_Click" Text="Login" />                    
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblMsg" runat="server" CssClass="errormessage" Text="error"></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
    <div id="dvChgPwd" runat="server" style="display:none;">
        <div id="chgpwd-box">
            <table style="border: none">
                <tr>
                    <td colspan="2" style="padding-bottom:10px;">
                        <div id="chgpwdheader">
                            <div class="message">
                                <h2>Change Pwd</h2>
                            </div>
                            <div class="logo">
                                <img alt="" src="Images/REC_LOGO.jpg" style="width: 100px;height: 37px; margin-top: -4px;" />
                            </div>
                        </div>
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" class="login-box-label">New Password:</td>
                </tr>
                <tr>
                    <td>
                        <div id="Div3" class="login-box-password">
                            <asp:TextBox ID="txtNewPwd" runat="server" name="q" class="form-login" title="New Password" size="30" MaxLength="50" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" CssClass="errormessage" ControlToValidate="txtNewPwd" ValidationGroup="ChgPwd" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblNewPwd" runat="server" CssClass="errormessage"></asp:Label>
                        </div>
                    </td>
                    <td class="mandatorysymbol">*</td>
                </tr>
                <tr>
                    <td colspan="2" class="login-box-label" style="padding-top: 10px;">Confirm Password:</td>
                </tr>
                <tr>
                    <td>
                        <div id="Div1" class="login-box-password">
                            <asp:TextBox ID="txtConfirmPwd" runat="server" name="q" class="form-login" title="Confirm Password" size="30" MaxLength="50" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" CssClass="errormessage" ControlToValidate="txtConfirmPwd" ValidationGroup="ChgPwd" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvConfirmPwd" runat="server" ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd" CssClass="errormessage" ValidationGroup="ChgPwd" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:CompareValidator>
                            <asp:Label ID="lblConfirmPwd" runat="server" CssClass="errormessage"></asp:Label>
                        </div>
                    </td>
                    <td class="mandatorysymbol" style="padding-top: 10px;">*</td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;" colspan="2">
                        <asp:Button ID="btnChgPwd" runat="server" value="Save" ValidationGroup="ChgPwd" CssClass="loginbtn" OnClick="btnChgPwd_Click" Text="Save" />                    
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblChgPwdMsg" runat="server" CssClass="errormessage" Text="error"></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>

