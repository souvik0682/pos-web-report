<%@ Page Title=":: RQM :: Electrification Status of Public facilities" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="PublicFacilityList.aspx.cs" Inherits="REC.Web.Internal.Inspection.PublicFacilityList" %>
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
    <div id="pageheader">ELECTRIFICATION OF PUBLIC FACILITIES</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 650px;">
                    <legend>Comment</legend>
                    <table border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td class="label" style="width:80px;">Comment:</td>
                            <td><asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>
                            <td><asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2"><asp:RequiredFieldValidator ID="rfvComment" runat="server" CssClass="errormessage" ControlToValidate="txtComment" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset style="width: 650px;">
                    <legend>Electrification Detail</legend>
                    <div class="listpanelheader">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="width: 120px;">Results Per Page:</td>
                                <td>
                                    <asp:DropDownList ID="ddlPaging" runat="server" Width="65px" AutoPostBack="true" OnSelectedIndexChanged="ddlPaging_SelectedIndexChanged">
                                        <asp:ListItem Text="10" Value="10" />
                                        <asp:ListItem Text="30" Value="30" />
                                        <asp:ListItem Text="50" Value="50" />
                                        <asp:ListItem Text="100" Value="100" />
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: right;">
                                    <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" ToolTip="Click to add new public facility" OnClick="lnkAdd_Click" />
                                    <asp:LinkButton ID="lnkAdd" runat="server" ToolTip="Click to add new public facility" OnClick="lnkAdd_Click">Add New Facility</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="listpanel">
                        <asp:UpdatePanel ID="uPnlStatus" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlPaging" EventName="SelectedIndexChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                    BorderStyle="None" BorderWidth="0" Width="100%" OnRowDataBound="gvwList_RowDataBound"
                                    OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                                    <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                    <PagerStyle CssClass="gridviewpager" />
                                    <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                    <EmptyDataTemplate>
                                        No Data Found
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl#">
                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                            <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Public Facility">
                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                            <ItemStyle CssClass="gridviewitem" Width="22%" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Facility Exists">
                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                            <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Access available">
                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                            <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Access available but not charged">
                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                            <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Electrified">
                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                            <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle CssClass="gridviewheader" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif" ImageAlign="Middle" Height="16" Width="16" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <HeaderStyle CssClass="gridviewheader" />
                                            <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif" ImageAlign="Middle" Height="16" Width="16" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
