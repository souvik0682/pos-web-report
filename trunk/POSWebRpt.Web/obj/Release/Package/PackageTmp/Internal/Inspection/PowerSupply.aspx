<%@ Page Title=":: RQM :: Power Supply Status" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="PowerSupply.aspx.cs" Inherits="REC.Web.Internal.Inspection.PowerSupply" %>
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
    <asp:UpdateProgress ID="uProgPower" runat="server" AssociatedUpdatePanelID="uPnlPower">
        <ProgressTemplate> 
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">POWER SUPPLY STATUS</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 650px;">
                    <legend>Power Supply Status</legend>
                    <asp:UpdatePanel ID="uPnlPower" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td class="label" style="width:35%;padding-right:5px;">No. of Hours of power supply in the village:<span class="mandatorysymbol">*</span></td>
                                    <td style="width:18%;padding-right:20px;"><asp:DropDownList ID="ddlAvgPower" runat="server" TabIndex="1"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                                    <td class="label" style="width:35%;padding-right:5px;">Energisation Status:<span class="mandatorysymbol">*</span></td>
                                    <td style="width:12%;"><asp:DropDownList ID="ddlEnergisation" runat="server" TabIndex="5"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvHrs" runat="server" CssClass="errormessage" ControlToValidate="ddlAvgPower" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvEner" runat="server" CssClass="errormessage" ControlToValidate="ddlEnergisation" InitialValue="0"  Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="label" style="padding-right:5px;">Remarks:</td>
                                    <td style="padding-right:20px;"><asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="3" Width="150" TabIndex="2"></asp:TextBox></td>
                                    <td class="label" style="padding-right:5px;">Newly Developed Infrastructure Handed Over To State Authorised Authorities?</td>
                                    <td>
                                        <asp:DropDownList ID="ddlHanded" runat="server" TabIndex="6">
                                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label" style="padding-right:5px;">No of Interruptions in Elctric Supply:</td>
                                    <td style="padding-right:20px;"><asp:TextBox ID="txtIntNo" runat="server" MaxLength="50" Width="150" TabIndex="3"></asp:TextBox></td>
                                    <td class="label" style="padding-right:5px;">Gram Panchayat Certificate Furnished?</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCert" runat="server" TabIndex="7">
                                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        </asp:DropDownList>                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label" style="padding-right:5px;">Hours of Supply in Peak hours:</td>
                                    <td style="padding-right:20px;"><asp:TextBox ID="txtPeakHr" runat="server" Width="150" TabIndex="4"></asp:TextBox></td>
                                    <td class="label" style="padding-right:5px;"></td>
                                    <td></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="buttonpanel">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" TabIndex="8" OnClick="btnSave_Click" />&nbsp;
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
