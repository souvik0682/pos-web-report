<%@ Page Title=":: RQM :: State Wise Power Supply Status To Public Places" MasterPageFile="~/Internal/REC.Master"
    Language="C#" AutoEventWireup="true" CodeBehind="StateWiseFacility.aspx.cs" Inherits="REC.Web.Internal.Report.StateWiseFacility" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">
        <%--STATE WISE ACCESS TO PUBLIC PLACES<asp:ImageButton ID="btnPrint" runat="server" ImageUrl="~/Images/print_icon.png"
            Style="text-align: right; float: right" OnClick="btnPrint_Click" />--%>
            <uc:Navigation ID="ucNav" runat="server" HeaderText="STATE WISE POWER SUPPLY STATUS TO PUBLIC PLACES"  ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" />
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
        <fieldset style="width: 700px;">
            <legend>State Wise Power Supply Status To Public Places</legend>
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
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="1">
                                    Sate Id
                                </th>
                                <th style="width: 27%; text-align: center;" rowspan="1">
                                    Name of State
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Projects
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Villages Inspected
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Public Places
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Public Places having access to electricity (Nos.)
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Energised Public Places (Nos.)
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%=_totalNosOfStatePublicPlaces%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfElectricityAccess%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfEnergisedPublicPlaces%>
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
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
                            <tr class="repeaterheader">
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="1">
                                    District Id
                                </th>
                                <th style="width: 40%; text-align: center;" rowspan="1">
                                    District Name
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Villages Inspected
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Public Places
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Public Places having access to electricity (Nos.)
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Energised Public Places (Nos.)
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
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
                                <%=_totalNosOfDistPublicPlaces%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistElectricityAccess%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfDistEnergisedPublicPlaces%>
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
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
                            <tr class="repeaterheader">
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="1">
                                    Block Id
                                </th>
                                <th style="width: 40%; text-align: center;" rowspan="1">
                                    Block Name
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Villages Inspected
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Public Places
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Public Places having access to electricity (Nos.)
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Energised Public Places (Nos.)
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
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfVillagesInspected")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
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
                                <%=_totalNosOfBlockPublicPlaces%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockElectricityAccess%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfBlockEnergisedPublicPlaces%>
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
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
                            <tr class="repeaterheader">
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 50px; text-align: center; display: none" rowspan="1">
                                    Village Id
                                </th>
                                <th style="width: 53%; text-align: center;" rowspan="1">
                                    Village Name
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Nos. of Public Places
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Public Places having access to electricity (Nos.)
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                    Energised Public Places (Nos.)
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfEnergisedPublicPlaces")%>
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
                                <%# DataBinder.Eval(Container.DataItem, "NosOfPublicPlaces")%>
                            </td>
                            <td style="text-align: right;">
                                <%# DataBinder.Eval(Container.DataItem, "NosOfElectricityAccess")%>
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
                                <%=_totalNosOfVillagePublicPlaces%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageElectricityAccess%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalNosOfVillageEnergisedPublicPlaces%>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </fieldset>
    </center>
</asp:Content>
