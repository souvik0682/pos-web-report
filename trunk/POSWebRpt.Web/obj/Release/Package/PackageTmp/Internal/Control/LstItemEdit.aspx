<%@ Page Title=":: RQM :: List Item Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true" CodeBehind="LstItemEdit.aspx.cs" Inherits="REC.Web.Internal.Control.LstItemEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="dvAsync" style="padding: 5px; display: none;">
        <div class="asynpanel">
            <div id="dvAsyncClose"><img alt="" src="../../Images/Close-Button.bmp" style="cursor: pointer;" onclick="ClearErrorState()" /></div>
            <div id="dvAsyncMessage"></div>
        </div>
    </div>
    <asp:UpdateProgress ID="uProgItem" runat="server" AssociatedUpdatePanelID="uPnlItem">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>    
    <div id="pageheader">ADD / EDIT LIST ITEM</div>
    <center>
        <fieldset style="width: 400px;">
            <legend>Add / Edit List Item</legend>
            <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width:110px;">List Type:<span class="mandatorysymbol">*</span></td>
                            <td><asp:DropDownList ID="ddlType" runat="server"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><asp:RequiredFieldValidator ID="rfvType" runat="server" CssClass="errormessage" ControlToValidate="ddlType" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="label">Item Name:<span class="mandatorysymbol">*</span></td>
                            <td><asp:TextBox ID="txtText" runat="server" MaxLength="500" Width="250px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><asp:RequiredFieldValidator ID="rfvText" runat="server" CssClass="errormessage" ControlToValidate="txtText" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>            
                </ContentTemplate>
            </asp:UpdatePanel>  
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='LstItemList.aspx';return false;" />
            </div>
        </fieldset>
    </center> 
</asp:Content>
