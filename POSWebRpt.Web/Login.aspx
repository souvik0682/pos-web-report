<%@ Page Title=":: POS :: Login" Language="C#" MasterPageFile="~/Blank.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="POSWebRpt.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="<%=Page.ResolveClientUrl("~/Images/Close-Button.bmp") %>" style="cursor: pointer;"
                    onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="progressbar">
                <div id="image">
                    <img src="<%=Page.ResolveClientUrl("~/Images/PleaseWait.gif") %>" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div style="margin: 0px auto; width: 800px;" class="container">
        <table style="margin-top: 20px;">
            <tr>
                <td style="border: solid 1px #000000; padding: 2px;">
                    <table border="0" cellpadding="0" cellspacing="0" align="center">
                        <tr>
                            <td valign="top" style="padding: 5px; width: 400px;">
                                <img src="<%=Page.ResolveClientUrl("~/Images/pos_logo.jpg") %>" style="display: block;"
                                    height="390" width="400" alt="" />
                            </td>
                            <td align="left" valign="top">
                                &nbsp;
                            </td>
                            <td style="padding: 0px 5px 0px 5px;" valign="top">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <fieldset>  
                                            <legend>Sign in</legend>
                                            <p style="margin-top:10px;">
                                                <label>Username:</label>
                                                <asp:TextBox ID="txtUserName" runat="server" MaxLength="10" Width="300px"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="errormessage" ControlToValidate="txtUserName" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                <asp:Label ID="lblMsgUsername" runat="server" CssClass="errormessage"></asp:Label>
                                            </p>
                                            <p>
                                                <label>Password:</label>
                                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" onkeypress="javascript:doClick(event,'container_btnLogin');" MaxLength="10" Width="300px"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" CssClass="errormessage" ControlToValidate="txtPassword" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                <asp:Label ID="lblMsgPassword" runat="server" CssClass="errormessage"></asp:Label>
                                            </p>
                                            <p>
                                                <asp:Button ID="btnLogin" runat="server" Text="Login"
                                                        ValidationGroup="Save" OnClick="btnLogin_Click" />
                                            </p>
                                            <p style="height:15px;">
                                                <asp:Label ID="lblMsg" runat="server" CssClass="errormessage" Visible="false"></asp:Label>
                                            </p>
                                            <p class="logindisclaimer">
                                                Disclaimer:BLA hereby disclaims any and all liability to any individual / organization/
                                                person for any loss or damage caused to them for any action taken on the basis of
                                                the general information available on the web site which may be due to omission,
                                                clerical errors or for any other reason whatsoever. BLA will not be responsible
                                                for any damages your business/ individual may suffer. We make no warranties of any
                                                kind, expressed or implied for information we provide. We reserve the right to revise
                                                the policies at any time. All end-users of us must adhere to the above policies.
                                            </p>
                                        </fieldset>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
