<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineAuctionSystem.autentication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        :root {
            --palette-pink: #464B71;
            --palette-peach: #118AB2;
            --palette-lime: #F2F2ED;
            --palette-mint: #7CD5C7;
            --palette-text: #1b2439;
            --palette-deep: #464B71;
            --palette-white: rgba(255,255,255,0.96);
            --palette-border: rgba(17, 138, 178, 0.22);
            --palette-shadow: rgba(70, 75, 113, 0.12);
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(180deg, var(--palette-lime) 0%, var(--palette-mint) 100%);
            color: var(--palette-text);
        }

        .auth-shell {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 16px;
        }

        .auth-card {
            width: 100%;
            max-width: 540px;
            background: var(--palette-white);
            border: 1px solid var(--palette-border);
            border-radius: 22px;
            box-shadow: 0 18px 45px var(--palette-shadow);
            padding: 18px 24px 26px;
        }

        .auth-header {
            text-align: center;
            margin-bottom: 12px;
        }

        .auth-title {
            margin: 0;
            font-size: 2.2rem;
            font-weight: 800;
            letter-spacing: -0.04em;
            color: var(--palette-deep);
        }

        .auth-form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .form-row {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-size: 1rem;
            font-weight: 700;
            color: var(--palette-text);
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 12px;
            border: 2px solid rgba(255,157,157,0.45);
            border-radius: 12px;
            background: #ffffff;
            color: var(--palette-text);
            font-size: 1rem;
            transition: border-color 0.25s ease, box-shadow 0.25s ease, transform 0.25s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--palette-pink);
            box-shadow: 0 0 0 3px rgba(255, 157, 157, 0.15);
        }

        .checkbox-row {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--palette-text);
            font-weight: 600;
        }

        .checkbox-row input[type="checkbox"] {
            accent-color: var(--palette-pink);
            width: 16px;
            height: 16px;
        }

        .submit-btn {
            width: 100%;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #2f9fc7, #1f7fb7);
            color: #ffffff !important;
            -webkit-text-fill-color: #ffffff;
            font-weight: 700;
            font-size: 1.05rem;
            padding: 14px 18px;
            cursor: pointer;
            box-shadow: 0 12px 24px rgba(17, 138, 178, 0.34);
            transition: transform 0.25s ease, box-shadow 0.25s ease, filter 0.25s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 26px rgba(17, 138, 178, 0.40);
            filter: saturate(1.06);
        }

        .auth-link {
            margin-top: 6px;
            text-align: center;
            color: var(--palette-text);
            font-size: 0.95rem;
        }

        .auth-link a {
            color: var(--palette-deep);
            font-weight: 700;
            text-decoration: none;
            transition: color 0.25s ease;
        }

        .auth-link a:hover {
            text-decoration: underline;
            color: var(--palette-pink);
        }

        .validator-error {
            color: #B93636;
            font-size: 0.8rem;
            font-weight: 600;
        }
    </style>
    <script>
        function ShowPassword(checkBox) {
            let passwordtb = document.getElementById('passwordTextBox');
            let confirmPasswordtb = document.getElementById('confirmPasswordTextBox');
            if (checkBox.checked) {
                if (passwordtb) passwordtb.type = 'text';
                if (confirmPasswordtb) confirmPasswordtb.type = 'text';
            } else {
                if (passwordtb) passwordtb.type = 'password';
                if (confirmPasswordtb) confirmPasswordtb.type = 'password';
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-shell">
            <div class="auth-card">
                <div class="auth-header">
                    <h1 class="auth-title">Login</h1>
                </div>

                <div class="auth-form">
                    <div class="form-row">
                        <asp:Label ID="usernameId" runat="server" CssClass="form-label" Text="Email"></asp:Label>
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a username" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter an email</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-row">
                        <asp:Label ID="passwordId" runat="server" CssClass="form-label" Text="Password"></asp:Label>
                        <asp:TextBox ID="passwordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Please enter a password" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter a password</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="Password must contain atleast 8 character,  Uppercase, LowerCase, Digit and Special Character." ForeColor="Red" ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\w+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" Font-Bold="True" SetFocusOnError="True" CssClass="validator-error">Password must contain atleast 8 character, Uppercase, LowerCase, Digit, and Special Character.</asp:RegularExpressionValidator>
                    </div>

                    <div class="checkbox-row">
                        <input id="checkboxsp" type="checkbox" onclick="ShowPassword(this)" />
                        <label for="checkboxsp">Show Password</label>
                    </div>

                    <asp:Button ID="loginBtn" runat="server" CssClass="submit-btn" Text="Login" ForeColor="White" OnClick="loginBtn_Click" />

                    <div class="auth-link">
                        Don&#39;t have an account?
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/authentication/SignUp.aspx">Sign Up</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
