<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OnlineAuctionSystem.autentication.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        :root {
            --palette-teal: #8AD6D1;
            --palette-deep: #359FA0;
            --palette-cream: #FFF0C5;
            --palette-orange: #FF8C52;
            --palette-text: #1b2439;
            --palette-white: rgba(255,255,255,0.96);
            --palette-border: rgba(53, 159, 160, 0.25);
            --palette-shadow: rgba(53, 159, 160, 0.15);
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(180deg, var(--palette-cream) 0%, var(--palette-teal) 100%);
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
            max-width: 620px;
            background: var(--palette-white);
            border: 1px solid var(--palette-border);
            border-radius: 22px;
            box-shadow: 0 18px 45px var(--palette-shadow);
            padding: 18px 24px 26px;
        }

        .auth-header {
            text-align: center;
            margin-bottom: 10px;
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
            gap: 16px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 14px 18px;
            align-items: start;
        }

        .form-row {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-label {
            font-size: 1rem;
            font-weight: 700;
            color: var(--palette-text);
            padding-top: 8px;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 12px;
            border: 2px solid rgba(138, 214, 209, 0.6);
            border-radius: 12px;
            background: #ffffff;
            color: var(--palette-text);
            font-size: 1rem;
            transition: border-color 0.25s ease, box-shadow 0.25s ease, transform 0.25s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--palette-deep);
            box-shadow: 0 0 0 3px rgba(53, 159, 160, 0.15);
        }

        .file-upload {
            width: 100%;
            box-sizing: border-box;
            padding: 9px 10px;
            border: 2px dashed rgba(138, 214, 209, 0.7);
            border-radius: 12px;
            background: #fff;
        }

        .checkbox-row {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--palette-text);
            font-weight: 600;
        }

        .checkbox-row input[type="checkbox"] {
            accent-color: var(--palette-deep);
            width: 16px;
            height: 16px;
        }

        .submit-btn {
            width: 100%;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #eefcf9, #d9f5ef);
            color: var(--palette-text) !important;
            -webkit-text-fill-color: var(--palette-text);
            font-weight: 700;
            font-size: 1.05rem;
            padding: 14px 18px;
            cursor: pointer;
            box-shadow: 0 12px 24px rgba(53, 159, 160, 0.15);
            transition: transform 0.25s ease, box-shadow 0.25s ease, filter 0.25s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 26px rgba(53, 159, 160, 0.22);
            filter: saturate(1.04);
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
            color: var(--palette-orange);
        }

        .validator-error {
            color: #B93636;
            font-size: 0.8rem;
            font-weight: 600;
        }

        @media (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-label {
                padding-top: 0;
            }
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
                    <h1 class="auth-title">Sign Up</h1>
                </div>

                <div class="auth-form">
                    <div class="form-grid">
                        <asp:Label ID="usernameId" runat="server" CssClass="form-label" Text="First Name"></asp:Label>
                        <div class="form-row">
                            <asp:TextBox ID="firstnameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstnameTextBox" ErrorMessage="Please enter a firstname" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter a firstname</asp:RequiredFieldValidator>
                        </div>

                        <asp:Label ID="lastnameLabel" runat="server" CssClass="form-label" Text="Last Name"></asp:Label>
                        <div class="form-row">
                            <asp:TextBox ID="lastnameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastnameTextBox" ErrorMessage="Please enter a lastname" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter a lastname</asp:RequiredFieldValidator>
                        </div>

                        <asp:Label ID="Agelbl" runat="server" CssClass="form-label" Text="Age"></asp:Label>
                        <div class="form-row">
                            <asp:TextBox ID="ageTextBox" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ageTextBox" ErrorMessage="Please enter a age" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter an age</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ageTextBox" Display="Dynamic" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="95" MinimumValue="18" SetFocusOnError="True" CssClass="validator-error">Age must be greater than 18</asp:RangeValidator>
                        </div>

                        <asp:Label ID="usernameId0" runat="server" CssClass="form-label" Text="Email"></asp:Label>
                        <div class="form-row">
                            <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a email" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter an email</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="validator-error">Please enter a valid email</asp:RegularExpressionValidator>
                        </div>

                        <asp:Label ID="gender" runat="server" CssClass="form-label" Text="Gender"></asp:Label>
                        <div class="form-row">
                            <asp:DropDownList ID="genderSelectBox" runat="server" CssClass="form-control">
                                <asp:ListItem Selected="True">select</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="genderSelectBox" Display="Dynamic" ErrorMessage="Please Select Gender" ForeColor="Red" InitialValue="select" SetFocusOnError="True" CssClass="validator-error">Please select gender</asp:RequiredFieldValidator>
                        </div>

                        <asp:Label ID="usernameId1" runat="server" CssClass="form-label" Text="Pancard"></asp:Label>
                        <div class="form-row">
                            <asp:FileUpload ID="documentFileUpload" runat="server" CssClass="file-upload" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="documentFileUpload" ErrorMessage="RequiredFieldValidator" ForeColor="Red" Display="Dynamic" CssClass="validator-error">Please select a file</asp:RequiredFieldValidator>
                            <asp:Label ID="fileLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                        </div>

                        <asp:Label ID="passwordId" runat="server" CssClass="form-label" Text="Password"></asp:Label>
                        <div class="form-row">
                            <asp:TextBox ID="passwordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Please enter a password" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter a password</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="Password must contain atleast 8 character,  Uppercase, LowerCase, Digit and Special Character." ForeColor="Red" ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\w+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" Font-Bold="True" SetFocusOnError="True" CssClass="validator-error">Password must contain at least 8 characters, including uppercase, lowercase, digits, and special characters.</asp:RegularExpressionValidator>
                        </div>

                        <asp:Label ID="cpasswordId" runat="server" CssClass="form-label" Text="Confirm Password"></asp:Label>
                        <div class="form-row">
                            <asp:TextBox ID="confirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmPasswordTextBox" ErrorMessage="Please enter a password" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" CssClass="validator-error">Please enter a password</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="passwordTextBox" ControlToValidate="confirmPasswordTextBox" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" CssClass="validator-error">Password must be the same</asp:CompareValidator>
                        </div>
                    </div>

                    <div class="checkbox-row">
                        <input id="checkboxsp" type="checkbox" onclick="ShowPassword(this)" />
                        <label for="checkboxsp">Show Password</label>
                    </div>

                    <asp:Button ID="signupBtnId" runat="server" CssClass="submit-btn" Text="Sign Up" OnClick="signupBtnId_Click" />

                    <div class="auth-link">
                        Already have an account?
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/authentication/Login.aspx">Login</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
