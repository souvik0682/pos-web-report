<%@ Page Title=":: RQM :: Block Master" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="BlockList.aspx.cs" Inherits="REC.Web.Internal.Control.BlockList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
<asp:HiddenField ID="hdnValid" runat="server" />
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
    <div id="pageheader">BLOCK MASTER</div>
    <center>
        <div style="width:650px; margin-right: 0px;"> 
            <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                <ContentTemplate>                                                                                                                                                                            
                    <fieldset style="width: 100%;">
                        <legend>Search District</legend>
                        <table border="0" cellpadding="0" cellspacing="0" class="searchpanel">
                            <tr>
                                <td class="label" style="padding-right:5px;">State:</td>
                                <td style="padding-right:20px;"><asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList></td>
                                <td class="label" style="padding-right:5px;">District:</td>
                                <td>
                                   <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="false" Width="150px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="label" style="padding-right:5px;padding-top:10px;">Block:</td>
                                <td style="padding-right:20px;padding-top:10px;"><asp:TextBox ID="txtBlockName" runat="server" MaxLength="100" Width="200"></asp:TextBox></td>
                                <td class="label" style="padding-right:5px;padding-top:10px;"></td>
                                <td style="padding-top:10px;"><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
                            </tr>
                        </table>                
                    </fieldset>
                    <fieldset style="width: 100%;">
                        <legend>Block Master </legend>           
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
                                        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" ToolTip="Click to add new Block" OnClick="lnkAdd_Click" />
                                        <asp:LinkButton ID="lnkAdd" runat="server" ToolTip="Click to add new Block" OnClick="lnkAdd_Click">Add New Block</asp:LinkButton>    
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="listpanel">
                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true" BorderStyle="None" BorderWidth="0" Width="100%" OnRowDataBound="gvwList_RowDataBound" OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Block(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                        <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Right"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Block">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="25%" HorizontalAlign="Left"/>    
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHBlock" runat="server" CommandName="Sort" CommandArgument="BlockName" Text="Block" ToolTip="Click to sort by block"></asp:LinkButton>
                                        </HeaderTemplate>                                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="District">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="22%" HorizontalAlign="Left"/>
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHDist" runat="server" CommandName="Sort" CommandArgument="DistrictName" Text="District" ToolTip="Click to sort by district"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>                                                
                                    <asp:TemplateField HeaderText="State">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left"/>
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lnkHState" runat="server" CommandName="Sort" CommandArgument="StateName" Text="State" ToolTip="Click to sort by state"></asp:LinkButton>
                                        </HeaderTemplate>
                                    </asp:TemplateField>                                               
                                    <asp:TemplateField HeaderText="CensusCode">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="15%" HorizontalAlign="Left"/>                                                    
                                    </asp:TemplateField>                                            
                                    <asp:TemplateField HeaderText="">
                                        <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif" ImageAlign="Middle" Height="16" Width="16" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Center" />
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
