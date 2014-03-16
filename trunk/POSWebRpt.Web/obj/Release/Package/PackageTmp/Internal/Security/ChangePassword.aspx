<%@ Page Title=":: RQM :: Change Password" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="REC.Web.Internal.Security.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose"><img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage"></div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgItem" runat="server" AssociatedUpdatePanelID="uPnlItem">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">CHANGE PASSWORD</div>
    <center>
        <fieldset style="width: 370px;">
            <legend>Change Password</legend>
            <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width:130px;">Old Password:<span class="mandatorysymbol">*</span></td>
                            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" TabIndex="1" MaxLength="50" Width="150"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" CssClass="errormessage" ControlToValidate="txtPassword" ValidationGroup="Save" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">New Password:<span class="mandatorysymbol">*</span></td>
                            <td><asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password" TabIndex="2" MaxLength="50" Width="150"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" CssClass="errormessage" ControlToValidate="txtNewPwd" ValidationGroup="Save" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Confirm Password:<span class="mandatorysymbol">*</span></td>
                            <td><asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" TabIndex="3" MaxLength="50" Width="150"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" CssClass="errormessage" ControlToValidate="txtConfirmPwd" ValidationGroup="Save" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvConfirmPwd" runat="server" ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd" CssClass="errormessage" ValidationGroup="Save" Display="Dynamic" ForeColor="" SetFocusOnError="true"></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" TabIndex="4" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
            </div>
        </fieldset>
    </center>
</asp:Content>
