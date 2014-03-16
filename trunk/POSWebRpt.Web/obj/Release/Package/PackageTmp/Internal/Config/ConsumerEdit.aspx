<%@ Page Title=":: RQM :: BPL Consumer Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="ConsumerEdit.aspx.cs" Inherits="REC.Web.Internal.Config.ConsumerEdit" %>
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
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">ADD / EDIT BPL CONSUMER</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowConfigurationPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a href="ConsumerList.aspx">BPL Consumer</a></div>
                <fieldset style="width: 400px;">
                    <legend>Consumer Detail</legend>
                    <asp:UpdatePanel ID="uPnlHH" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width:150px;">Consumer Name:<span class="mandatorysymbol">*</span></td>
                                    <td style="width:250px;"><asp:TextBox ID="txtConsumer" runat="server" MaxLength="100" Width="250"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvConsumer" runat="server" CssClass="errormessage" ControlToValidate="txtConsumer" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="label">BPL Card No:</td>
                                    <td><asp:TextBox ID="txtCardNo" runat="server" MaxLength="50" Width="250"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Meter No:</td>
                                    <td><asp:TextBox ID="txtMeterNo" runat="server" MaxLength="30" Width="250"></asp:TextBox></td>
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
