<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="PortfolioWebsite.AdminPanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel - Portfolio</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2,h3 { color: #16acc1; }
        input, textarea { margin-bottom: 10px; padding: 8px; width: 400px; }
        button, .aspButton { padding: 8px 15px; margin-bottom: 20px; cursor: pointer; }
        hr { margin: 20px 0; }
        .message { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ✅ Logout button -->
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" /><br /><br />

        <h2>Admin Panel</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label><br />

        <!-- Personal Info -->
        <h3>Personal Info</h3>
        <asp:TextBox ID="txtName" runat="server" placeholder="Name" /><br />
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" placeholder="Short Description" /><br />
        <asp:TextBox ID="txtAboutMe" runat="server" TextMode="MultiLine" Rows="4" placeholder="About Me" /><br />
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" /><br />
        <asp:TextBox ID="txtSpecialty" runat="server" placeholder="Specialty" /><br />
        <asp:TextBox ID="txtLocation" runat="server" placeholder="Location" /><br />
        <asp:TextBox ID="txtAge" runat="server" placeholder="Year / Age" /><br />
        <asp:TextBox ID="txtExperience" runat="server" placeholder="Experience / CGPA" /><br />
        <asp:TextBox ID="txtProjects" runat="server" placeholder="Projects" /><br />
        <asp:TextBox ID="txtAvailability" runat="server" placeholder="Availability" /><br />
        <asp:TextBox ID="txtProfileImage" runat="server" placeholder="Profile Image URL" /><br />
        <asp:Button ID="btnSavePersonal" runat="server" Text="Save Personal Info" OnClick="btnSavePersonal_Click" /><hr />

        <!-- Skills -->
        <h3>Skills</h3>
        <asp:TextBox ID="txtSkillTitle" runat="server" placeholder="Skill Title" /><br />
        <asp:TextBox ID="txtSkillDescription" runat="server" placeholder="Skill Description" /><br />
        <asp:TextBox ID="txtSkillIcon" runat="server" placeholder="Skill Icon" /><br />
        <asp:Button ID="btnAddSkill" runat="server" Text="Add Skill" OnClick="btnAddSkill_Click" /><hr />

        <!-- Education -->
        <h3>Education</h3>
        <asp:TextBox ID="txtEduTitle" runat="server" placeholder="Education Title" /><br />
        <asp:TextBox ID="txtEduInstitution" runat="server" placeholder="Institution" /><br />
        <asp:TextBox ID="txtEduYear" runat="server" placeholder="Year" /><br />
        <asp:TextBox ID="txtEduDesc" runat="server" placeholder="Description" /><br />
        <asp:Button ID="btnAddEducation" runat="server" Text="Add Education" OnClick="btnAddEducation_Click" /><hr />

        <!-- Experience -->
        <h3>Experience</h3>
        <asp:TextBox ID="txtExpTitle" runat="server" placeholder="Experience Title" /><br />
        <asp:TextBox ID="txtExpDuration" runat="server" placeholder="Duration" /><br />
        <asp:TextBox ID="txtExpDesc" runat="server" placeholder="Description" /><br />
        <asp:Button ID="btnAddExperience" runat="server" Text="Add Experience" OnClick="btnAddExperience_Click" /><br />
    </form>
</body>
</html>
