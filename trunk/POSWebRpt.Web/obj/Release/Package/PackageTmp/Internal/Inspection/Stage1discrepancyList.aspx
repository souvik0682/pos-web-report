<%@ Page Language="C#" Title=":: RQM :: Stage1 Discrepancy List" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="Stage1discrepancyList.aspx.cs" Inherits="REC.Web.Internal.Inspection.Stage1discrepancyList" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">
        STAGE 1 DISCREPANCIES LIST</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel">
                    <a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <div style="width: 650px;">
                    <fieldset style="width: 100%;">
                        <legend>General Observations</legend>
                        <div class="listpanelheader">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 120px;">
                                        Results Per Page:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlPaging" runat="server" Width="65px" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlPaging_SelectedIndexChanged">
                                            <asp:ListItem Text="10" Value="10" />
                                            <asp:ListItem Text="30" Value="30" />
                                            <asp:ListItem Text="50" Value="50" />
                                            <asp:ListItem Text="100" Value="100" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <div class="listpanel">
                            <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
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
                                            No Defect(s) Found
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl#">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                                <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Right" />
                                                <ItemTemplate>
                                                <asp:HiddenField ID="hdnId" runat="server" />
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Category">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="36%" HorizontalAlign="Left" />
                                                <HeaderTemplate>
                                                    <asp:LinkButton ID="lnkHCategory" runat="server" CommandName="Sort" CommandArgument="CatName"
                                                        Text="Category" ToolTip="Click to sort by Category"></asp:LinkButton>
                                                </HeaderTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Defects / Discrepency Observed">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="30%" HorizontalAlign="Left" />
                                                <HeaderTemplate>
                                                    <asp:LinkButton ID="lnkHDefects" runat="server" CommandName="Sort" CommandArgument="DefDesc"
                                                        Text="Defects / Discrepency Observed" ToolTip="Click to sort by Defects/Discrepency"></asp:LinkButton>
                                                </HeaderTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location & Photo No.">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left" />
                                                <ItemTemplate>
                                                    <div id="dvPhoto" runat="server" style="padding-bottom: 5px;">
                                                        <asp:Repeater ID="repDoc" runat="server" OnItemDataBound="repDoc_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <table class="table">
                                                                <tr>
                                                                <th>Sl.</th>
                                                                <th>location</th>
                                                                <th>stage 1 photo</th>
                                                                <th>stage 2 photo</th>
                                                                <th>Status</th>
                                                                <th>&nbsp;</th>
                                                                </tr>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                
                                                                <tr>
                                                                    <td><asp:Label ID="lblPhotoNo" runat="server"></asp:Label></td>
                                                                    <td style="padding-right:10px;">
                                                                        <asp:Label ID="lblLocation" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkFileShow" runat="server" Text="View" CommandName="ShowFile" OnCommand="lnkFileShow_Command"></asp:LinkButton>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkFileShow2" runat="server" Text="View" CommandName="ShowFile" OnCommand="lnkFileShow2_Command"></asp:LinkButton>
                                                                    </td>
                                                                    <td>
                                                                    <asp:Label ID="lblRectifiedStatus" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" OnCommand="btnEdit_Command" ImageUrl="~/Images/edit.gif"
                                                                         ImageAlign="Middle" Height="16" Width="16" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <AlternatingItemTemplate>
                                                                    <td><asp:Label ID="lblPhotoNo" runat="server"></asp:Label></td>
                                                                    <td style="padding-right:10px;">
                                                                        <asp:Label ID="lblLocation" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkFileShow" runat="server" Text="View" CommandName="ShowFile" OnCommand="lnkFileShow_Command"></asp:LinkButton>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkFileShow2" runat="server" Text="View" CommandName="ShowFile" OnCommand="lnkFileShow_Command"></asp:LinkButton>
                                                                    </td>
                                                                    <td>
                                                                    <asp:Label ID="lblRectifiedStatus" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" OnCommand="btnEdit_Command" ImageUrl="~/Images/edit.gif"
                                                                        ImageAlign="Middle" Height="16" Width="16" />
                                                                    </td>
                                                                </tr>
                                                            </AlternatingItemTemplate>
                                                            <FooterTemplate>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Defect Detail Id" Visible="false">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                                                <HeaderTemplate>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                <asp:Label ID ="lblDefectDetail" runat="Server"></asp:Label> 
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Stage-2 Observations">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="30%" HorizontalAlign="Left" />
                                              <ItemTemplate>
                                                <asp:Label ID="lblRectifiedStatus" runat="server"></asp:Label>  
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <HeaderStyle CssClass="gridviewheader" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif"
                                                        ImageAlign="Middle" Height="16" Width="16" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <%--<asp:TemplateField HeaderText="">
                                                <HeaderStyle CssClass="gridviewheader" />
                                                <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif"
                                                        ImageAlign="Middle" Height="16" Width="16" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </fieldset>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>