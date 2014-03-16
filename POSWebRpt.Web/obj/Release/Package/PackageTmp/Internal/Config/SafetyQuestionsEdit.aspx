<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SafetyQuestionsEdit.aspx.cs"
    Inherits="REC.Web.Internal.Config.SafetyQuestionsEdit" Title=":: RQM :: Safety Question Edit"
    MasterPageFile="~/Internal/REC.Master" %>

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
    <asp:UpdateProgress ID="uProgType" runat="server" AssociatedUpdatePanelID="uPnlType">
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
        ADD / EDIT SAFETY QUESTION</div>
    <center>
        <fieldset style="width: 400px;">
            <legend>Add / Edit Safety Question</legend>
            <asp:UpdatePanel ID="uPnlType" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 130px;">
                                Safety Questions:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQues" runat="server" MaxLength="255" Width="216px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvQues" runat="server" CssClass="errormessage" ControlToValidate="txtQues"
                                    Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label" style="width: 130px;">
                                Default Answer:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDefAns" runat="server" Width="80px">
                                    <asp:ListItem Text="-Select-" Value="0" />
                                    <asp:ListItem Text="Yes" Value="Y" />
                                    <asp:ListItem Text="No" Value="N" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonpanel">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.location.href='SafetyQuestionsList.aspx';return false;" />
            </div>
        </fieldset>
    </center>
</asp:Content>
