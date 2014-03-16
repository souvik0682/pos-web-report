<%@ Page Title=":: RQM :: Major Item Add/Edit" Language="C#" MasterPageFile="~/Internal/REC.Master"
    AutoEventWireup="true" CodeBehind="MajorItemEdit.aspx.cs" Inherits="REC.Web.Internal.Control.MajorItemEdit" %>
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
    <%--   <asp:UpdateProgress ID="uProgItem" runat="server" AssociatedUpdatePanelID="uPnlItem">
        <ProgressTemplate>
            <div class="progress">
                <div id="image"><img src="../../Images/PleaseWait.gif" alt="" /></div>
                <div id="text">Please Wait...</div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <div id="pageheader">ADD / EDIT MAJOR ITEM</div>
    <div id="dvSync" runat="server" style="padding: 5px 0px 5px 0px; display: none;">
        <table width="100%" class="synpanel">
            <tr>
                <td>
                    <div id="dvErrMsg" runat="server"></div>
                </td>
                <td style="text-align: right; width: 2%;">
                    <img alt="Click to close" src="../../Images/Close-Button.bmp" title="Click to close"
                        onclick="closeErrorPanel()" />
                </td>
            </tr>
        </table>
    </div>
    <center>
        <fieldset style="width: 800px;">
            <legend>Add / Edit Major Item </legend>
           <%-- <asp:UpdatePanel ID="uPnlItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSaveItem" EventName="Click" />
                </Triggers>
                <ContentTemplate>--%>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 150px;">
                                Item Description:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMajorItemDesc" runat="server" MaxLength="100" Width="250px" TabIndex="1"></asp:TextBox>
                            </td>
                            <td class="label">
                                Sort Order:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <cc1:CustomTextBox ID="txtSortOrder" runat="server" CssClass="numerictextbox" Type="Numeric" MaxLength="3" Width="50" TabIndex="4"></cc1:CustomTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvMajorItemDesc" runat="server" CssClass="errormessage"
                                    ControlToValidate="txtMajorItemDesc" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvSortOrder" runat="server" CssClass="errormessage"
                                    ControlToValidate="txtSortOrder" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Unit:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlUnit" runat="server" TabIndex="2">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Help Text:
                            </td>
                            <td>
                                <asp:TextBox ID="txtHelp" runat="server" TextMode="MultiLine" Rows="3" MaxLength="255" Width="250px" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvUnit" runat="server" CssClass="errormessage" ControlToValidate="ddlUnit" Display="Dynamic" InitialValue="0" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Data Type:<span class="mandatorysymbol">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDataType" runat="server" TabIndex="3">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>                                
                            </td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDataType" runat="server" CssClass="errormessage"
                                    ControlToValidate="ddlDataType" Display="Dynamic" InitialValue="0" ForeColor=""
                                    SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>                                
                            </td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
            <div class="buttonpanel">
                <asp:Button ID="btnSaveItem" runat="server" Text="Save" ValidationGroup="Save" TabIndex="6" OnClick="btnSaveItem_Click" />&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" TabIndex="7" OnClientClick="javascript:window.location.href='MajorItemList.aspx';return false;" />
            </div>
        </fieldset>
        <%--2nd fieldset--%>
        <fieldset id="fieldsetSubItem" runat="server" style="width: 800px;">
            <legend>Add / Edit Major Sub Item </legend>
           <%-- <asp:UpdatePanel ID="uPnlSubItem" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSaveSubItem" EventName="Click" />
                </Triggers>
                <ContentTemplate>--%>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 150px;">
                                Sub Item Description:<span class="mandatorysymbol">*</span>
                            </td>
                            <td class="label" style="width: 250px;">
                                <asp:TextBox ID="txtSubItem" runat="server" MaxLength="255" Width="250px" TabIndex="8"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSaveSubItem" runat="server" Text="Save" ValidationGroup="SaveSubItem" TabIndex="9" OnClick="btnSaveSubItem_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvtxtSubItem" runat="server" CssClass="errormessage"
                                    ControlToValidate="txtSubItem" Display="Dynamic" ForeColor="" SetFocusOnError="True"
                                    ValidationGroup="SaveSubItem"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
        </fieldset>

        <%--  3rd fieldset--%>
        <fieldset style="width: 800px;">
            <legend>Major Sub Item List </legend>
            <div class="listpanelheader">
                 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 120px;">
                            Results Per Page:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPaging" runat="server" Width="65px" AutoPostBack="true" TabIndex="10"
                                OnSelectedIndexChanged="ddlPaging_SelectedIndexChanged">
                                <asp:ListItem Text="10" Value="10" />
                                <asp:ListItem Text="30" Value="30" />
                                <asp:ListItem Text="50" Value="50" />
                                <asp:ListItem Text="100" Value="100" />
                            </asp:DropDownList>
                        </td>
                      
                    </tr>
                </table>
            </div>
            <div class="listpanel">
                <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                    BorderStyle="None" BorderWidth="0" Width="100%" TabIndex="11" OnRowDataBound="gvwList_RowDataBound"
                    OnRowCommand="gvwList_RowCommand" OnPageIndexChanging="gvwList_PageIndexChanging">
                    <%----%>
                    <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                    <PagerStyle CssClass="gridviewpager" />
                    <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                    <EmptyDataTemplate>
                        No Item(s) Found
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField HeaderText="Sl#">
                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                            <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sub Item Description">
                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                            <ItemStyle CssClass="gridviewitem" Width="85%" HorizontalAlign="Left" />
                            <%--<HeaderTemplate>
                                <asp:LinkButton ID="lnkHBlock" runat="server" CommandName="Sort" CommandArgument="BlockName"
                                    Text="Block" ToolTip="Click to sort by block"></asp:LinkButton>
                            </HeaderTemplate>--%>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle CssClass="gridviewheader" />
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEdit" runat="server" CommandName="EditData" ImageUrl="~/Images/edit.gif"
                                    ImageAlign="Middle" Height="16" Width="16" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <HeaderStyle CssClass="gridviewheader" />
                            <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif"
                                    ImageAlign="Middle" VerticalAlign="Middle" Height="16" Width="16" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </fieldset>
    </center>
</asp:Content>
