<%@ Page Title=":: RQM :: Major Physical Quantity Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="MIAEdit.aspx.cs" Inherits="REC.Web.Internal.Inspection.MIAEdit" %>
<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
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
    <asp:UpdateProgress ID="uProgMI" runat="server" AssociatedUpdatePanelID="uPnlMI">
        <ProgressTemplate> 
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">ADD / EDIT MAJOR PHYSICAL QUANTITIES - ACTUAL</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a href="MIAList.aspx">Major Item Actual</a></div>
                <fieldset style="width: 500px;">
                    <legend>Material / Equipment Detail</legend>
                    <asp:UpdatePanel ID="uPnlMI" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width:160px;">Material / Equipment:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:DropDownList ID="ddlItem" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvItem" runat="server" CssClass="errormessage" ControlToValidate="ddlItem" Display="Dynamic" InitialValue="0" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="label">Sub Item:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlSubItem" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top:5px;padding-bottom:20px;">&nbsp;</td>
                                    <td style="padding-top:5px;padding-bottom:20px;"><asp:TextBox ID="txtSubItem" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="label" style="display:none;">Approved Qty:</td>
                                    <td style="display:none;"><cc1:CustomTextBox ID="txtAppQty" runat="server" CssClass="numerictextbox" MaxLength="5" Type="Numeric" Width="70px" BackColor="InactiveCaption" ReadOnly="True" ></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Actual Qty:<span class="mandatorysymbol">*</span></td>
                                    <td><cc1:CustomTextBox ID="txtActualQty" runat="server" CssClass="numerictextbox" MaxLength="5" Type="Numeric" Width="70px"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td class="label">&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvActualQty" runat="server" ControlToValidate="txtActualQty" CssClass="errormessage" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="label" style="display:none;">Variation:</td>
                                    <td style="display:none;"><cc1:CustomTextBox ID="txtVariation" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Remarks:</td>
                                    <td><asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>
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
