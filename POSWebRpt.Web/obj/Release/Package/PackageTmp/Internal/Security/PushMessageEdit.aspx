<%@ Page Title=":: RQM :: Send Push Message" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="PushMessageEdit.aspx.cs" Inherits="REC.Web.Internal.Security.PushMessageEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">SEND PUSH MESSAGE</div>
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
            <legend>Send Message</legend>          
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="label" style="width: 130px;">Recipient:<span class="mandatorysymbol">*</span></td>
                    <td><asp:DropDownList ID="ddlRecipient" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="rfvRecipient" runat="server" CssClass="errormessage" ControlToValidate="ddlRecipient" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Send"></asp:RequiredFieldValidator></td>                        
                </tr>
                <tr>
                    <td class="label">Message:<span class="mandatorysymbol">*</span></td>
                    <td><asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Rows="3" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="rfvMsg" runat="server" CssClass="errormessage" ControlToValidate="txtMsg" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Send"></asp:RequiredFieldValidator></td>                        
                </tr>
            </table>
            <div style="width: 100%; padding: 25px 0px 10px 0px;">
                <asp:Button ID="btnSend" runat="server" Text="Send Message" ValidationGroup="Send" OnClick="btnSend_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='PushMessageList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>
