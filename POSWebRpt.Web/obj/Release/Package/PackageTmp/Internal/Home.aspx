<%@ Page Title=":: RQM :: Home" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="REC.Web.Internal.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        function initialize() {

        }
        window.onload = function () {
            initialize();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">DASHBOARD</div>
    <div id="dvSync" runat="server" style="padding: 5px 0px 5px 0px; display: none;">
        <table width="100%" class="synpanel">
            <tr>
                <td>
                    <div id="dvErrMsg" runat="server"></div>
                </td>
                <td style="text-align: right; width: 2%;">
                    <img alt="Click to close" src="../Images/Close-Button.bmp" title="Click to close" onclick="closeErrorPanel()" />
                </td>
            </tr>
        </table>
    </div>
    <div id="dvAsync" style="padding: 5px 0px 5px 0px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="Click to close" src="../Images/Close-Button.bmp" style="cursor: pointer;"
                    title="Click to close" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <table>
                    <tr>
                        <td style="padding-bottom: 10px;">
                            <table>
                                <tr>
                                    <td class="label">
                                        State:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label">
                                        District:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label">
                                        Block:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlBlock" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 10px; display: none;">
                            <a href="http://174.136.1.35/dev/ces/admin/frm_data.aspx">Mobile Data</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="dvGraphHeader" runat="server" style="display: none;">
                                <asp:Label ID="lblGraphHeader" runat="server" CssClass="label"></asp:Label></div>
                            <div>
                                <span class="labelstrong">Power Supply Status (Hrs.)</span><br />
                                <asp:Chart ID="chrtPower" runat="server" Height="300" Width="200">
                                    <Series>
                                        <asp:Series Name="Series1" ChartType="Column" MarkerStyle="None" BorderColor="180, 26, 59, 105">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BackColor="64, 64, 64, 64" BackSecondaryColor="White"
                                            BackGradientStyle="TopBottom">
                                            <Area3DStyle Enable3D="false" />
                                            <AxisY LineColor="64, 64, 64, 64">
                                                <LabelStyle Font="Calibri, 8pt" />
                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                            </AxisY>
                                            <AxisX LineColor="64, 64, 64, 64">
                                                <LabelStyle Font="Calibri, 8pt" />
                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                            <div id="dvProgress" runat="server">
                                <span class="labelstrong">Inspection Plan Vs. Actual</span><br />
                                <asp:Chart ID="chrtIns" runat="server" Height="300" Width="200">
                                    <Series>
                                        <asp:Series Name="Plan" ChartType="Column" MarkerStyle="None" BorderColor="180, 26, 59, 105">
                                        </asp:Series>
                                        <asp:Series Name="Actual" ChartType="Column" MarkerStyle="None" BorderColor="180, 26, 59, 105">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BackColor="64, 64, 64, 64" BackSecondaryColor="White"
                                            BackGradientStyle="TopBottom">
                                            <Area3DStyle Enable3D="false" />
                                            <AxisY LineColor="64, 64, 64, 64">
                                                <LabelStyle Font="Calibri, 8pt" />
                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                            </AxisY>
                                            <AxisX LineColor="64, 64, 64, 64">
                                                <LabelStyle Font="Calibri, 8pt" />
                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                            <div id="dvSummary" runat="server">
                                <span class="labelstrong">State Wise Inspection Summary</span><br />
                                <asp:Chart ID="chrtSumm" runat="server" Height="300" Width="200">
                                    <Titles>
                                        <asp:Title Name="RptTitle"></asp:Title>
                                    </Titles>
                                    <Series>
                                        <asp:Series Name="Summary" ChartType="Pie" MarkerStyle="None" BorderColor="180, 26, 59, 105"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BackColor="64, 64, 64, 64" BackSecondaryColor="White"
                                            BackGradientStyle="TopBottom">
                                            <Area3DStyle Enable3D="false" />
                                            <AxisY LineColor="64, 64, 64, 64">
                                                <LabelStyle Font="Calibri, 8pt" />
                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                            </AxisY>
                                            <AxisX LineColor="64, 64, 64, 64">
                                                <LabelStyle Font="Calibri, 8pt" />
                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="maincontent_right">
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
                            <ItemStyle CssClass="gridviewitem" Width="18%" HorizontalAlign="Left" />
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkHState" runat="server" CommandName="Sort" CommandArgument="StateName"
                                    Text="State" ToolTip="Click to sort by state"></asp:LinkButton>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District">
                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                            <ItemStyle CssClass="gridviewitem" Width="17%" HorizontalAlign="Left" />
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkHDistrict" runat="server" CommandName="Sort" CommandArgument="DistrictName"
                                    Text="District" ToolTip="Click to sort by district"></asp:LinkButton>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Block">
                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                            <ItemStyle CssClass="gridviewitem" Width="17%" HorizontalAlign="Left" />
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkHBlock" runat="server" CommandName="Sort" CommandArgument="BlockName"
                                    Text="Block" ToolTip="Click to sort by block"></asp:LinkButton>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Village">
                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                            <ItemStyle CssClass="gridviewitem" Width="18%" HorizontalAlign="Left" />
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkHVillage" runat="server" CommandName="Sort" CommandArgument="VillageName"
                                    Text="Village" ToolTip="Click to sort by village"></asp:LinkButton>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Census Code">
                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                            <ItemStyle CssClass="gridviewitem" Width="10%" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View Data">
                            <ItemStyle CssClass="gridviewitem" Width="6%" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle CssClass="gridviewheader" />
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif"
                                    ImageAlign="Middle" Height="16" Width="16" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View Location">
                            <ItemStyle CssClass="gridviewitem" Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle CssClass="gridviewheader" />
                            <ItemTemplate>
                                <asp:ImageButton ID="btnShow" runat="server" CommandName="ShowData" ImageUrl="~/Images/pin_icon.gif"
                                    ImageAlign="Middle" Height="16" Width="16" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div style="width:100%;padding-top:5px;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td style="width: 5%; vertical-align: top;padding:0px 5px 0px 5px;">
                                Inspection:
                            </td>
                            <td style="width: 10%; vertical-align: top;padding:0px 5px 0px 0px;">
                                <asp:DropDownList ID="ddlInspection" runat="server" OnSelectedIndexChanged="ddlInspection_SelectedIndexChanged"
                                    AutoPostBack="True">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 5%; vertical-align: top;padding:0px 5px 0px 0px;">
                                <asp:Label ID="lblVillageName" runat="server" Text="Village:"></asp:Label>
                            </td>
                            <td style="width: 35%; vertical-align: top;padding:0px 5px 0px 0px;">
                                <asp:Label ID="lblVillage" runat="server"></asp:Label>
                            </td>
                            <td style="width: 45%; vertical-align: top;padding:0px 0px 0px 0px;">
                                <div style="width: 100%; overflow: auto">
                                    <asp:Repeater ID="repInspector" runat="server" EnableViewState="true" OnItemDataBound="repInspector_ItemDataBound">
                                        <HeaderTemplate>
                                            <table border="0" cellpadding="5" cellspacing="0" style="width: 100%;">
                                                <tr class="repeaterheader">
                                                    <th style="width: 100%; text-align: left;">Inspector</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="repeateritem">
                                                <td style="text-align: left;"><asp:Label ID="lblName" runat="server"></asp:Label></td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr class="repeateralternateitem">
                                                <td style="text-align: left;"><asp:Label ID="lblName" runat="server"></asp:Label></td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="width: 100%">
                                <asp:Literal ID="js" runat="server"></asp:Literal>
                                <div style="width: 100%; text-align: right; overflow: auto">
                                    <div id="map_canvas" style="width: 100%; height: 400px; margin: 10px 0px 5px 0px">
                                    </div>
                                </div>
                            </td>
                        </tr>
                     </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
