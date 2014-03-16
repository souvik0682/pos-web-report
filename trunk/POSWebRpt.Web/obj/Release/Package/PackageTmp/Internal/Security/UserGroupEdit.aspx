<%@ Page Title=":: RQM :: User Group Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="UserGroupEdit.aspx.cs" Inherits="REC.Web.Internal.Security.UserGroupEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 7%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgType" runat="server" AssociatedUpdatePanelID="uPnlType">
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
        ADD / EDIT USER GROUP
    </div>
    <center>
        <div style="width: 600px;">
            <fieldset style="width: 100%;">
               <%-- <legend>Search Category</legend>--%>
                <table style="width:100%;padding-top:10px;padding-bottom:10px;">
                    <tr>
                        <td class="label" align="left" style="width: 90px;">
                            User Group:<span class="mandatorysymbol">*</span>
                        </td>
                        <td style="width: 200px;">
                            <asp:TextBox ID="txtUserGroupName" runat="server" CssClass="label" MaxLength="50" Width="200"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="errormessage" ControlToValidate="txtUserGroupName" ValidationGroup="Save" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>ACTION LIST</legend>
                <asp:UpdatePanel ID="uPnlType" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                            BorderWidth="0px" Width="100%" OnRowDataBound="gvwList_RowDataBound">
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="gridviewpager" />
                            <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                            <EmptyDataTemplate>
                                No data found
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <HeaderStyle CssClass="gridviewheader" />
                                    <ItemStyle CssClass="gridviewitem" Width="25%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Page">
                                    <HeaderStyle CssClass="gridviewheader" />
                                    <ItemStyle CssClass="gridviewitem" Width="55%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View">
                                    <HeaderStyle CssClass="gridviewheader" />
                                    <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkViewList" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle CssClass="gridviewheader" />
                                    <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkEditList" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle CssClass="gridviewheader" />
                                    <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkDeleteList" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div style="width: 100%; padding-top: 10px;">
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='UserGroupList.aspx';return false;" />
                </div>
            </fieldset>
        </div>
    </center>
</asp:Content>