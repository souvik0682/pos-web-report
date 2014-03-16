<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefectEdit.aspx.cs" Inherits="REC.Web.Internal.Control.DefectEdit"
    Title=":: RQM :: Defect Edit" MasterPageFile="~/Internal/REC.Master" %>

<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc" %>
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
    <asp:UpdateProgress ID="uProgItem" runat="server" AssociatedUpdatePanelID="uPnlItem">
        <ProgressTemplate>
            <div class="progress">
                <div id="image">
                    <img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">
                    Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">ADD / EDIT DEFECT</div>
    <center>
        <div style="width: 700px;">
            <fieldset style="width: 100%;">
                <legend>Add / Edit Defect</legend>
                <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="label" style="width: 140px;">
                                    Category:<span class="mandatorysymbol">*</span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" CssClass="errormessage"
                                        ControlToValidate="ddlCategory" Display="Dynamic" InitialValue="0" ForeColor=""
                                        SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Line Type:<span class="mandatorysymbol">*</span></td>
                                <td>
                                    <asp:DropDownList ID="ddlLineType" runat="server">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvLineType" runat="server" CssClass="errormessage"
                                        ControlToValidate="ddlLineType" Display="Dynamic" InitialValue="0" ForeColor=""
                                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Defect Description:<span class="mandatorysymbol">*</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="5" Width="300"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvDesc" runat="server" CssClass="errormessage" ControlToValidate="txtDesc"
                                        Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Report Required?</td>
                                <td>
                                    <asp:DropDownList ID="ddlRpt" runat="server">
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="buttonpanel">
                    <asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Click to save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='DefectList.aspx';return false;" />
                </div>
            </fieldset>
        </div>
    </center>
</asp:Content>
