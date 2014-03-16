<%@ Page Title=":: RQM :: General Observation Edit" Language="C#" MasterPageFile="~/Internal/REC.Master" AutoEventWireup="true"
    CodeBehind="DefectEdit.aspx.cs" Inherits="REC.Web.Internal.Inspection.DefectEdit" %>

<%@ Register Src="~/UserControls/VillageSummary.ascx" TagName="VillSumm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" language="javascript">
    function validateOther(sender, args) {
        var isValid = true;
        var ddl = document.getElementById('<%=ddlDefect.ClientID %>');

        if (ddl != null) {
            var selValue = ddl.options[ddl.selectedIndex].text;

            if (selValue == "Other") {                
                isValid = (args.Value.length > 0);
            }
        }

        args.IsValid = isValid;
    }

    function validateConsumer(sender, args) {
        var isValid = true;
        var ddlCategory = document.getElementById('<%=ddlCategory.ClientID %>');

        if (ddlCategory != null) {
            var selValue = ddlCategory.options[ddlCategory.selectedIndex].value;

            if (selValue == "10") {
                var ddlConsumer = document.getElementById('<%=ddlConsumer.ClientID %>');

                if (ddlConsumer != null) {
                    var selCon = ddlConsumer.options[ddlConsumer.selectedIndex].value;

                    if (selCon == "0")
                        isValid = false;
                }
            }
        }

        args.IsValid = isValid;
    }

    function validateLocation(sender, args) {
        var isValid = true;
        var ddlCategory = document.getElementById('<%=ddlCategory.ClientID %>');

        if (ddlCategory != null) {
            var selValue = ddlCategory.options[ddlCategory.selectedIndex].value;

            if (selValue != "10") {
                var txtLoc = document.getElementById('<%=txtLoc.ClientID %>');

                if (txtLoc != null) {
                    var location = txtLoc.value;

                    if (location == "")
                        isValid = false;
                }
            }
        }

        args.IsValid = isValid;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div id="pageheader">ADD / EDIT GENERAL OBSERVATIONS</div>
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
    <table id="maincontent" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td rowspan="2" class="maincontent_left">
                <uc2:VillSumm ID="ucVill" runat="server" ShowInspectionPanel="true" />
            </td>
            <td class="maincontent_right">
                <div class="navigationpanel"><a href="../Home.aspx">Home</a>-><a href="../VillageHome.aspx">Village Home</a>-><a href="DefectList.aspx">General Observations</a></div>
                <div style="width: 650px;">
                    <fieldset style="width: 100%;">
                        <legend>Observation</legend>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="label" style="width:150px;">Category:<span class="mandatorysymbol">*</span></td>
                                <td><asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><asp:RequiredFieldValidator ID="rfvCategory" runat="server" CssClass="errormessage" ControlToValidate="ddlCategory" Display="Dynamic" InitialValue="0" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="label">Defect:<span class="mandatorysymbol">*</span></td>
                                <td><asp:DropDownList ID="ddlDefect" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><asp:RequiredFieldValidator ID="rfvDefect" runat="server" CssClass="errormessage" ControlToValidate="ddlDefect" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="label"></td>
                                <td><asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" Width="250"></asp:TextBox></td>                            
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><asp:CustomValidator ID="cvDesc" runat="server" CssClass="errormessage" ControlToValidate="txtDesc" ValidateEmptyText="true" OnServerValidate="cvDesc_ServerValidate" EnableClientScript="true" ClientValidationFunction="validateOther" Display="Dynamic" ValidationGroup="Save"></asp:CustomValidator></td>
                            </tr>
                            <tr>
                                <td class="label">Severity:<span class="mandatorysymbol">*</span></td>
                                <td><asp:DropDownList ID="ddlSeverity" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><asp:RequiredFieldValidator ID="rfvSeverity" runat="server" CssClass="errormessage" ControlToValidate="ddlSeverity" InitialValue="0" Display="Dynamic" ForeColor="" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2"><asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Click to save" ValidationGroup="Save" OnClick="btnSave_Click" /></td>
                            </tr>
                        </table>
                    </fieldset>
                    <div>
                        <fieldset style="width: 100%;">
                            <legend>Photo</legend>
                            <table border="0">
                                <tr>
                                    <td id="tdLocHeader" runat="server" class="label" style="padding-right:5px;">Location:<span class="mandatorysymbol">*</span></td>
                                    <td id="tdLocField" runat="server"><asp:TextBox ID="txtLoc" runat="server" MaxLength="50" Width="200"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="padding-right:5px;">&nbsp;</td>
                                    <td><asp:CustomValidator ID="cvLoc" runat="server" CssClass="errormessage" ControlToValidate="txtLoc" ValidateEmptyText="true" OnServerValidate="cvLoc_ServerValidate" EnableClientScript="true" ClientValidationFunction="validateLocation" Display="Dynamic" ValidationGroup="Upload"></asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td id="tdConHeader" runat="server" class="label" style="display:none;padding-right:5px;">Consumer:<span class="mandatorysymbol">*</span></td>
                                    <td id="tdConField" runat="server" style="display:none;">
                                        <asp:DropDownList ID="ddlConsumer" runat="server"><asp:ListItem Value="0" Text="--Select--"></asp:ListItem></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><asp:CustomValidator ID="cvCon" runat="server" CssClass="errormessage" ControlToValidate="ddlConsumer" OnServerValidate="cvCon_ServerValidate" EnableClientScript="true" ClientValidationFunction="validateConsumer" Display="Dynamic" ValidationGroup="Upload"></asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td class="label" style="padding-right:5px;">Photo:<span class="mandatorysymbol">*</span></td>
                                    <td>
                                        <div id="dvFileUpload" runat="server">
                                            <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="9" />&nbsp;
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right:5px;">Remarks:</td>
                                    <td><asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="4" Width="200"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" ToolTip="Click to upload" ValidationGroup="Upload" OnClick="btnUpload_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"><asp:Label ID="lblUploadMessage" runat="server" CssClass="errormessage"></asp:Label></td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="padding: 5px;">
                                       <asp:UpdatePanel ID="uPnlList" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                                    BorderStyle="None" BorderWidth="0" Width="100%" 
                                                    onrowdatabound="gvwList_RowDataBound" 
                                            onrowcommand="gvwList_RowCommand">
                                                    <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                                    <PagerStyle CssClass="gridviewpager" />
                                                    <EmptyDataRowStyle CssClass="gridviewemptydatarow" />
                                                    <EmptyDataTemplate>
                                                        No Data Found
                                                    </EmptyDataTemplate>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl#">
                                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                                            <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DefectLocationId" Visible="false">
                                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Right" />
                                                            <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Right" />
                                                            <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblDefectLocationId" ></asp:Label>
                                                            </ItemTemplate> 
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Location">
                                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                            <ItemStyle CssClass="gridviewitem" Width="70%" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PhotoPath" Visible="false">
                                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                            <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Photo">
                                                            <HeaderStyle CssClass="gridviewheader" HorizontalAlign="Left" />
                                                            <ItemStyle CssClass="gridviewitem" Width="20%" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text ="View" ID="lnkPhoto" OnClick="lnkPhoto_Click"></asp:LinkButton> 
                                                            </ItemTemplate> 
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="">
                                                            <HeaderStyle CssClass="gridviewheader" />
                                                            <ItemStyle CssClass="gridviewitem" Width="5%" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="btnRemove" runat="server" CommandName="RemoveData" ImageUrl="~/Images/trash_icon.gif" ImageAlign="Middle" Height="16" Width="16" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                       </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
