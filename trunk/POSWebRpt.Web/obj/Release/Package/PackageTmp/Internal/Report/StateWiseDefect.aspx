<%@ Page Title=":: RQM :: State Wise Defect Report" Language="C#" AutoEventWireup="true"
    CodeBehind="StateWiseDefect.aspx.cs" MasterPageFile="~/Internal/REC.Master" Inherits="REC.Web.Internal.Report.StateWiseDefect" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">
        <%--STATE WISE DEFECT<asp:ImageButton ID="btnPrint" runat="server" ImageUrl="~/Images/print_icon.png"
            Style="text-align: right; float: right" OnClick="btnPrint_Click" />--%>
            <uc:Navigation ID="ucNav" runat="server" HeaderText="STATE WISE DEFECT"  ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" />
    </div>
    <div id="dvSync" runat="server" style="padding: 5px 0px 5px 0px; display: none;">
        <table width="100%" class="synpanel">
            <tr>
                <td>
                    <div id="dvErrMsg" runat="server"></div>
                </td>
                <td style="text-align: right; width: 2%;">
                    <img alt="Click to close" src="../../Images/Close-Button.bmp" title="Click to close"
                        onclick="closeErrorPanel()" />
                </td>
            </tr>
        </table>
    </div>
    <div class="labelcaption" style="width: 100%; text-align: center; padding-bottom: 5px;">
        <asp:Label ID="lblHeader" runat="server"></asp:Label></div>
    <asp:HiddenField ID="hdnRptIndex" runat="server" />
    <asp:HiddenField ID="hdnStateId" runat="server" />
    <asp:HiddenField ID="hdnDistrictId" runat="server" />
    <asp:HiddenField ID="hdnBlockId" runat="server" />
    <center>
        <fieldset style="width: 850px;">
            <legend>State Wise Defect</legend>
            <table border="0">
                <tr id="trState" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">
                        State:
                    </td>
                    <td style="padding: 0px 0px 5px 0px;" class="label">
                        <asp:Label ID="lblState" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr id="trDistrict" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">
                        District:
                    </td>
                    <td style="padding: 0px 0px 5px 0px;" class="label">
                        <asp:Label ID="lblDistrict" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr id="trBlock" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">
                        Block:
                    </td>
                    <td style="padding: 0px 0px 5px 0px;" class="label">
                        <asp:Label ID="lblBlock" runat="server"></asp:Label>
                    </td>

                </tr>
            </table>
            <div id="dv1A" runat="server">
                <div style="padding: 5px 0px 5px 0px;">
                    <%--<asp:Button ID="btnClose" runat="server" CssClass="button" Text="Back" OnClientClick="javascript:window.location.href='ReportHome.aspx';return false;" />--%>
                </div>
                <asp:Repeater ID="rep1A" runat="server" EnableViewState="true" OnItemDataBound="rep1A_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                            width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 5%; text-align: center; display: none" rowspan="1">
                                    Sate Id
                                </th>
                                <th style="width: 34%; text-align: center;" rowspan="1">
                                    Name of State
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Projects
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Village Inspected
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Quality of materials installed / commissioned
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Quality of works/ workmanship
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Physical quantity with reference to the reported executed quantity
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Electrification of all habitation / BPL Households as per RGGVY guidelines
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Total Nos. of Defects reported (Stage-I & Stage-II)
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Nos. of Defects Rectified of Stage 1
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "StateId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StateName")%>'
                                    CommandName="Select1A" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfProject")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                           <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "StateId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StateName")%>'
                                    CommandName="Select1A" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfProject")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td style="width: 50px;">
                                Total:
                            </td>
                            <td style="text-align: right; display: none">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                                <%--<%=_totalState%>--%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfStateProject%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfStateVillagesInspected%>
                            </td>
                            <td style="text-align: right;">
                               <%=_totalNosOfStateQualityMaterials%>
                            </td>
                            <td style="text-align: right;">
                               <%=_totalNosOfStateQualityWorkmanship%>
                            </td>
                            <td style="text-align: right;">
                               <%=_totalNosOfStatePhysicalQuantityExecuted%>
                            </td>
                            <td style="text-align: right;">
                               <%=_totalNosOfStateElectrificationHabitationBPL%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfStateDefectsReported%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfStateDefectsReportedInStage1%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div id="dv1B" runat="server" style="display: none;">
                <div style="padding: 5px 0px 5px 0px;">
                    <asp:Button ID="btnBack1B" runat="server" CssClass="button" Text="Back" OnClick="btnBack1B_Click" />
                </div>
                <asp:Repeater ID="rep1B" runat="server" EnableViewState="true" OnItemDataBound="rep1B_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width: 100%;">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 5%; text-align: center; display: none" rowspan="1">
                                    District Id
                                </th>
                                <th style="width: 34%; text-align: center;" rowspan="1">
                                    District Name
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Projects
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Nos. of Village Inspected
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                   Quality of materials installed/ commissioned
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Quality of works/ workmanship
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Physical quantity with reference to the reported executed quantity
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Electrification of all habitation/BPL Households as per RGGVY guidelines
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Defects reported
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Defects Rectified of Stage 1
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "DisttId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DisttName")%>'
                                    CommandName="Select1B" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfProject")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "DisttId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DisttName")%>'
                                    CommandName="Select1B" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfProject")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>
                                Total:
                            </td>
                            <td style="text-align: right; display: none">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                                <%-- <%=_totalDistrict%>--%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistProject%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistVillagesInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistQualityMaterials%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistQualityWorkmanship%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistPhysicalQuantityExecuted%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistElectrificationHabitationBPL%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistDefectsReported%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistDefectsReportedInStage1%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div id="dv1C" runat="server" style="display: none;">
                <div style="padding: 5px 0px 5px 0px;">
                    <asp:Button ID="btnBack1C" runat="server" CssClass="button" Text="Back" OnClick="btnBack1C_Click" />
                </div>
                <asp:Repeater ID="rep1C" runat="server" EnableViewState="true" OnItemDataBound="rep1C_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width:100%;">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 5%; text-align: center; display: none" rowspan="1">
                                    Block Id
                                </th>
                                <th style="width: 34%; text-align: center;" rowspan="1">
                                    Block Name
                                </th>
                                <th style="display: none; width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Projects
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Nos. of Village Inspected
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Quality of materials installed/ commissioned
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Quality of works/ workmanship
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Physical quantity with reference to the reported executed quantity
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Electrification of all habitation/BPL Households as per RGGVY guidelines
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Defects reported
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Defects Rectified of Stage 1
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "BlockId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlockName")%>'
                                    CommandName="Select1C" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right; display: none;">
                                <%--<%# DataBinder.Eval(Container.DataItem, "NosOfProject")%>--%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "BlockId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlockName")%>'
                                    CommandName="Select1C" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right; display: none;">
                                <%--<%# DataBinder.Eval(Container.DataItem, "NosOfProject")%>--%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>
                                Total:
                            </td>
                            <td style="text-align: right; display: none">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                                <%-- <%=_totalBlock%>--%>
                            </td>
                            <td style="text-align: right; display: none;">
                                <%--<%=_totalNosOfBlockProject%>--%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockVillagesInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockQualityMaterials%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockQualityWorkmanship%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockPhysicalQuantityExecuted%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockElectrificationHabitationBPL%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockDefectsReported%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockDefectsReportedInStage1%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div id="dv1D" runat="server" style="display: none;">
                <div style="padding: 5px 0px 5px 0px;">
                    <asp:Button ID="btnBack1D" runat="server" CssClass="button" Text="Back" OnClick="btnBack1D_Click" />
                </div>
                <asp:Repeater ID="rep1D" runat="server" EnableViewState="true" OnItemDataBound="rep1D_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse; width:100%;">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 5%; text-align: center; display: none" rowspan="1">
                                    Village Id
                                </th>
                                <th style="width: 48%; text-align: center;" rowspan="1">
                                    Village Name
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Quality of materials installed/ commissioned
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Quality of works/ workmanship
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Physical quantity with reference to the reported executed quantity
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Electrification of all habitation/BPL Households as per RGGVY guidelines
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Nos. of Defects reported
                                </th>
                                <th style="width: 7%; text-align: center;" rowspan="1">
                                    Nos. of Defects Rectified of Stage 1
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "VillageId")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "VillageName")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td>
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "VillageId")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "VillageName")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityMaterials")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "QualityWorkmanship")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "PhysicalQuantityExecuted")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "ElectrificationHabitationBPL")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfDefectsReported")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "defectRectifiedOfStage1")%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>
                                Total:
                            </td>
                            <td style="text-align: right; display: none">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageQualityMaterials%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageQualityWorkmanship%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillagePhysicalQuantityExecuted%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageElectrificationHabitationBPL%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageDefectsReported%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageDefectsReportedInStage1%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </fieldset>
    </center>
</asp:Content>
