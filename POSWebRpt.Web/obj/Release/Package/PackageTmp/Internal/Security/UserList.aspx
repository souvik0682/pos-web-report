<%@ Page Title=":: RQM :: User Master" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="REC.Web.Internal.Security.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
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
        USER MASTER</div>
    <center>
        <div style="width: 900px;">
            <fieldset style="width: 100%;">
                <legend>Search User</legend>
                <table border="0" cellpadding="0" cellspacing="0" class="searchpanel">
                    <tr>
                        <td class="label" style="padding-right:5px;">User Name:</td>
                        <td style="padding-right:25px;"><asp:TextBox ID="txtName" runat="server" MaxLength="100" Width="200"></asp:TextBox></td>
                        <td class="label" style="padding-right:5px;">User Group:</td>
                        <td style="padding-right:5px;"><asp:DropDownList ID="ddlGroup" runat="server"></asp:DropDownList></td>
                        <td><asp:Button ID="btnSearch" runat="server" Text="Search" ToolTip="Click to search" OnClick="btnSearch_Click" /></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>User List</legend>
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
                                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" ToolTip="Click to add new user" OnClick="lnkAdd_Click" />
                                <asp:LinkButton ID="lnkAdd" runat="server" ToolTip="Click to add new user" OnClick="lnkAdd_Click">Add New User</asp:LinkButton>    
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
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No User(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right"/>
                                        <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="13%" HorizontalAlign="Left"/>
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHUserName" runat="server" CommandName="Sort" CommandArgument="UserName" Text="User Name" ToolTip="Click to sort by Username"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="21%" HorizontalAlign="Left"/>
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHName" runat="server" CommandName="Sort" CommandArgument="Name" Text="Name" ToolTip="Click to sort by name"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Group">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="12%" HorizontalAlign="Left"/>
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHGroup" runat="server" CommandName="Sort" CommandArgument="GroupName" Text="User Group" ToolTip="Click to sort by User Group"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="E-Mail">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="22%" HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Is Active">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left"/>
                                        <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Is Deleted">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="12%" />
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="">
                                        <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif"
                                                ImageAlign="Middle" Height="16" Width="16" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="4%" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif"
                                                ImageAlign="Middle" Height="16" Width="16" />
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
