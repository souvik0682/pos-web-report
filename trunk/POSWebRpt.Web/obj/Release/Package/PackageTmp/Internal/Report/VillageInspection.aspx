<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VillageInspection.aspx.cs"
    Inherits="REC.Web.Internal.Report.VillageInspection" Title=":: RQM :: Village Inspection Report"
    MasterPageFile="~/Internal/REC.Master" %>

<%@ Register Src="~/UserControls/Header.ascx" TagName="Navigation" TagPrefix="uc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader"><uc1:Navigation ID="ucNav" runat="server" HeaderText="VILLAGE INSPECTION REPORT" ShowPrintPanel="true" OnPrintButtonClick="ucNav_PrintButtonClick" /></div>
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
                <legend>Search Inpection</legend>
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td class="label" style="padding-right: 5px;">
                            State:
                        </td>
                        <td style="padding-right: 20px;">
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" TabIndex="1" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="label" style="padding-right: 5px;">
                            Village:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlVillage" runat="server" AutoPostBack="true" TabIndex="4"
                                OnSelectedIndexChanged="ddlVillage_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label" style="padding-right: 5px; padding-top: 10px;">
                            District:
                        </td>
                        <td style="padding-right: 20px; padding-top: 10px;">
                            <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="true" TabIndex="3"
                                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="label" style="padding-right: 5px; padding-top: 10px;">
                            Inspection:
                        </td>
                        <td style="padding-top: 10px;">
                            <asp:DropDownList ID="ddlInspection" runat="server" TabIndex="5">
                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label" style="padding-right: 5px; padding-top: 10px;">
                            Block:
                        </td>
                        <td style="padding-right: 20px; padding-top: 10px;">
                            <asp:DropDownList ID="ddlBlock" runat="server" AutoPostBack="true" TabIndex="2" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="padding-right: 5px; padding-top: 10px;">
                            <asp:Button ID="btnShow" runat="server" Text="Show" TabIndex="6" OnClick="btnShow_Click" />
                        </td>
                        <td style="padding-top: 10px;">
                        </td>
                    </tr>
                </table>
            </fieldset>
            <div class="reportpanel" style="width: 98%">
                <rsweb:ReportViewer ID="rptViewer" runat="server" CssClass="rptviewer" ShowExportControls="false" Width="100%">
                </rsweb:ReportViewer>
            </div>
        </div>
    </center>
</asp:Content>
