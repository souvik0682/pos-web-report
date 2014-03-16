<%@ Page Language="C#" Title=":: RQM :: Single Line Diagram" AutoEventWireup="true"
    CodeBehind="SingleLineDiagram.aspx.cs" MasterPageFile="~/Internal/REC.Master"
    Inherits="REC.Web.Internal.Config.SingleLineDiagram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <asp:HiddenField ID="hdnPhotoUrl" runat="server" />
    <div id="pageheader">SINGLE LINE DIAGRAM</div>
    <div id="dvSync" runat="server" style="padding: 5px 0px 5px 0px; display: none;">
        <table width="100%" class="synpanel">
            <tr>
                <td>
                    <div id="dvErrMsg" runat="server"></div>
                </td>
                <td style="text-align: right; width: 2%;">
                    <img alt="Click to close" src="../../Images/Close-Button.bmp" title="Click to close" onclick="closeErrorPanel()" />
                </td>
            </tr>
        </table>
    </div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="false" ShowConfigurationPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel">
                    <a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a></div>
                <fieldset style="width: 600px;">
                    <legend>Single Line&nbsp; Diagram Phot Upload</legend>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="style1">
                                Photo:
                            </td>
                            <td class="label">
                                &nbsp;&nbsp;
                                <asp:Image ID="imgPhoto" runat="server" Width="100px" Height="100px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            </td>
                            <td>
                                <div id="dvFileUpload" runat="server">
                                    <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="9" />&nbsp;
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="buttonpanel">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
