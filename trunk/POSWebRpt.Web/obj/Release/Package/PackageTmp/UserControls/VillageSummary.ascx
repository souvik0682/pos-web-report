<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VillageSummary.ascx.cs" Inherits="REC.Web.UserControls.VillageSummary" %>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="labelstrong">Village</td>
        <td>:&nbsp;<asp:Label ID="lblVillage" runat="server" CssClass="label"></asp:Label></td>
    </tr>
    <tr>
        <td class="labelstrong">Census Code</td>
        <td>:&nbsp;<asp:Label ID="lblCensus" runat="server" CssClass="label"></asp:Label></td>
    </tr>
    <tr>
        <td class="labelstrong">State</td>
        <td class="label">:&nbsp;<asp:Label ID="lblState" runat="server" CssClass="label"></asp:Label></td>
    </tr>
    <tr>
        <td class="labelstrong">District</td>
        <td class="label">:&nbsp;<asp:Label ID="lblDist" runat="server" CssClass="label"></asp:Label></td>
    </tr>
    <tr>
        <td class="labelstrong">Block</td>
        <td class="label">:&nbsp;<asp:Label ID="lblBlock" runat="server" CssClass="label"></asp:Label></td>
    </tr>
</table>
<div id="dvConfig" runat="server" style="padding-top:20px;display:none;">
    <table>
        <tr>
            <td><img id="img1" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="VillageInfo.aspx" title="Village general information">General Information</a></td>
        </tr>
        <tr>
            <td><img id="img2" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="MICList.aspx" title="Major physical quantities configuration">Major Item Config</a></td>
        </tr>
        <tr>
            <td><img id="img3" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="BOQList.aspx" title="BOQ configuration">BOQ Config</a></td>
        </tr>
        <tr>
            <td><img id="img4" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="ConsumerList.aspx" title="BPL Consumer List">BPL Consumer</a></td>
        </tr>
        <tr>
            <td><img id="img16" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="SingleLineDiagram.aspx" title="Single Line Diagram">Single Line Diagram</a></td>
        </tr>
    </table>
</div>
<div id="dvInspection" runat="server" style="padding-top:20px;display:none;">
    <table>
        <tr>
            <td><img id="img18" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="SafetyParameter.aspx" title="Safety Parameters">Safety Parameters</a></td>
        </tr>
        <tr>
            <td><img id="img5" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="BPLHH.aspx" title="BPL household detail">BPL Households</a></td>
        </tr>
        <tr>
            <td><img id="img6" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="APLHH.aspx" title="APL household detail">APL Households</a></td>
        </tr>
        <tr>
            <td><img id="img7" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="BPLVerificationList.aspx" title="BPL verification">BPL Verification</a></td>
        </tr>
        <tr>
            <td><img id="img8" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="MIAList.aspx" title="Major physical quantities executed at field">Major Item Actual</a></td>
        </tr>
        <tr>
            <td><img id="img9" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="BOQList.aspx" title="BOQ executed at field">BOQ Actual</a></td>
        </tr>
        <tr>
            <td><img id="img10" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="TestReport.aspx" title="Checking of test report">Test Report</a></td>
        </tr>
        <tr>
            <td><img id="img11" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="PowerSupply.aspx" title="Power supply status">Power Supply Status</a></td>
        </tr>
        <tr>
            <td><img id="img12" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="PublicFacilityList.aspx" title="Electrification status of public facilities">Public Facility</a></td>
        </tr>
        <tr>
            <td><img id="img13" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="Feedback.aspx" title="Feedback and comments">Feedback</a></td>
        </tr>
        <tr>
            <td><img id="img14" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="ObservationList.aspx" title="Observations">Observations</a></td>
        </tr>
        <tr>
            <td><img id="img15" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="DefectList.aspx" title="General observations">General Observations</a></td>
        </tr>
        <tr id="insType" runat="server">
            <td><img id="img17" runat="server" style="vertical-align: middle;" height="6" width="6" alt="" title="" src="~/Images/BulletBlue.gif" />&nbsp;</td>
            <td><a href="Stage1discrepancyList.aspx" title="General observations">Stage1 Descrepancies</a></td>
        </tr>
        
    </table>
</div>