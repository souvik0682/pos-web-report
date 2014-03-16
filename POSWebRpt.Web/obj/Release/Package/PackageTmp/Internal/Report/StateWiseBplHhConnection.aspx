<%@ Page Language="C#" Title=":: RQM :: State Wise BPL Household Connection" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="StateWiseBplHhConnection.aspx.cs" Inherits="REC.Web.Internal.Report.StateWiseBplHhConnection" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">
        <%--STATE WISE BPL HOUSEHOLD CONNECTION
        <asp:ImageButton ID="btnPrint" runat="server" ImageUrl="~/Images/print_icon.png"
            Style="text-align: right; float: right" OnClick="btnPrint_Click" />--%>
    <uc:Navigation ID="ucNav" runat="server" HeaderText="STATE WISE BPL HOUSEHOLD CONNECTION"  ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" />
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
    <%--OnClick="btnPrint_Click"--%>
    <div class="labelcaption" style="width: 100%; text-align: center; padding-bottom: 5px;">
        <asp:Label ID="lblHeader" runat="server"></asp:Label></div>
    <asp:HiddenField ID="hdnRptIndex" runat="server" />
    <asp:HiddenField ID="hdnStateId" runat="server" />
    <asp:HiddenField ID="hdnDistrictId" runat="server" />
    <asp:HiddenField ID="hdnBlockId" runat="server" />
    <center>
        <fieldset style="width: 800px;">
            <legend>State Wise BPL HH Connection</legend>
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
            <%--STATE LEVEL REPORT--%>
            <div id="dv1A" runat="server" style="width: 100%; padding: 5px 0px 5px 0px;">
                <div style="padding: 5px 0px 5px 0px;">
                    <%--<asp:Button ID="btnClose" runat="server" CssClass="button" Text="Back" OnClientClick="javascript:window.location.href='ReportHome.aspx';return false;" />--%>
                </div>
                <asp:Repeater ID="rep1A" runat="server" EnableViewState="true" OnItemDataBound="rep1A_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                            width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 4%; text-align: center;" rowspan="2">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="2">
                                    Sate Id
                                </th>
                                <th style="width: 20%; text-align: center;" rowspan="2">
                                    Name of State
                                </th>
                                <th style="width: 9%; text-align: center;" rowspan="2">
                                    Nos. of Projects
                                </th>
                                <th style="width: 9%; text-align: center;" rowspan="2">
                                    Nos. of Village Inspected
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    BPL Connections Covered
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    No. of BPL HHs Inspected
                                </th>
                                <th colspan="4" style="text-align: center; width: 28%;">
                                    BPL Connections Released
                                </th>
                                <th colspan="2" style="text-align: center; width: 10%;" rowspan="2">
                                    Energised Public Places (Nos.)
                                </th>
                            </tr>
                            <tr class="repeaterheader">
                                <th style="width: 7%; text-align: center;">
                                    SC
                                </th>
                                <th style="width: 7%; text-align: center;">
                                    ST
                                </th>
                                <th style="width: 7%; text-align: center;">
                                    Others
                                </th>
                                <th style="width: 7%; text-align: center;">
                                    Total
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;">
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
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;">
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
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%=_totalNosOfStateProject%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfStateVillagesInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBPLConnCovered%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfHHInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBPLConnRelSC%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBPLConnRelST%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBPLConnRelOth%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBPLConnRelTotal%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfEnergisedPublicPlaces%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <%--DISTT LEVEL REPORT--%>
            <div id="dv1B" runat="server" style="display: none; width: 100%; padding: 5px 0px 5px 0px;">
                <div style="padding: 5px 0px 5px 0px;">
                    <asp:Button ID="btnBack1B" runat="server" CssClass="button" Text="Back" OnClick="btnBack1B_Click" />
                </div>
                <asp:Repeater ID="rep1B" runat="server" EnableViewState="true" OnItemDataBound="rep1B_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                            width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="2">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="2">
                                    Distt Id
                                </th>
                                <th style="width: 23%; text-align: center;" rowspan="2">
                                    Name of District
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    Nos. of Village Inspected
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    BPL Connections Covered
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    No. of BPL HHs Inspected
                                </th>
                                <th colspan="4" style="text-align: center; width: 32%;">
                                    BPL Connections Released
                                </th>
                                <th colspan="2" style="text-align: center; width: 10%;" rowspan="2">
                                    Energised Public Places (Nos.)
                                </th>
                            </tr>
                            <tr class="repeaterheader">
                                <th style="width: 8%; text-align: center;">
                                    SC
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    ST
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    Others
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    Total
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;">
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;">
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%=_totalNosOfDistVillagesInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistConnCovered%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistHHInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistConnRelSC%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistConnRelST%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistConnRelOth%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistConnRelTotal%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistEnergisedPublicPlaces%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <%--BLOCK LEVEL REPORT--%>
            <div id="dv1C" runat="server" style="display: none; width: 100%; padding: 5px 0px 5px 0px;">
                <div style="padding: 5px 0px 5px 0px;">
                    <asp:Button ID="btnBack1C" runat="server" CssClass="button" Text="Back" OnClick="btnBack1C_Click" />
                </div>
                <asp:Repeater ID="rep1C" runat="server" EnableViewState="true" OnItemDataBound="rep1C_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                            width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="2">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="2">
                                    Block Id
                                </th>
                                <th style="width: 23%; text-align: center;" rowspan="2">
                                    Name of Block
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    Nos. of Village Inspected
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    BPL Connections Covered
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    No. of BPL HHs Inspected
                                </th>
                                <th colspan="4" style="text-align: center; width: 32%;">
                                    BPL Connections Released
                                </th>
                                <th colspan="2" style="text-align: center; width: 10%;" rowspan="2">
                                    Energised Public Places (Nos.)
                                </th>
                            </tr>
                            <tr class="repeaterheader">
                                <th style="width: 8%; text-align: center;">
                                    SC
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    ST
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    Others
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    Total
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "BlockId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlockName")%>'
                                    CommandName="Select1C" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "BlockId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlockName")%>'
                                    CommandName="Select1C" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%=_totalNosOfBlockVillagesInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockConnCovered%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockHHInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockConnRelSC%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockConnRelST%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockConnRelOth%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockConnRelTotal%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockEnergisedPublicPlaces%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <%--VILLAGE LEVEL REPORT--%>
            <div id="dv1D" runat="server" style="display: none; width: 100%; padding: 5px 0px 5px 0px;">
                <div style="padding: 5px 0px 5px 0px;">
                    <asp:Button ID="btnBack1D" runat="server" CssClass="button" Text="Back" OnClick="btnBack1D_Click" />
                </div>
                <asp:Repeater ID="rep1D" runat="server" EnableViewState="true" OnItemDataBound="rep1D_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                            width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="2">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="2">
                                    Village Id
                                </th>
                                <th style="width: 33%; text-align: center;" rowspan="2">
                                    Name of Village
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    BPL Connections Covered
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="2">
                                    No. of BPL HHs Inspected
                                </th>
                                <th colspan="4" style="text-align: center; width: 32%;">
                                    BPL Connections Released
                                </th>
                                <th colspan="2" style="text-align: center; width: 10%;" rowspan="2">
                                    Energised Public Places (Nos.)
                                </th>
                            </tr>
                            <tr class="repeaterheader">
                                <th style="width: 8%; text-align: center;">
                                    SC
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    ST
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    Others
                                </th>
                                <th style="width: 8%; text-align: center;">
                                    Total
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "VillageId")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "VillageName")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "VillageId")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "VillageName")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnCovered")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "HHInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelSC")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelST")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelOth")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "BPLConnRelTotal")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%=_totalNosOfVillConnCovered%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillHHInspected%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillConnRelSC%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillConnRelST%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillConnRelOth%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillConnRelTotal%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillEnergisedPublicPlaces%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </fieldset>
    </center>
</asp:Content>
