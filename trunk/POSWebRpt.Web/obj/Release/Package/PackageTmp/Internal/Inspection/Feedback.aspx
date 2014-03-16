<%@ Page Title=":: RQM :: Feedback" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="REC.Web.Internal.Inspection.Feedback" %>

<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose"><img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage"></div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgFeedback" runat="server" AssociatedUpdatePanelID="uPnlFeedback">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">FEEDBACK & COMMENTS</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel">
                    <a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 600px;">
                    <legend>Feedback & Comments</legend>
                    <asp:UpdatePanel ID="uPnlFeedback" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="label" style="width: 250px;">
                                        Comment on socio-economic improvement in the village on account of RGGVY programme
                                        and that due to availability of power :
                                    </td>
                                    <td style="width: 350px;"><asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="5" Width="350px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Feedback from Public:</td>
                                    <td><asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Rows="5" Width="350px"></asp:TextBox></td>
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
