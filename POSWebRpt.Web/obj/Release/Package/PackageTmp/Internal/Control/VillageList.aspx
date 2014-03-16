<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VillageList.aspx.cs" Inherits="REC.Web.Internal.Control.VillageList"
    MasterPageFile="~/Internal/REC.Master" Title=":: RQM :: Village Master" %>

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
    <div id="pageheader">VILLAGE MASTER</div>
    <center>
        <div style="width: 700px;">
            <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <fieldset style="width: 100%;">
                        <legend>Search Village</legend>
                        <table border="0" cellpadding="0" cellspacing="0" class="searchpanel">
                            <tr>
                                <td class="label" style="padding-right: 5px;">State:</td>
                                <td style="padding-right: 20px;"><asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" TabIndex="1" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList></td>
                                <td class="label" style="padding-right: 5px;">Village:</td>
                                <td><asp:TextBox ID="txtVillageName" runat="server" MaxLength="100" TabIndex="4" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="label" style="padding-right: 5px;padding-top:10px;">District:</td>
                                <td style="padding-right: 20px;padding-top:10px;"><asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="true" TabIndex="2" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"></asp:DropDownList></td>
                                <td class="label" style="padding-right: 5px;padding-top:10px;">Census Code:</td>
                                <td style="padding-top:10px;"><asp:TextBox ID="txtCensusCode" runat="server" MaxLength="20" TabIndex="5" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="label" style="padding-right: 5px;padding-top:10px;">Block:</td>
                                <td style="padding-right: 20px;padding-top:10px;"><asp:DropDownList ID="ddlBlock" runat="server" AutoPostBack="false" TabIndex="3"></asp:DropDownList></td>
                                <td style="padding-right: 5px;padding-top:10px;">&nbsp;</td>
                                <td style="padding-top:10px;"><asp:Button ID="btnSearch" runat="server" Text="Search" TabIndex="6" OnClick="btnSearch_Click" /></td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset style="width: 100%;">
                        <legend>Village Master </legend>
                        <div class="listpanelheader">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 120px;">Results Per Page:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlPaging" runat="server" Width="65px" AutoPostBack="true" TabIndex="7" OnSelectedIndexChanged="ddlPaging_SelectedIndexChanged">
                                            <asp:ListItem Text="10" Value="10" />
                                            <asp:ListItem Text="30" Value="30" />
                                            <asp:ListItem Text="50" Value="50" />
                                            <asp:ListItem Text="100" Value="100" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;">
                                        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" TabIndex="8" ToolTip="Click to add new District" OnClick="lnkAdd_Click" />
                                        <asp:LinkButton ID="lnkAdd" runat="server" ToolTip="Click to add new village" TabIndex="9" OnClick="lnkAdd_Click">Add New Village</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="listpanel">
                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                BorderStyle="None" BorderWidth="0" Width="100%" TabIndex="10" OnRowDataBound="gvwList_RowDataBound"
                                OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Village(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                        <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="17%" HorizontalAlign="Left" />
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHState" runat="server" CommandName="Sort" CommandArgument="StateName" Text="State" ToolTip="Click to sort by state"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="District">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="19%" HorizontalAlign="Left" />
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHDistrict" runat="server" CommandName="Sort" CommandArgument="DistrictName" Text="District" ToolTip="Click to sort by district"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Block">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="19%" HorizontalAlign="Left" />
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHBlock" runat="server" CommandName="Sort" CommandArgument="BlockName" Text="Block" ToolTip="Click to sort by block"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Village">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="19%" HorizontalAlign="Left" />
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHVillage" runat="server" CommandName="Sort" CommandArgument="VillageName" Text="Village" ToolTip="Click to sort by village"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Census Code">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif" ImageAlign="Middle" Height="16" Width="16" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif" ImageAlign="Middle" VerticalAlign="Middle" Height="16" Width="16" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </center>
</asp:Content>
