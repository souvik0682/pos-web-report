<%@ Page Title=":: RQM :: Risk Assessment" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="SafetyParamSummary.aspx.cs" Inherits="REC.Web.Internal.Report.SafetyParamSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function showSection(imgId, dvId) 
    {
        var img = document.getElementById(imgId);
        var dv = document.getElementById(dvId);

        if (dv.style.display == 'none') {
            dv.style.display = '';
            img.title = 'Click to collapse';
            img.src = '../../Images/minus.gif';
        }
        else {
            dv.style.display = 'none';
            img.title = 'Click to expand';
            img.src = '../../Images/plus.gif';
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">RISK ASSESSMENT</div>
    <div id="dvSync" runat="server" style="padding: 5px 0px 5px 0px; display: none;">
        <table width="100%" class="synpanel">
            <tr>
                <td>
                    <div id="dvErrMsg" runat="server"></div>
                </td>
                <td style="text-align: right; width: 2%;">
                    <img alt="Click to close" src="../../Images/Close-Button.bmp" title="Click to close"
                        onclick="closeErrorPanel()" />
                </td>
            </tr>
        </table>
    </div>
    <center>
        <div style="width: 800px;">
            <fieldset style="width: 100%;">
                <legend>Search</legend>
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            State:
                        </td>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" TabIndex="1" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                       <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            Block:
                        </td>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            <asp:DropDownList ID="ddlBlock" runat="server" AutoPostBack="true" TabIndex="2" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            District:
                        </td>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="true" TabIndex="3"
                                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                         <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            Village:
                        </td>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            <asp:DropDownList ID="ddlVillage" runat="server" AutoPostBack="true" TabIndex="4"
                              >
                            </asp:DropDownList>
                        </td>
                        <td class="label" style="padding-right: 5px; padding-top: 5px;">
                            <asp:Button ID="btnSearch" runat="server" Text="Show" TabIndex="6" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="width: 100%;">
                <legend>Inspection List</legend>
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
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="ddlPaging" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                BorderStyle="None" BorderWidth="0" Width="100%" OnRowDataBound="gvwList_RowDataBound"
                                OnPageIndexChanging="gvwList_PageIndexChanging" OnRowCommand="gvwList_RowCommand">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="gridviewpager" />
                                <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                <EmptyDataTemplate>
                                    No Record(s) Found
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table width="100%">
                                                <tr class="repeaterheader">
                                                    <th style="width:5%;"></th>
                                                    <th style="width:5%;">Sl#</th>
                                                    <th style="width:15%;">Inspection Date</th>
                                                    <th style="width:15%;">State</th>
                                                    <th style="width:15%;">District</th>
                                                    <th style="width:15%;">Block</th>
                                                    <th style="width:15%;">Village</th>
                                                    <th style="width:15%;">Census Code</th>
                                                </tr>
                                                <tr class="repeateritem">
                                                    <td style="width:5%;"><img id="imgShow" runat="server" class="image" style="vertical-align: middle;cursor:pointer;" height="20" width="20" alt="" title="Click to expand" src="~/Images/plus.gif" /></td>
                                                    <td style="width:5%;"><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                                                    <td style="width:15%;"><asp:Label ID="lblDt" runat="server"></asp:Label></td>
                                                    <td style="width:15%;"><asp:Label ID="lblState" runat="server"></asp:Label></td>
                                                    <td style="width:15%;"><asp:Label ID="lblDist" runat="server"></asp:Label></td>
                                                    <td style="width:15%;"><asp:Label ID="lblBlock" runat="server"></asp:Label></td>
                                                    <td style="width:15%;"><asp:Label ID="lblVill" runat="server"></asp:Label></td>
                                                    <td style="width:15%;"><asp:Label ID="lblCensus" runat="server"></asp:Label></td>
                                                </tr>
                                            </table>
                                            <div id="dvParam" runat="server" style="display:none;">
                                                <table width="100%">
                                                    <tr>
                                                        <td style="width:5%;">&nbsp;</td>
                                                        <td style="width:95%;">
                                                            <asp:Repeater ID="repParam" runat="server" EnableViewState="true" OnItemDataBound="repParam_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse;width: 100%">
                                                                        <tr class="repeaterheader">
                                                                            <th style="width: 5%; text-align: center;">Sl#</th>
                                                                            <th style="width: 50%; text-align: center;">Safety Questions</th>
                                                                            <th style="width: 10%; text-align: center;">Status</th>
                                                                            <th style="width: 35%; text-align: center;">Remarks</th>
                                                                        </tr>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr class="repeateritem">
                                                                        <td><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                                                                        <td><asp:Label ID="lblQues" runat="server"></asp:Label></td>
                                                                        <td><asp:Label ID="lblStatus" runat="server"></asp:Label></td>
                                                                        <td><asp:Label ID="lblRemarks" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <tr class="repeateralternateitem">
                                                                        <td><asp:Label ID="lblSlNo" runat="server"></asp:Label></td>
                                                                        <td><asp:Label ID="lblQues" runat="server"></asp:Label></td>
                                                                        <td><asp:Label ID="lblStatus" runat="server"></asp:Label></td>
                                                                        <td><asp:Label ID="lblRemarks" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                </AlternatingItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>
                                                            <table id="tblMsg" runat="server">
                                                                <tr>
                                                                    <td class="label">Message:<span class="mandatorysymbol">*</span></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Rows="3" Width="250px"></asp:TextBox>
                                                                        <br /><asp:RequiredFieldValidator ID="rfvMsg" runat="server" CssClass="errormessage" ControlToValidate="txtMsg" Display="Dynamic" ForeColor="" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td><asp:Button ID="btnSend" runat="server" Text="Send Message" CommandName="SendMessage" /></td>
                                                                </tr>
                                                            </table>                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
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
