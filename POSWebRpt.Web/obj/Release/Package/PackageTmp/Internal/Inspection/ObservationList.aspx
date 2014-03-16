<%@ Page Title=":: RQM :: Observations" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="ObservationList.aspx.cs" Inherits="REC.Web.Internal.Inspection.ObservationList" %>
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
    <asp:UpdateProgress ID="uProgObv" runat="server" AssociatedUpdatePanelID="uPnlObv">
        <ProgressTemplate> 
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">OBSERVATIONS</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 650px;">
                    <legend>Observations</legend>
                    <asp:UpdatePanel ID="uPnlObv" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                        <asp:GridView ID="gvwObservation" runat="server" AutoGenerateColumns="false" AllowPaging="false"
                                BorderStyle="None" BorderWidth="0" Width="100%" TabIndex="10" 
                                OnRowDataBound="gvwObservation_RowDataBound">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Observation(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                        <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSlno" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnId" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CatId" Visible="false">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblCatId" runat="server" BorderStyle="None"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Category Name">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="40%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblCatName" runat="server" BorderStyle="None"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=" No of Discrepancy">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="14%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblNoOfDiscrepancy" runat="server" Width="98%" MaxLength="100" ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discrepancy Nature">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left" />                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Suggestion">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left" />                                        
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>   
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
