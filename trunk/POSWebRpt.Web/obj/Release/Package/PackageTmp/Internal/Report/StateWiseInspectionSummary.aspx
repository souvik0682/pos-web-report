<%@ Page Title=":: RQM :: State Wise Village Inspection Report" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="StateWiseInspectionSummary.aspx.cs" Inherits="REC.Web.Internal.Report.StateWiseInspectionSummary" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader"><uc1:Navigation ID="ucNav" runat="server" HeaderText="STATE WISE VILLAGE INSPECTION REPORT" ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" /></div>
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
            <div class="reportpanel" style="width: 98%;">
                <rsweb:ReportViewer ID="rptViewer" runat="server" CssClass="rptviewer" ShowExportControls="false" Width="100%">
                </rsweb:ReportViewer>
            </div>
        </div>
    </center>
</asp:Content>
