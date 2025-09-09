<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="portfolio.Project.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body { 
            font-family: 'Poppins', sans-serif; 
            background: #0d1117; 
            color: #e6e6e6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: #161b22;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            border: 1px solid rgba(56, 139, 253, 0.2);
            text-align: center;
        }
        h2 { 
            color: #58a6ff; 
            margin-bottom: 1.5rem; 
        }
        .form-group { 
            margin-bottom: 1rem; 
            text-align: left; 
        }
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
        }
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid rgba(56, 139, 253, 0.2);
            border-radius: 10px;
            background: #0d1117;
            color: #e6e6e6;
            font-size: 1rem;
        }
        .btn-primary, .btn-secondary {
            width: 100%;
            margin-top: 1rem;
            font-weight: 600;
            cursor: pointer;
            border: none;
            border-radius: 25px;
            padding: 12px 25px;
        }
        .btn-primary { background: linear-gradient(45deg, #58a6ff, #1f6feb); color: #fff; }
        .btn-secondary { background: linear-gradient(45deg, #6c757d, #495057); color: #fff; }
        .error-message {
            color: #f85149;
            margin-top: 1rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Admin Panel Login</h2>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember Me" />
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary" OnClick="btnLogin_Click" />
            <asp:Button ID="btnGoHome" runat="server" Text="Go to Home" CssClass="btn-secondary" OnClick="btnGoHome_Click" />
            <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
