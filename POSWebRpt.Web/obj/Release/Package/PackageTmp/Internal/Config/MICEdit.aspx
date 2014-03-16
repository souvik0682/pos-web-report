<%@ Page Title=":: RQM :: Major Physical Quantities Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="MICEdit.aspx.cs" Inherits="REC.Web.Internal.Config.MICEdit" %>
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
    <div id="pageheader">
        ADD / EDIT MAJOR PHYSICAL QUANTITIES - CONFIGURATION
    </div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowConfigurationPanel="true" />                     
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a href="MICList.aspx">Major Item Config</a></div>
                <fieldset style="width: 580px;">
                    <legend>Material / Equipment Detail</legend>
                    <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width:160px;">Material / Equipment:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:DropDownList ID="ddlItem" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="errormessage" ControlToValidate="ddlItem" Display="Dynamic" ForeColor="" SetFocusOnError="True" InitialValue="0" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="label">Sub Item:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlSubItem" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Approved Quantity:<span class="mandatorysymbol">*</span></td>
                                    <td><cc1:CustomTextBox ID="txtAppQty" runat="server" CssClass="numerictextbox" Width="70px"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvAppQty" runat="server" CssClass="errormessage" ControlToValidate="txtAppQty" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="buttonpanel">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                        <asp:Button ID="btnBack" runat="server" Text="Back" Visible="false" OnClientClick="javascript:window.location.href='MICEdit.aspx';return false;" />
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
