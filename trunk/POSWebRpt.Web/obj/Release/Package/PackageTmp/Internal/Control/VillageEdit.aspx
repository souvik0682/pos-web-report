<%@ Page Title=":: RQM :: Village Edit" Language="C#" AutoEventWireup="true" CodeBehind="VillageEdit.aspx.cs" Inherits="REC.Web.Internal.Control.VillageEdit"
    MasterPageFile="~/Internal/REC.Master" %>

<%@ Register Assembly="REC.Utilities" Namespace="REC.Utilities" TagPrefix="cc1" %>
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
    <div id="pageheader">
        ADD / EDIT VILLAGE
    </div>
    <center>
        <fieldset style="width: 380px;">
            <legend>Add / Edit Village </legend>
            <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 140px;">
                                State:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlState" runat="server" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" CssClass="errormessage"
                                    ControlToValidate="ddlState" InitialValue="0" Display="Dynamic" ForeColor=""
                                    SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                District:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDistrict" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict"
                                    CssClass="errormessage" Display="Dynamic" ForeColor="" InitialValue="0" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator><td>
                        </tr>
                        <tr>
                            <td class="label">
                                Block:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBlock" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvBlock" runat="server" ControlToValidate="ddlBlock"
                                    CssClass="errormessage" Display="Dynamic" ForeColor="" InitialValue="0" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator><td>
                        </tr>
                        <tr>
                            <td class="label">
                                Village Name:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVillageName" runat="server" MaxLength="100" Width="220px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvVillageName" runat="server" CssClass="errormessage"
                                    ControlToValidate="txtVillageName" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label" style="padding-bottom: 20px;">
                                Census Code:
                            </td>
                            <td style="padding-bottom: 20px;">
                                <asp:TextBox ID="txtCensus" runat="server" MaxLength="20" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='VillageList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>
