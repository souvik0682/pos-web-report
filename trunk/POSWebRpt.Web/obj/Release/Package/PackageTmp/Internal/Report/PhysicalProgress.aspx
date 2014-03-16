<%@ Page Title=":: RQM :: Physical Progress" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="PhysicalProgress.aspx.cs" Inherits="REC.Web.Internal.Report.PhysicalProgress" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">
        <uc:Navigation ID="ucNav" runat="server" HeaderText="PHYSICAL PROGRESS" ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" />
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
        <asp:Label ID="lblHeader" runat="server"></asp:Label>
    </div>
    <asp:HiddenField ID="hdnRptIndex" runat="server" />
    <asp:HiddenField ID="hdnStateId" runat="server" />
    <asp:HiddenField ID="hdnDistrictId" runat="server" />
    <asp:HiddenField ID="hdnBlockId" runat="server" />
    <center>
        <fieldset style="width: 850px;">
            <legend>Physical Progress</legend>
            <table border="0">
                <tr id="trState" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">State:</td>
                    <td style="padding: 0px 0px 5px 0px;" class="label"><asp:Label ID="lblState" runat="server"></asp:Label></td>
                </tr>
                <tr id="trDistrict" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">District:</td>
                    <td style="padding: 0px 0px 5px 0px;" class="label"><asp:Label ID="lblDistrict" runat="server"></asp:Label></td>
                </tr>
                <tr id="trBlock" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">Block:</td>
                    <td style="padding: 0px 0px 5px 0px;" class="label"><asp:Label ID="lblBlock" runat="server"></asp:Label></td>
                </tr>
            </table>
            <div id="dv1A" runat="server">
                <asp:Repeater ID="rep1A" runat="server" EnableViewState="true" OnItemDataBound="rep1A_ItemDataBound">
                    <HeaderTemplate>
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;" rowspan="2">Sl#</th>
                                <th style="width: 25%; text-align: center;" rowspan="2">Name of State</th>
                                <th style="width: 10%; text-align: center;" rowspan="2">No. of Projects</th>
                                <th style="width: 10%; text-align: center;" rowspan="2">Total No. of Villages As Per Scope</th>
                                <th style="width: 10%; text-align: center;" colspan="2">Stage-I</th>
                                <th style="width: 10%; text-align: center;" colspan="2">Stage-II</th>
                                <th style="width: 10%; text-align: center;" rowspan="2">No. of Discrepancies Observed Under Stage-I</th>
                                <th style="width: 10%; text-align: center;" rowspan="2">No. of Discrepancies Observed Under Stage-II</th>
                                <th style="width: 10%; text-align: center;" rowspan="2">No. of Discrepancies Rectified</th>
                            </tr>
                            <tr class="repeaterheader">
                                <th style="width: 10%; text-align: center;">No. of Projects Completed</th>
                                <th style="width: 10%; text-align: center;">No. of Villages Completed</th>
                                <th style="width: 10%; text-align: center;">No. of Projects Completed</th>
                                <th style="width: 10%; text-align: center;">No. of Villages Completed</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StateName")%>' CommandName="Select1A" OnCommand="lnkName_Command"></asp:LinkButton></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfProject")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillage")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfProjectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfProjectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StateName")%>' CommandName="Select1A" OnCommand="lnkName_Command"></asp:LinkButton></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfProject")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillage")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfProjectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfProjectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>Total:</td>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><%=_totalNosOfProject %></td>
                            <td style="text-align: right;"><%=_totalNosOfVillage %></td>
                            <td style="text-align: right;"><%=_totalNosOfProjectStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfVillageStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfProjectStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfVillageStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectRectified %></td>
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
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;">Sl#</th>
                                <th style="width: 35%; text-align: center;">Name of District</th>
                                <th style="width: 10%; text-align: center;">Total No. of Villages As Per Scope</th>
                                <th style="width: 10%; text-align: center;">No. of Villages Completed (Stage-I)</th>
                                <th style="width: 10%; text-align: center;">No. of Villages Completed (Stage-II)</th>
                                <th style="width: 10%; text-align: center;">No. of Discrepancies Observed Under Stage-I</th>
                                <th style="width: 10%; text-align: center;">No. of Discrepancies Observed Under Stage-II</th>
                                <th style="width: 10%; text-align: center;">No. of Discrepancies Rectified</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DistrictName")%>' CommandName="Select1B" OnCommand="lnkName_Command"></asp:LinkButton></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillage")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DistrictName")%>' CommandName="Select1B" OnCommand="lnkName_Command"></asp:LinkButton></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillage")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>Total:</td>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><%=_totalNosOfVillage %></td>
                            <td style="text-align: right;"><%=_totalNosOfVillageStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfVillageStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectRectified %></td>
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
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;">Sl#</th>
                                <th style="width: 35%; text-align: center;">Name of Block</th>                                
                                <th style="width: 12%; text-align: center;">No. of Villages Completed (Stage-I)</th>
                                <th style="width: 12%; text-align: center;">No. of Villages Completed (Stage-II)</th>
                                <th style="width: 12%; text-align: center;">No. of Discrepancies Observed Under Stage-I</th>
                                <th style="width: 12%; text-align: center;">No. of Discrepancies Observed Under Stage-II</th>
                                <th style="width: 12%; text-align: center;">No. of Discrepancies Rectified</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlockName")%>' CommandName="Select1C" OnCommand="lnkName_Command"></asp:LinkButton></td>                            
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlockName")%>' CommandName="Select1C" OnCommand="lnkName_Command"></asp:LinkButton></td>                            
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfVillageStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>Total:</td>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><%=_totalNosOfVillageStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfVillageStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectRectified %></td>
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
                        <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width: 100%">
                            <tr class="repeaterheader">
                                <th style="width: 5%; text-align: center;">Sl#</th>
                                <th style="width: 35%; text-align: center;">Name of Village</th>
                                <th style="width: 12%; text-align: center;">No. of Discrepancies Observed Under Stage-I</th>
                                <th style="width: 12%; text-align: center;">No. of Discrepancies Observed Under Stage-II</th>
                                <th style="width: 12%; text-align: center;">No. of Discrepancies Rectified</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "VillageName")%></td>                            
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "VillageName")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageI")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectStageII")%></td>
                            <td style="text-align: right;"><%# DataBinder.Eval(Container.DataItem, "NosOfDefectRectified")%></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        <tr class="repeaterfooter">
                            <td>Total:</td>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageI %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectStageII %></td>
                            <td style="text-align: right;"><%=_totalNosOfDefectRectified %></td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </fieldset>
    </center>
</asp:Content>
