<%@ Page Title=":: RQM :: List Type Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="LstTypeEdit.aspx.cs" Inherits="REC.Web.Internal.Control.LstTypeEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose"><img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage"></div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgType" runat="server" AssociatedUpdatePanelID="uPnlType">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div id="pageheader">ADD / EDIT LIST TYPE</div>
    <center>
        <fieldset style="width: 400px;">
            <legend>Add / Edit List Type</legend>
            <asp:UpdatePanel ID="uPnlType" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width:130px;">Type Name:<span class="mandatorysymbol">*</span></td>
                            <td><asp:TextBox ID="txtName" runat="server" MaxLength="50" Width="216px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="errormessage" ControlToValidate="txtName" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table> 
                </ContentTemplate>
            </asp:UpdatePanel>                                 
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='LstTypeList.aspx';return false;" />
            </div>
        </fieldset>
    </center> 
</asp:Content>
