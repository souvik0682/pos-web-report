<%@ Page Title=":: RQM :: Inspection Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="InspectionEdit.aspx.cs" Inherits="REC.Web.Internal.Inspection.InspectionEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../CSS/Calendar.css" rel="stylesheet" type="text/css" />
    <script src="<%# ResolveUrl("~/JS/CalendarControl.js") %>" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        pathToImages = '../../Images/';
    </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage"></div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgItem" runat="server" AssociatedUpdatePanelID="uPnlItem">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">ADD / EDIT INSPECTION</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" />                     
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>                
                        <fieldset style="width: 570px;">
                            <legend>General Information</legend>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td class="label">Inspection Type:<span class="mandatorysymbol">*</span></td>
                                    <td style="width: 140px;">
                                        <asp:DropDownList ID="ddlInspectionType" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="ddlInspectionType_SelectedIndexChanged">
                                         </asp:DropDownList>
                                    </td>
                                    <td class="label" style="width: 130px;">
                                        <asp:Label ID="lblInsDate" runat="server" Text="Stage-1 Inspection:"></asp:Label>
                                        <span class="mandatorysymbol" id="spanInsDate"><asp:Label ID="spanLbl" runat="server" Text=""></asp:Label></span></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlInspectionDate" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label" style="width: 140px;">
                                        &nbsp;</td>
                                    <td style="width: 140px;">
                                       <asp:RequiredFieldValidator ID="rfvInsType" runat="server" 
                                            ControlToValidate="ddlInspectionType" CssClass="errormessage" InitialValue="0" 
                                            ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                    <td class="label" style="width: 130px;">
                                        &nbsp;</td>
                                    <td style="width: 150px;">
                                        <%--<asp:RequiredFieldValidator ID="rfvInsDate" runat="server" 
                                            ControlToValidate="ddlInspectionDate" CssClass="errormessage" InitialValue="0" 
                                            ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label" style="width: 140px;">
                                        Schedule Date:<span class="mandatorysymbol">*</span></td>
                                    <td style="width: 140px;">
                                        <asp:TextBox ID="txtScheduleDate" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                        &nbsp;<img id="imgScheduleDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/>
                                    </td>
                                    <td class="label" style="width: 130px;">
                                        End Date:</td>
                                    <td style="width: 150px;">
                                        <asp:TextBox ID="txtEndDate" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                        &nbsp;<img id="imgEndDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvScheduleDate" runat="server" ControlToValidate="txtScheduleDate" CssClass="errormessage"  ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="label">Inspection Date</td>
                                    <td>
                                        <asp:TextBox ID="txtInsDate" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                        &nbsp;<img id="imgInsDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/>
                                    </td>
                                    <td class="label" style="width: 140px;">Submission Date:</td>
                                    <td style="width: 150px;">
                                        <asp:TextBox ID="txtSubDate" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                        &nbsp;<img id="imgSubDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Call Reference Date:<span class="mandatorysymbol">*</span></td>
                                    <td>
                                        <asp:TextBox ID="txtCallRefDate" runat="server" Width="75px"></asp:TextBox>
                                        &nbsp;<img id="imgCallRefDate" runat="server" src="../../Images/Calendar.png" class="calender" alt="Show Calendar" title="Show Calendar" align="middle"/>
                                    </td>
                                    <td class="label">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:RequiredFieldValidator ID="rfvCallRefDate" runat="server" ControlToValidate="txtCallRefDate" CssClass="errormessage"  ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="label">Call Reference No:<span class="mandatorysymbol">*</span></td>
                                    <td colspan="2"><asp:TextBox ID="txtCallRefNo" runat="server" MaxLength="50" Width="240px"></asp:TextBox></td>                                    
                                    <td><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="Save" /></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>                                    
                                    <td><asp:RequiredFieldValidator ID="rfvCallRefNo" runat="server" ControlToValidate="txtCallRefNo" CssClass="errormessage"  ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset style="width: 580px;">
                            <legend>Add Inspector</legend>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td class="label">Inspector:<span class="mandatorysymbol">*</span></td>
                                    <td><asp:DropDownList ID="ddlInspector" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                                    <td><asp:Button ID="btnInspector" runat="server" Text="Add Inspector" OnClick="btnInspector_Click" ValidationGroup="AddInspector" /></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><asp:RequiredFieldValidator ID="rfvInspector" runat="server" ControlToValidate="ddlInspector" InitialValue="0" CssClass="errormessage" ValidationGroup="AddInspector"></asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset style="width: 580px;">
                            <legend>Inspector List</legend>
                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="false" BorderStyle="None" BorderWidth="0" Width="100%" OnRowDataBound="gvwList_RowDataBound" OnRowCommand="gvwList_RowCommand">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Inspector(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                        <ItemStyle CssClass="gridviewitem" Width="8%" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inspector">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="54%" HorizontalAlign="Left" />                                                
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="30%" HorizontalAlign="Left" />                                                
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif" ImageAlign="Middle" Height="16" Width="16" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
