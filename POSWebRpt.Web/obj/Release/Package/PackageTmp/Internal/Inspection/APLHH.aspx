<%@ Page Title=":: RQM :: APL HH" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="APLHH.aspx.cs" Inherits="REC.Web.Internal.Inspection.APLHH" %>
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
    <asp:UpdateProgress ID="uProgHH" runat="server" AssociatedUpdatePanelID="uPnlHH">
        <ProgressTemplate> 
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">APL HOUSEHOLDS</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />                     
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width:410px;">
                    <legend>APL Households</legend>
                    <asp:UpdatePanel ID="uPnlHH" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0">
                                <tr>
                                    <td class="label" style="width:160px;">Connections Applied:</td>
                                    <td style="width:250px;"><cc1:CustomTextBox ID="txtApplied" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px"></cc1:CustomTextBox></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Connections Released:</td>
                                    <td><cc1:CustomTextBox ID="txtReleased" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Not Willing To Avail:</td>
                                    <td><cc1:CustomTextBox ID="txtNotWilling" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Reason:</td>
                                    <td><asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="buttonpanel">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
