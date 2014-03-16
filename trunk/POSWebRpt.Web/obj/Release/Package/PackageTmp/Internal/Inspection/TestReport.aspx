<%@ Page Title=":: RQM :: Test Report" Language="C#" AutoEventWireup="true" CodeBehind="TestReport.aspx.cs"
    MasterPageFile="~/Internal/REC.Master" Inherits="REC.Web.Internal.Inspection.TestReport" %>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div id="pageheader">TEST REPORT</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 650px;">
                    <legend>Checking of Test Report</legend>
                    <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>  
                            <asp:GridView ID="gvwTestReport" runat="server" AutoGenerateColumns="false" AllowPaging="false"
                                BorderStyle="None" BorderWidth="0" Width="100%" TabIndex="10" 
                                OnRowDataBound="gvwTestReport_RowDataBound">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Test Report(s) Found
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
                                    <asp:TemplateField HeaderText="TestReportId" Visible="false">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblTestReportId" runat="server" BorderStyle="None"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ItemGroupId" Visible="false">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemGroupId" runat="server" BorderStyle="None"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Item Group">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="35%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemGroupName" runat="server" BorderStyle="None"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discrepancy">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="59%" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtDiscrepancy" runat="server" Width="98%" MaxLength="100" ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>                
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   <div class="buttonpanel"><asp:Button ID="btnSave" runat="server" CssClass="button" Text="Save" OnClick="btnSave_Click" /></div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
