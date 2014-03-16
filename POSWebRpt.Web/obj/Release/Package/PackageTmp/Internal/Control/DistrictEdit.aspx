<%@ Page Title=":: RQM :: District Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="DistrictEdit.aspx.cs" Inherits="REC.Web.Internal.Control.DistrictEdit" %>
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
        ADD / EDIT DISTRICT
    </div>
    <center>
        <fieldset style="width: 480px;">
            <legend>Add / Edit District </legend>
            <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 190px;">
                                State Name:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlState" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" CssClass="errormessage"
                                    ControlToValidate="ddlState" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                District Name:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDistrictName" runat="server" MaxLength="100" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDistrictName" runat="server" CssClass="errormessage"
                                    ControlToValidate="txtDistrictName" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td class="label" style="padding-bottom:20px;">Census Code:</td>
                            <td style="padding-bottom:20px;"><asp:TextBox ID="txtCensus" runat="server" MaxLength="20" Width="250px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="label" style="padding-bottom:20px;">DPR Code:</td>
                            <td style="padding-bottom:20px;"><asp:TextBox ID="txtDPR" runat="server" MaxLength="20" Width="250px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="label">Total Village (As Per Scope):<span class="mandatorysymbol">*</span></td>
                            <td><cc1:CustomTextBox ID="txtTotVill" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="3" Width="50"></cc1:CustomTextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><asp:RequiredFieldValidator ID="rfvTotVill" runat="server" CssClass="errormessage" ControlToValidate="txtTotVill" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='DistrictList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>
