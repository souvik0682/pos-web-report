<%@ Page Title=":: RQM :: Login Tracker" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="VisitCounter.aspx.cs" Inherits="REC.Web.Internal.Security.VisitCounter" %>

<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose"><img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage"></div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgList" runat="server" AssociatedUpdatePanelID="uPnlList">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">LOGIN TRACKER</div>
    <center>
        <div style="width: 850px;">
            <fieldset style="width: 100%;">
                <legend>Search</legend>
                <div class="listpanelheader">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 80px;">From Date:</td>
                            <td style="width: 150px;">
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="textbox" Width="70px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="meeFromDt" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtFromDate"></cc1:MaskedEditExtender>
                                <cc1:MaskedEditValidator ID="mevFromDt" runat="server" CssClass="errormessage" ControlExtender="meeFromDt" ControlToValidate="txtFromDate" ValidationGroup="vGroup" Display="Dynamic"></cc1:MaskedEditValidator>
                                <asp:RangeValidator ID="rvFromDt" runat="server" CssClass="errormessage" ControlToValidate="txtFromDate" ValidationGroup="vGroup" Display="Dynamic" Type="Date"></asp:RangeValidator>
                            </td>
                            <td style="width: 80px;">To Date:</td>
                            <td style="width: 150px;">
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="textbox" Width="70px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="meeToDt" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtToDate"></cc1:MaskedEditExtender>
                                <cc1:MaskedEditValidator ID="mevToDt" runat="server" CssClass="errormessage" ControlExtender="meeToDt" ControlToValidate="txtToDate" ValidationGroup="vGroup" Display="Dynamic"></cc1:MaskedEditValidator>
                                <asp:RangeValidator ID="rvToDt" runat="server" CssClass="errormessage" ControlToValidate="txtToDate" ValidationGroup="vGroup" Display="Dynamic" Type="Date"></asp:RangeValidator>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>Login Detail</legend>
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
                        </tr>
                    </table>
                </div>
                <div class="listpanel">
                    <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlPaging" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <div style="padding-bottom:10px;">
                                <span class="labelstrong" style="font-style:italic;">Total no. of Hits:</span>&nbsp;<asp:Label ID="lblTotalHit" runat="server" CssClass="labelstrong"></asp:Label>
                            </div>
                            <asp:GridView ID="gvwVisitCounter" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                BorderStyle="None" BorderWidth="0px" OnPageIndexChanging="gvwVisitCounter_PageIndexChanging"
                                OnRowDataBound="gvwVisitCounter_RowDataBound" Width="100%">
                                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No data found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl No.">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Right" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IP Address">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="12%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="19%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="18%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Successful">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="8%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Browser Name">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="13%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Browser Type">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="9%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Browser Version">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="7%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Browser Platform">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="9%" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </fieldset>
        </div>
    </center>
</asp:Content>
