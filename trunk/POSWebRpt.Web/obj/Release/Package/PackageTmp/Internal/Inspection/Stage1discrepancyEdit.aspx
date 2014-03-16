<%@ Page Language="C#" Title=":: RQM :: Stage 1 Discrepancy Edit" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="Stage1discrepancyEdit.aspx.cs" Inherits="REC.Web.Internal.Inspection.Stage1discrepancyEdit" %>

<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose">
                <img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage">
            </div>
        </div>
    </div>
    <%-- <asp:UpdateProgress ID="uProgHH" runat="server" AssociatedUpdatePanelID="uPnlHH">
        <ProgressTemplate>
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <asp:HiddenField ID="hdnPhotoUrl" runat="server" />
    <div id="pageheader">
        &nbsp;EDIT STAGE 1 DESCREPANCY</div>
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel">
                    <a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a
                        href="Stage1discrepancyList.aspx">Stage 1 Discrepancy List</a></div>
                <fieldset style="width: 600px;">
                    <legend>Descrepancy Detail</legend>
                    <%--<asp:UpdatePanel ID="uPnlHH" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>--%>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="label" style="width: 220px;">Category:</td>
                                    <td>
                                        <asp:Label ID="lblCategory" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label" style="width: 220px;">Defects / Discrepancy Observed :</td>
                                    <td>
                                        <asp:Label ID="lblDefect" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label" style="width: 220px;">Rectification Status:<span class="mandatorysymbol">*</span></td>
                                    <td>
                                        <asp:DropDownList ID="ddlRectificationStatus" runat="server">
                                            <asp:ListItem Value="0" Text="Not Rectified"></asp:ListItem>
                                            <asp:ListItem Value="1">Rectified</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <%--<asp:RequiredFieldValidator ID="rfvRectification" runat="server" CssClass="errormessage"
                                            ControlToValidate="ddlRectificationStatus" InitialValue="0" Display="Dynamic" ForeColor=""
                                            SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Remarks:
                                    </td>
                                    <td><asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><asp:CustomValidator ID="cvRemarks" runat="server" CssClass="errormessage" ControlToValidate="txtRemarks" ValidateEmptyText="true" EnableClientScript="true" Display="Dynamic" ValidationGroup="Save"></asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td class="label">
                                        Photo:
                                    </td>
                                    <td class="label">
                                        <asp:Image ID="imgPhoto" runat="server" ImageUrl="~/Internal/ShowImage.aspx" Width="100px" Height="100px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top:10px;"></td>
                                    <td style="padding-top:10px;">
                                        <div id="dvFileUpload" runat="server">
                                            <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="9" />&nbsp;
                                        </div>
                                    </td>
                                </tr>
                            </table>
                    <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
                    <div class="buttonpanel">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>

