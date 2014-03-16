<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SafetyParameter.aspx.cs"
    Inherits="REC.Web.Internal.Inspection.SafetyParameter" Title=":: RQM :: Safety Parameter"
    MasterPageFile="~/Internal/REC.Master" %>

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
    <asp:UpdateProgress ID="uProgList" runat="server" AssociatedUpdatePanelID="uPnlList">
        <ProgressTemplate>
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">
        SAFETY PARAMETER</div>
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
                        <legend>Safety Parameter List</legend>
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
                                        OnPageIndexChanging="gvwList_PageIndexChanging">
                                        <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                        <PagerStyle CssClass="gridviewpager" />
                                        <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                        <EmptyDataTemplate>
                                            No Safety Parameter(s) Found
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl#">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                                <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Safety Questions">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="50%" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                <ItemStyle CssClass="gridviewitem" Width="35%" HorizontalAlign="Left" />
                                            </asp:TemplateField>
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
