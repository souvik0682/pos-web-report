<%@ Page Title=":: RQM :: Item Group Master" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="ItemGroupList.aspx.cs" Inherits="REC.Web.Internal.Control.ItemGroupList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose"><img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()"/></div>
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
    <div id="pageheader">ITEM GROUP MASTER</div>
    <center>
        <div style="width:550px;">  
            <fieldset style="width: 100%;">
                <legend>Search Item Group</legend>
                <table border="0" cellpadding="0" cellspacing="0" class="searchpanel">
                    <tr>
                        <td class="label" style="padding-right:5px;">Item Group Name:</td>
                        <td style="padding-right:5px;"><asp:TextBox ID="txtItemGroupName" runat="server" MaxLength="50" Width="200"></asp:TextBox></td>
                        <td><asp:Button ID="btnSearch" runat="server" Text="Search" ToolTip="Click to search" OnClick="btnSearch_Click" /></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>Item Group List </legend>            
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
                                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" ToolTip="Click to add new Item Group" OnClick="lnkAdd_Click" />
                                <asp:LinkButton ID="lnkAdd" runat="server" ToolTip="Click to add new Item Group" OnClick="lnkAdd_Click">Add New Item Group</asp:LinkButton>    
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="listpanel">
                    <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="ddlPaging" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>

                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true" BorderStyle="None" BorderWidth="0" Width="100%" OnRowDataBound="gvwList_RowDataBound" OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Item Group(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                        <ItemStyle CssClass="gridviewitem" Width="8%" HorizontalAlign="Right"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Group">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="76%" HorizontalAlign="Left"/> 
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHItemGroup" runat="server" CommandName="Sort" CommandArgument="ItemGroupName" Text="Item Group" ToolTip="Click to sort by Item Group"></asp:LinkButton>
                                        </HeaderTemplate>                                               
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemStyle CssClass="gridviewitem" Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif" ImageAlign="Middle" Height="16" Width="16" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="8%" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif" ImageAlign="Middle" VerticalAlign="Middle" Height="16" Width="16" />
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
