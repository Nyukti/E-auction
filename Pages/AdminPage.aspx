<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="OnlineAuctionSystem.Pages.AdminPage" %>

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

        .page-shell {
            max-width: 1280px;
            margin: 28px auto;
            padding: 0 18px 40px;
        }

        .topbar {
            background: var(--palette-white);
            border: 1px solid var(--palette-border);
            border-radius: 20px;
            box-shadow: 0 16px 32px var(--palette-shadow);
            padding: 20px 24px;
        }

        .topbar-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
        }

        .brand {
            font-size: 2.4rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            color: var(--palette-deep);
        }

        .section-label {
            font-size: 2rem;
            font-weight: 800;
            color: var(--palette-deep);
            margin: 18px 0 10px;
            display: block;
        }

        .modern-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 18px;
            overflow: hidden;
            background: #ffffff;
            box-shadow: 0 18px 32px rgba(70, 75, 113, 0.08);
        }

        .modern-grid th {
            background: linear-gradient(135deg, #464B71, #118AB2);
            color: #ffffff;
            font-weight: 700;
            padding: 14px 12px;
            text-align: left;
            letter-spacing: 0.02em;
            border: none;
        }

        .modern-grid td {
            background: rgba(255,255,255,0.96);
            padding: 14px 12px;
            color: var(--palette-text);
            vertical-align: middle;
            border: none;
        }

        .modern-grid tr:nth-child(odd) td {
            background: rgba(247, 250, 255, 0.95);
        }

        .modern-grid tr:nth-child(even) td {
            background: rgba(124, 213, 199, 0.09);
        }

        .modern-grid tr:hover td {
            background: rgba(17, 138, 178, 0.08);
        }

        .modern-grid th:nth-child(odd) {
            background: linear-gradient(135deg, #464B71, #5a618a);
        }

        .modern-grid th:nth-child(even) {
            background: linear-gradient(135deg, #118AB2, #3aa5c6);
        }

        .action-btn, .verify-btn, .view-doc-btn, .delete-btn {
            transition: transform 0.25s ease, box-shadow 0.25s ease, filter 0.25s ease;
        }

        .action-btn {
            background: linear-gradient(135deg, var(--palette-peach), var(--palette-pink));
            color: var(--palette-text);
            border: none;
            border-radius: 12px;
            padding: 10px 18px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 10px 18px rgba(255, 157, 157, 0.18);
        }

        .verify-btn {
            background: linear-gradient(135deg, var(--palette-mint), var(--palette-peach));
            color: var(--palette-text);
            border: none;
            border-radius: 10px;
            padding: 8px 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .view-doc-btn {
            display: inline-block;
            background: linear-gradient(135deg, var(--palette-pink), var(--palette-peach));
            color: var(--palette-text);
            border: none;
            border-radius: 10px;
            padding: 8px 14px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
        }

        .delete-btn {
            background: linear-gradient(135deg, #f4a7a7, #e98a8a);
            color: #503333;
            border: none;
            border-radius: 10px;
            padding: 8px 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .action-btn:hover, .verify-btn:hover, .view-doc-btn:hover, .delete-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 18px rgba(255, 157, 157, 0.25);
        }

        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 91px;
        }
        .auto-style3 {
            width: 965px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <div class="topbar">
                <div class="topbar-row">
                    <asp:Label ID="Label11" runat="server" CssClass="brand" Text="Admin Page"></asp:Label>
                    <asp:Button ID="logoutBtn" runat="server" CssClass="action-btn" Text="LogOut" OnClick="logoutBtn_Click" />
                </div>
            </div>

            <asp:Label ID="Label9" runat="server" CssClass="section-label" Text="Verification Pending" ForeColor="#B93636"></asp:Label>
            <asp:GridView ID="PendingUserDataGridView" OnRowCommand="UserVerify_RowCommand" runat="server" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" DataKeyNames="id" CssClass="modern-grid">
                <Columns>
                    <asp:TemplateField HeaderText="FirstName">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Document">
                        <ItemTemplate>
                            <asp:HyperLink ID="documentLink" runat="server" CssClass="view-doc-btn" NavigateUrl='<%# Eval("pancard", "~/{0}") %>' Target="_blank">View Document</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verify">
                        <ItemTemplate>
                            <asp:Button ID="verifyButton" runat="server" CssClass="verify-btn" Text="Verify" CommandName="verifyUser" CommandArgument='<%# Bind("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                <RowStyle BackColor="White" ForeColor="#2F2A28" />
            </asp:GridView>

            <asp:Label ID="Label10" runat="server" CssClass="section-label" Text="Verification Completed" ForeColor="#007a3d"></asp:Label>
            <asp:GridView ID="VerifiedUserDataGridView" OnRowCommand="UserDelete_RowCommand" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="id" CssClass="modern-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="FirstName">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Document">
                        <ItemTemplate>
                            <asp:HyperLink ID="verifiedDocumentLink" runat="server" CssClass="view-doc-btn" NavigateUrl='<%# Eval("pancard", "~/{0}") %>' Target="_blank">View Document</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verify">
                        <ItemTemplate>
                            <asp:Button ID="userDeleteButton" runat="server" CssClass="delete-btn" Text="Delete User" CommandName="deleteUser" CommandArgument='<%# Bind("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                <RowStyle BackColor="#FFFDF8" ForeColor="#2F2A28" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
