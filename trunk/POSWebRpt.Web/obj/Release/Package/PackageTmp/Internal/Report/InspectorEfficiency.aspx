<%@ Page Title=":: RQM :: Inspector Efficienty Report" Language="C#" AutoEventWireup="true" CodeBehind="InspectorEfficiency.aspx.cs" MasterPageFile="~/Internal/REC.Master" Inherits="REC.Web.Internal.Report.InspectorEfficiency" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc" %>
<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="<%# ResolveUrl("~/JS/CalendarControl.js") %>" type="text/javascript"></script>
<link href="../../CSS/Calendar.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
    pathToImages = '../../Images/';
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">
        <%--STATE WISE DEFECT<asp:ImageButton ID="btnPrint" runat="server" ImageUrl="~/Images/print_icon.png"
            Style="text-align: right; float: right" OnClick="btnPrint_Click" />--%>
            <uc:Navigation ID="ucNav" runat="server" HeaderText="EFFICIENCY OF INSPECTORS"  ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" />
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
    <asp:HiddenField ID="hdnInspectorId" runat="server" />
    
    <center>
    <fieldset style="width: 850px;">
            <legend>Inspector Efficiency</legend>
            <table border="0">
                <tr id="trInspector" runat="server" style="display: none;">
                    <td style="padding: 0px 0px 5px 0px; width: 70px;" class="labelstrong">
                        Inspector:
                    </td>
                    <td style="padding: 0px 0px 5px 0px;" class="label">
                        <asp:Label ID="lblInspector" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr id ="trDate" runat="server">
                <td><asp:Label ID="lblStDate" class="labelstrong" runat="server" Text="From Date :"></asp:Label><%--<span class="mandatorysymbol">*</span>--%> </td>
                <td><asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>&nbsp;<img id="imgStartDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/></td>
                <td><asp:Label ID="lblEndDate" class="labelstrong" runat="server" Text="To Date :"></asp:Label><%--<span class="mandatorysymbol">*</span>--%> </td>
                <td><asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>&nbsp;<img id="imgEndDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/></td>
                <td><asp:Button ID="btnShow" Text="Show" runat="server" ValidationGroup="Show" onclick="btnShow_Click" /></td>
                </tr>
                <tr>
                <td colspan="2">
                <%--<asp:RequiredFieldValidator ID="rfvInspectionStDate" runat="server" CssClass="errormessage"
                 ControlToValidate="txtStartDate"  Display="Dynamic" ForeColor=""
                 SetFocusOnError="True" ValidationGroup="Show"></asp:RequiredFieldValidator>--%>
                
                </td>
                <td colspan="3">
                <%--<asp:RequiredFieldValidator ID="rfvInspectionEndDate" runat="server" CssClass="errormessage"
                 ControlToValidate="txtEndDate" Display="Dynamic" ForeColor=""
                 SetFocusOnError="True" ValidationGroup="Show"></asp:RequiredFieldValidator>--%>
                
                </td>
                </tr>
                <tr id ="trDt" runat="server" style="display:none">
                <td><asp:Label ID="lblStDt" class="labelstrong" runat="server" Text="From Date:"></asp:Label></td>
                <td><asp:Label ID="lblStartDate" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="lblEndDt" class="labelstrong" runat="server" Text="To Date :"></asp:Label></td>
                <td><asp:Label ID="lblEndDatee" runat="server" Text=""></asp:Label></td>
                <td>&nbsp;</td>
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
                                    Inspector Id
                                </th>
                                <th style="width: 52%; text-align: center;" rowspan="1">
                                    Inspector Name
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="1">
                                    Nos. of Inspection Allotted
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="1">
                                    Nos. of Inspection Completed
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                   Average Inspection Time     
                               </th>
                                <th style="width: 10%; text-align: center;" rowspan="1">
                                    Efficiency (%)
                                </th>
                                
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "InspectorId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Inspector")%>'
                                    CommandName="Select1A" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblAlloted" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblCompleted" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblAvgTime" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblEfficiency" runat="server"></asp:Label>
                            </td>
                    </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "InspectorId")%>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Inspector")%>'
                                    CommandName="Select1A" OnCommand="lnkName_Command"></asp:LinkButton>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblAlloted" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblCompleted" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblAvgTime" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="lblEfficiency" runat="server"></asp:Label>
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
                                <%=_totalInspectionAlloted%>
                            </td>
                            <td style="text-align: right;">
                                <%=_totalInspectionCompleted%>
                            </td>
                            <td style="text-align: right;">
                               <%--<%=_totalAvgInsTime%>--%>
                            </td>
                            <td style="text-align: right;">
                               <%--<%=_totalEfficiency%>--%>
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
                                <th style="width: 3%; text-align: center;" rowspan="1">
                                    Sl#
                                </th>
                                <th style="width: 5%; text-align: center; display: none" rowspan="1">
                                    Inspector Id
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="1">
                                   Schedule Date
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="1">
                                   Actual Inspection Date
                                </th>
                                <th style="width: 10%; text-align: center;" rowspan="1">
                                   Submission Date
                                </th>
                                <th style="width: 9%; text-align: center;" rowspan="1">
                                    Inspection Type  
                                </th>
                                <th style="width: 12%; text-align: center;" rowspan="1">
                                    State Name   
                                </th>
                                <th style="width: 12%; text-align: center;" rowspan="1">
                                   District Name   
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                   Block Name  
                                </th>
                                <th style="width: 13%; text-align: center;" rowspan="1">
                                   Village Name 
                                </th>
                                <th style="width: 8%; text-align: center;" rowspan="1">
                                    Status
                                </th>
                              </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="repeateritem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "InspectorId")%>
                            </td>
                            <td style="text-align: right">
                               <asp:Label ID="lblSchDate" runat="server"></asp:Label> 
                            </td>
                            <td style="text-align: right">
                               <asp:Label ID="lblInsDate" runat="server"></asp:Label> 
                            </td>
                            <td style="text-align: right">
                               <asp:Label ID="lblSubDate" runat="server"></asp:Label> 
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "InsType")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "StatetName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "DistrictName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "BlockName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "VillageName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "Status")%>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="repeateralternateitem">
                            <td style="text-align: right;">
                                <asp:Label ID="lblSlNo" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right; display: none">
                                <%# DataBinder.Eval(Container.DataItem, "InspectorId")%>
                            </td>
                            <td style="text-align: right">
                               <asp:Label ID="lblSchDate" runat="server"></asp:Label> 
                            </td>
                            <td style="text-align: right">
                                <asp:Label ID="lblInsDate" runat="server"></asp:Label> 
                            </td>
                            <td style="text-align: right">
                               <asp:Label ID="lblSubDate" runat="server"></asp:Label> 
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "InsType")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "StatetName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "DistrictName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "BlockName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "VillageName")%>
                            </td>
                            <td style="text-align: left;">
                                <%# DataBinder.Eval(Container.DataItem, "Status")%>
                            </td>
                        </tr>
                     
                    </AlternatingItemTemplate>
                     <FooterTemplate>
                     <tr class="repeaterfooter">
                            <td style="width: 50px;">
                              &nbsp;  
                            </td>
                            <td style="text-align: right; display: none">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                              &nbsp; 
                            </td>
                            <td style="text-align: right;">
                              &nbsp; 
                            </td>
                            <td style="text-align: right;">
                              &nbsp; 
                            </td>
                            <td style="text-align: right;">
                               &nbsp;
                            </td>
                            <td style="text-align: right;">
                               &nbsp;
                            </td>
                            <td style="text-align: right;">
                              &nbsp;
                            </td>
                            <td style="text-align: right;">
                             &nbsp;
                            </td>
                            <td style="text-align: right;">
                             &nbsp;
                            </td>
                            <td style="text-align: right;">
                             &nbsp;
                            </td>

                        </tr>



                     </table>
                     </FooterTemplate>
                   </asp:Repeater>
            </div>
        </fieldset>
    </center>
</asp:Content>