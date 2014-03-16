<%@ Page Title=":: RQM :: Push Message List" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="PushMessageList.aspx.cs" Inherits="REC.Web.Internal.Security.PushMessageList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
    <div id="pageheader">PUSH MESSAGE</div>
    <center>
        <div style="width: 800px;">
            <fieldset style="width: 100%;">
                <legend>Search Message</legend>
                <table border="0" cellpadding="0" cellspacing="0" class="searchpanel">
                    <tr>
                        <td class="label" style="padding:0px 5px 5px 0px;">From Date:</td>
                        <td style="padding:0px 35px 5px 0px;">
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="textbox" Width="70px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="meeFromDt" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtFromDate"></cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="mevFromDt" runat="server" CssClass="errormessage" ControlExtender="meeFromDt" ControlToValidate="txtFromDate" ValidationGroup="vGroup" Display="Dynamic"></cc1:MaskedEditValidator>
                            <asp:RangeValidator ID="rvFromDt" runat="server" CssClass="errormessage" ControlToValidate="txtFromDate" ValidationGroup="vGroup" Display="Dynamic" Type="Date"></asp:RangeValidator>
                        </td>
                        <td class="label" style="padding:0px 5px 5px 0px;">To Date:</td>
                        <td style="padding:0px 0px 5px 0px;">
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="textbox" Width="70px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="meeToDt" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtToDate"></cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="mevToDt" runat="server" CssClass="errormessage" ControlExtender="meeToDt" ControlToValidate="txtToDate" ValidationGroup="vGroup" Display="Dynamic"></cc1:MaskedEditValidator>
                            <asp:RangeValidator ID="rvToDt" runat="server" CssClass="errormessage" ControlToValidate="txtToDate" ValidationGroup="vGroup" Display="Dynamic" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label" style="padding:0px 5px 0px 0px;">Recipient:</td>
                        <td style="padding:0px 35px 0px 0px;"><asp:DropDownList ID="ddlRecipient" runat="server"><asp:ListItem Value="0" Text="All"></asp:ListItem></asp:DropDownList></td>
                        <td style="padding:0px 5px 0px 0px;"></td>
                        <td style="padding:0px 0px 0px 0px;"><asp:Button ID="btnSearch" runat="server" Text="Search" ToolTip="Click to search" OnClick="btnSearch_Click" /></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>Message List</legend>
                <div class="listpanelheader">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="width:120px;">Results Per Page:</td>
                            <td>
                                <asp:DropDownList ID="ddlPaging" runat="server" Width="65px" AutoPostBack="true" OnSelectedIndexChanged="ddlPaging_SelectedIndexChanged">
                                    <asp:ListItem Text="10" Value="10" />
                                    <asp:ListItem Text="30" Value="30" />
                                    <asp:ListItem Text="50" Value="50" />
                                    <asp:ListItem Text="100" Value="100" />
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;">
                                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" ToolTip="Click to send new message" OnClick="lnkAdd_Click" />
                                <asp:LinkButton ID="lnkAdd" runat="server" ToolTip="Click to send new message" OnClick="lnkAdd_Click">Send New Message</asp:LinkButton>    
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="listpanel">
                    <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkAdd" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="ddlPaging" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                BorderStyle="None" BorderWidth="0" Width="100%" OnRowDataBound="gvwList_RowDataBound"
                                OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Push Message(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right"/>
                                        <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recipient">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="11%" HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Message">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="41%" HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sender">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left"/>                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Center" VerticalAlign="Middle" />
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
        </div>
    </center>
</asp:Content>
