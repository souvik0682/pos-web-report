<%@ Page Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true"
    CodeBehind="PowerSupplyStatus.aspx.cs" Inherits="REC.Web.Internal.Report.PowerSupplyStatus"
    Title=":: RQM :: Power Supply Status Report" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader"><uc1:Navigation ID="ucNav" runat="server" HeaderText="ENERGISATION & POWER SUPPLY STATUS" ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" /></div>
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
        <div style="width: 700px;">
            <fieldset style="width: 95%;">
                <legend>Search Criteria</legend>
                <table border="0" cellpadding="0" cellspacing="0" class="searchpanel">
                    <tr>
                        <td style="padding-right: 5px;">
                            State:
                        </td>
                        <td style="padding-right: 20px;">
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" TabIndex="1" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="padding-right: 5px;">
                            Block:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlBlock" runat="server" TabIndex="3">
                            </asp:DropDownList>                            
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 5px;padding-top:10px;">District:</td>
                        <td style="padding-right: 20px;padding-top:10px;">
                            <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="true" TabIndex="2"
                                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="padding-right: 5px;padding-top:10px;">&nbsp;</td>
                        <td style="padding-top:10px;"><asp:Button ID="btnShow" runat="server" Text="Show" TabIndex="4" OnClick="btnShow_Click" /></td>
                    </tr>
                </table>
            </fieldset>
            <div class="reportpanel" style="width: 98%;">
                <rsweb:ReportViewer ID="rptViewer" runat="server" CssClass="rptviewer" ShowExportControls="false" Width="100%">
                </rsweb:ReportViewer>
            </div>
        </div>
    </center>
</asp:Content>
