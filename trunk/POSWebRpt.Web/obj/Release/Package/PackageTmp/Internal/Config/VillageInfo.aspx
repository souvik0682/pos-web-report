<%@ Page Title=":: RQM :: Village General Info" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="VillageInfo.aspx.cs" Inherits="REC.Web.Internal.Config.VillageInfo" %>
<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgItem" runat="server" AssociatedUpdatePanelID="uPnlItem">
        <ProgressTemplate>
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">VILLAGE GENERAL INFORMATION</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowConfigurationPanel="true" />                     
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 600px;">
                    <legend>Village General Information</legend>
                    <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width:140px;">REC Scheme Code:</td>
                                    <td style="width:320px;"><asp:TextBox ID="txtSchemeCode" runat="server" MaxLength="50" Width="270" TabIndex="1"></asp:TextBox></td>
                                    <td class="label" style="width:70px;">BPL HH:</td>
                                    <td style="width:70px;"><cc1:CustomTextBox ID="txtBPLHH" runat="server" CssClass="numerictextbox" MaxLength="5" Type="Numeric" Width="70px" TabIndex="5"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">PIA Name:</td>
                                    <td><asp:TextBox ID="txtPIAName" runat="server" MaxLength="100" Width="270" TabIndex="2"></asp:TextBox></td>
                                    <td class="label">APL HH:</td>
                                    <td><cc1:CustomTextBox ID="txtAPLHH" runat="server" CssClass="numerictextbox" MaxLength="5" Type="Numeric" Width="70px" TabIndex="6"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Turnkey Contractor:</td>
                                    <td><asp:TextBox ID="txtTurnkey" runat="server" MaxLength="100" Width="270" TabIndex="3"></asp:TextBox></td>
                                    <td class="label">Total HH:</td>
                                    <td><cc1:CustomTextBox ID="txtTotalHH" runat="server" CssClass="numerictextbox" MaxLength="5" Type="Numeric" Width="70px" TabIndex="7"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Status:</td>
                                    <td><asp:DropDownList ID="ddlStatus" runat="server" TabIndex="4"></asp:DropDownList></td>
                                    <td class="label">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="buttonpanel"><asp:Button ID="btnSave" runat="server" Text="Save" TabIndex="8" OnClick="btnSave_Click" /></div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
