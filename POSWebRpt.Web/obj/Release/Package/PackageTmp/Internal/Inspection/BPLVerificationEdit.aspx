<%@ Page Title=":: RQM :: Consumer Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="BPLVerificationEdit.aspx.cs" Inherits="REC.Web.Internal.Inspection.BPLVerificationEdit" %>

<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
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
    <asp:HiddenField ID="hdnPhotoUrl" runat="server" />
    <div id="pageheader">
        ADD / EDIT CONSUMER</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel">
                    <a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a
                        href="BPLVerificationList.aspx">BPL Verification</a></div>
                <fieldset style="width: 600px;">
                    <legend>Consumer Detail</legend>
                    <asp:UpdatePanel ID="uPnlHH" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width: 220px;">Consumer:<span class="mandatorysymbol">*</span></td>
                                    <td>
                                        <asp:DropDownList ID="ddlConsumer" runat="server">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvConsumer" runat="server" CssClass="errormessage"
                                            ControlToValidate="ddlConsumer" InitialValue="0" Display="Dynamic" ForeColor=""
                                            SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Wheather Connection Provided:<span class="mandatorysymbol">*</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlConnection" runat="server">
                                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvConnection" runat="server" CssClass="errormessage"
                                            ControlToValidate="ddlConnection" InitialValue="-1" Display="Dynamic" ForeColor=""
                                            SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </td>
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
