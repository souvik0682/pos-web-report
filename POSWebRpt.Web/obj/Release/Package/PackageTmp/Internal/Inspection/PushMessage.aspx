<%@ Page Language="C#" Title=":: RQM :: Push Message" AutoEventWireup="true" MasterPageFile="~/Internal/REC.Master" CodeBehind="PushMessage.aspx.cs" Inherits="REC.Web.Internal.Inspection.PushMessage" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
<asp:UpdateProgress ID="uProgStatus" runat="server" AssociatedUpdatePanelID="uPnlStatus">
        <ProgressTemplate> 
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">PUSH MESSAGE</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:villsumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 650px;">
                    <legend>Message</legend>
                    <table border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td class="label" style="width:80px;">User Id :</td>
                            <td><asp:Label ID="lblUserId" runat="server"></asp:Label> </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="label" style="width:80px;">Message:</td>
                            <td><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="3" 
                                    Width="250"></asp:TextBox></td>
                            <td><asp:Button ID="btnSend" runat="server" Text="Send" ValidationGroup="Send" 
                                    OnClick="btnSave_Click" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2"><asp:RequiredFieldValidator ID="rfvSend" runat="server" CssClass="errormessage" ControlToValidate="txtComment" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Send"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </fieldset>
                </td>
                </tr>
                </table>
</asp:Content>
