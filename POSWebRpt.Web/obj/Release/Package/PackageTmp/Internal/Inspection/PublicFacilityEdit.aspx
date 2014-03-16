<%@ Page Title=":: RQM :: Public Facility Electrification Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="PublicFacilityEdit.aspx.cs" Inherits="REC.Web.Internal.Inspection.PublicFacilityEdit" %>
<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
<script type="text/javascript" language="javascript">
    window.onload = function () {
        validateShow();
    }
    function validateShow() {
        var ddlFacility = document.getElementById('<%=ddlFacility.ClientID %>');
        var txtFacility = document.getElementById('<%=txtFacility.ClientID %>');
        if (ddlFacility.options[ddlFacility.selectedIndex].text == 'Other')
         {

             txtFacility.style["display"] = '';
                          
            return true;
        }
        else {

            txtFacility.style["display"] = 'none';
            return true;
        }
    }
    function validateOther(sender, args) {
        var isValid = true;
        var ddl = document.getElementById('<%=ddlFacility.ClientID %>');

        if (ddl != null) {
            var selValue = ddl.options[ddl.selectedIndex].text;

            if (selValue == "Other") {
                isValid = (args.Value.length > 0);
            }
        }

        args.IsValid = isValid;
    }

    </script>
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
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
    <div id="pageheader">ADD / EDIT PUBLIC FACILITY</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a href="PublicFacilityList.aspx">Public Facility</a></div>
                <fieldset style="width: 480px;">
                    <legend>Electrification Detail</legend>
                    <asp:UpdatePanel ID="uPnlStatus" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width:230px;">Facility:<span class="mandatorysymbol">*</span></td>
                                    <td style="width:250px;">
                                        <asp:DropDownList ID="ddlFacility" runat="server" AutoPostBack="false"  OnChange="javascript:return validateShow();" >
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvFacility" runat="server" CssClass="errormessage" ControlToValidate="ddlFacility" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="label"></td>
                                    <td><asp:TextBox ID="txtFacility" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>                           
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:CustomValidator ID="cvDesc" runat="server" CssClass="errormessage" ControlToValidate="txtFacility" ValidateEmptyText="true" OnServerValidate="cvDesc_ServerValidate" EnableClientScript="true" ClientValidationFunction="validateOther" Display="Dynamic" ValidationGroup="Save"></asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td class="label">Facility Exists?:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:CheckBox ID="chkExists" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Access available:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:CheckBox ID="chkAvailable" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Access available but not charged:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:CheckBox ID="chkNotChrg" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Electrified:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:CheckBox ID="chkElectrified" runat="server" /></td>
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
