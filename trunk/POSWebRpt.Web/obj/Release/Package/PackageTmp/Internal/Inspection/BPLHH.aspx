<%@ Page Title=":: RQM :: BPL HH" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="BPLHH.aspx.cs" Inherits="REC.Web.Internal.Inspection.BPLHH" %>
<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function calculation(ctrl1, ctrl2, ctrl3, ctrl4) {
        //1
        var CRST = document.getElementById(ctrl1);
        if (CRST.value == '') {
            CRST.value = 0;
        }

        //2
        var CRSC = document.getElementById(ctrl2);
        if (CRSC.value == '') {
            CRSC.value = 0;
        }

        //3
        var CROTH = document.getElementById(ctrl3);
        if (CROTH.value == '') {
            CROTH.value = 0;
        }
        //4
        var CRTOT = document.getElementById(ctrl4);
        var result = 0;
        result = parseInt(CRST.value) + parseInt(CRSC.value) + parseInt(CROTH.value);
        CRTOT.value = result;
    }
      
  </script>
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
    <div id="pageheader">BPL HOUSEHOLDS</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 90%;">
                    <legend>BPL Households</legend>
                    <asp:UpdatePanel ID="uPnlHH" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td class="label" style="width:30%;">BPL Coverage:</td>
                                    <td style="width:20%;"><cc1:CustomTextBox ID="txtCoverage" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px" TabIndex="1"></cc1:CustomTextBox></td>
                                    <td class="label" style="width:30%;">Connections Released (Total):</td>
                                    <td style="width:20%;"><cc1:CustomTextBox ID="txtCRTotal" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px" TabIndex="5"  Enabled=false BorderColor="AliceBlue"  ></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Connections Released (SC):</td>
                                    <td><cc1:CustomTextBox ID="txtCRSC" runat="server" CssClass="numerictextbox" 
                                            Type="Numeric" MaxLength="5" Width="70px" TabIndex="2"></cc1:CustomTextBox></td>
                                    <td class="label">BPL HHs Inspected:</td>
                                    <td><cc1:CustomTextBox ID="txtInspected" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px" TabIndex="6"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Connections Released (ST):</td>
                                    <td><cc1:CustomTextBox ID="txtCRST" runat="server" CssClass="numerictextbox" 
                                            Type="Numeric" MaxLength="5" Width="70px" TabIndex="3"></cc1:CustomTextBox></td>
                                    <td class="label">BPL HHs Charged Out:</td>
                                    <td><cc1:CustomTextBox ID="txtChrgOut" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px" TabIndex="7"></cc1:CustomTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Connections Released (Others):</td>
                                    <td><cc1:CustomTextBox ID="txtCROth" runat="server" CssClass="numerictextbox" 
                                            Type="Numeric" MaxLength="5" Width="70px" TabIndex="4"></cc1:CustomTextBox></td>
                                    <td class="label">BPL HHs Yet To Be Charged Out:</td>
                                    <td><cc1:CustomTextBox ID="txtYetChgOut" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="5" Width="70px" TabIndex="8"></cc1:CustomTextBox></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="buttonpanel">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" TabIndex="9" OnClick="btnSave_Click" />&nbsp;
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
