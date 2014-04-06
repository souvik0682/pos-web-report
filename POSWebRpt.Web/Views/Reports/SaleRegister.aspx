<%@ Page Title=":: POS :: Sales Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SaleRegister.aspx.cs" Inherits="POSWebRpt.Web.Views.Reports.SaleRegister" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">SALES REGISTER</div>
    <div style="width: 930px; margin: 0 auto; direction: rtl;">
        <fieldset style="width: 930px;">
            <legend>Search Criteria</legend>
            <table border="0" cellpadding="5" cellspacing="5" width="100%">
                <tr>
                    <td><asp:Button ID="btnShow" runat="server" Text="Show" CssClass="button" OnClick="btnShow_Click" /></td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div class="reportpanel" style="width: 952px;">
        <rsweb:ReportViewer ID="rptViewer" runat="server" CssClass="rptviewer" Width="100%">
        </rsweb:ReportViewer>
    </div>
</asp:Content>
