<%@ Page Title=":: RQM :: Village Home" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="VillageHome.aspx.cs" Inherits="REC.Web.Internal.VillageHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgList" runat="server" AssociatedUpdatePanelID="uPnlList">
        <ProgressTemplate>
            <div class="progress">
                <div id="image">
                    <img src="../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">VILLAGE HOME</div>
    <center>
        <div style="width: 700px;">
            <fieldset style="width: 100%;">
                <legend>Village Summary</legend>            
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="labelstrong" style="width:12%;">Village</td>
                        <td style="width:38%;">:&nbsp;<asp:Label ID="lblVillage" runat="server" CssClass="label"></asp:Label></td>
                        <td class="labelstrong" style="width:18%;">Census Code</td>
                        <td style="width:32%;">:&nbsp;<asp:Label ID="lblCensus" runat="server" CssClass="label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="labelstrong">State</td>
                        <td class="label">:&nbsp;<asp:Label ID="lblState" runat="server" CssClass="label"></asp:Label></td>
                        <td class="labelstrong">BPL HH</td>
                        <td class="label">:&nbsp;<asp:Label ID="lblBPL" runat="server" CssClass="label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="labelstrong">District</td>
                        <td class="label">:&nbsp;<asp:Label ID="lblDist" runat="server" CssClass="label"></asp:Label></td>
                        <td class="labelstrong">APL HH</td>
                        <td class="label">:&nbsp;<asp:Label ID="lblAPL" runat="server" CssClass="label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="labelstrong">Block</td>
                        <td class="label">:&nbsp;<asp:Label ID="lblBlock" runat="server" CssClass="label"></asp:Label></td>
                        <td class="labelstrong">Total HH</td>
                        <td class="label">:&nbsp;<asp:Label ID="lblTot" runat="server" CssClass="label"></asp:Label></td>
                    </tr>
                </table>
                <div style="padding-top:10px;">
                    <asp:Button ID="btnConfig" runat="server" Text="Village Configuration" OnClientClick="javascript:window.location.href='Config/VillageInfo.aspx';return false;" />
                </div>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>Inspection List</legend>
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
                            <td style="text-align: right;">
                                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/add.png" Height="16" TabIndex="6" ToolTip="Click to add new inspection" OnClick="lnkAdd_Click" />
                                <asp:LinkButton ID="lnkAdd" runat="server" TabIndex="7" ToolTip="Click to add new inspection" OnClick="lnkAdd_Click">Add New Inspection</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="listpanel">
                    <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imgBtn" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkAdd" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="ddlPaging" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                BorderStyle="None" BorderWidth="0" Width="100%" TabIndex="8" OnRowDataBound="gvwList_RowDataBound"
                                OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Inspection(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl#">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                        <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inspection Type">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="11%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Schedule Date">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="14%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inspection Date">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="14%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Submission Date">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="14%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inspection Status">
                                        <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                        <ItemStyle CssClass="gridviewitem" Width="13%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemStyle CssClass="gridviewitem" Width="16%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle CssClass="gridviewheader" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkData" runat="server" CommandName="InsData" Text="Inspection Data" />
                                        </ItemTemplate>
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
