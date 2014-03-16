<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="REC.Web.UserControls.Header" %>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="tablecaption">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width:5%;"></td>
                    <td style="width:90%;text-align:center;"><asp:Label ID="lblHeader" runat="server"></asp:Label></td>
                    <td style="width:5%;text-align:right;padding-right:10px;"><asp:ImageButton ID="imgPrint" runat="server" ImageUrl="~/Images/Export.gif" ToolTip="Click to export" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="trPrint" runat="server">
        <td align="right" style="font-weight:normal;padding-right: 10px;">
            <div id="dvPrint" runat="server" class="printpanel" style="display: none;width:140px;">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" style="width:80px;padding-bottom:15px;"><asp:Label ID="lblPrintOption" runat="server" CssClass="label" Text="Export To:"></asp:Label></td>
                        <td align="right" style="width:60px;padding-bottom:15px;">
                            <asp:DropDownList ID="ddlFormat" runat="server">
                                <asp:ListItem Value="1" Text="PDF" Selected="true"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Excel"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Word"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="hyperlink3"><asp:LinkButton ID="lnkPrint" runat="server" Text="[Export]" ToolTip="Click to download" OnClick="lnkPrint_Click"></asp:LinkButton></td>
                        <td align="right" class="hyperlink3">
                            <a id="ankClose" runat="server" href="javascript:void(0);" title="Click to close">
                                <asp:Label ID="lblClose" runat="server" Text="[Close]"></asp:Label>
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>