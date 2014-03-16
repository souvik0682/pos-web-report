<%@ Page Title=":: RQM :: Block Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="BlockEdit.aspx.cs" Inherits="REC.Web.Internal.Control.BlockEdit" %>

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
        ADD / EDIT BLOCK
    </div>
    <center>
        <fieldset style="width: 400px;">
            <legend>Add / Edit Block </legend>
            <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 110px;">
                                State Name:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
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
                            <td class="label" style="width: 110px;">
                                District Name:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDistrict" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" CssClass="errormessage"
                                    ControlToValidate="ddlDistrict" InitialValue="0" Display="Dynamic" ForeColor=""
                                    SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Block Name:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBlockName" runat="server" MaxLength="100" Width="224px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvBlockName" runat="server" CssClass="errormessage"
                                    ControlToValidate="txtBlockName" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Census Code:
                            </td>
                            <td>
                                <asp:TextBox ID="txtCensusCode" runat="server" MaxLength="20" Width="224px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='BlockList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>
