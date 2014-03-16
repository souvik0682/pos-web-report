<%@ Page Title=":: RQM :: Item Group Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="ItemGroupEdit.aspx.cs" Inherits="REC.Web.Internal.Control.ItemGroupEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
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
        ADD / EDIT ITEM GROUP 
    </div>
    <center>
        <fieldset style="width: 400px;">
            <legend>Add / Edit Item Group  </legend>
            <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="label" style="width:160px;">Group Name:<span class="mandatorysymbol">*</span></td>
                            <td><asp:TextBox ID="txtItemGroupName" runat="server" MaxLength="50" Width="240px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><asp:RequiredFieldValidator ID="rfvItemGroupName" runat="server" CssClass="errormessage" ControlToValidate="txtItemGroupName"  Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="label">Test Report Required<span class="mandatorysymbol">*</span></td>
                            <td><asp:CheckBox ID="chkTest" runat="server" /></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='ItemGroupList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>
