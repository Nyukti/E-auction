<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineAuctionSystem.Default" MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Auction</title>
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

        html {
            scroll-behavior: smooth;
            scroll-margin-top: 90px;
        }

        .scroll-anchor {
            display: block;
            position: relative;
            top: -90px;
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(180deg, var(--palette-lime) 0%, var(--palette-mint) 100%);
            color: var(--palette-text);
        }

        .featured-auction {
            position: relative;
            min-height: 420px;
            border-radius: 26px;
            overflow: hidden;
            margin: 18px 0 26px;
            background: url('https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=80') center center/cover no-repeat;
            box-shadow: 0 18px 34px rgba(47, 42, 40, 0.18);
        }

        .featured-auction::before {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(90deg, rgba(19, 24, 18, 0.72) 0%, rgba(19, 24, 18, 0.38) 42%, rgba(19, 24, 18, 0.2) 100%);
        }

        .featured-content {
            position: relative;
            z-index: 1;
            max-width: 560px;
            padding: 52px 42px;
            color: #ffffff;
        }

        .featured-label {
            display: inline-block;
            background: rgba(255, 255, 255, 0.18);
            border: 1px solid rgba(255, 255, 255, 0.28);
            border-radius: 999px;
            padding: 8px 14px;
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            margin-bottom: 18px;
        }

        .featured-content h1 {
            margin: 0 0 12px 0;
            font-size: clamp(2.1rem, 4vw, 3.4rem);
            line-height: 1.1;
            letter-spacing: -0.04em;
            color: #ffffff;
        }

        .featured-content p {
            margin: 0 0 24px 0;
            font-size: 1.08rem;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.92);
            max-width: 470px;
        }

        .featured-link {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(135deg, var(--palette-pink), var(--palette-deep));
            color: #ffffff;
            font-weight: 700;
            padding: 14px 24px;
            border-radius: 12px;
            box-shadow: 0 12px 28px rgba(189, 68, 68, 0.32);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .featured-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 30px rgba(189, 68, 68, 0.38);
        }

        .page-shell {
            max-width: 1280px;
            margin: 24px auto;
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

        .main-nav {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            gap: 14px;
            margin: 0 auto;
        }

        .main-nav a {
            color: var(--palette-deep);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 700;
            padding: 8px 12px;
            border-radius: 10px;
            transition: background 0.2s ease, color 0.2s ease;
        }

        .main-nav a:hover {
            background: rgba(17, 138, 178, 0.1);
            color: var(--palette-pink);
        }

        .header-actions {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 12px;
            margin-left: auto;
        }

        .action-row {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 12px;
        }

        .action-btn, .primary-btn, .profile-avatar-btn, .modern-grid a, .pager a, .home-btn {
            transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.25s ease, border-color 0.25s ease, color 0.25s ease;
        }

        .action-btn, .primary-btn {
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 700;
        }

        .profile-avatar-btn {
            width: 52px !important;
            height: 52px !important;
            border-radius: 50% !important;
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(255, 157, 157, 0.22);
            border: 2px solid var(--palette-pink);
            background: #fff;
        }

        .primary-btn {
            background: linear-gradient(135deg, #3fa6d5, #2279b3);
            color: #ffffff;
            border: 1px solid rgba(17, 138, 178, 0.8);
            padding: 12px 22px;
            box-shadow: 0 10px 20px rgba(17, 138, 178, 0.34);
        }

        .action-btn {
            background: linear-gradient(135deg, #3fa6d5, #2279b3);
            color: #ffffff;
            border: 1px solid rgba(17, 138, 178, 0.8);
            padding: 10px 18px;
            box-shadow: 0 10px 18px rgba(17, 138, 178, 0.30);
        }

        .action-btn:hover, .primary-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 22px rgba(17, 138, 178, 0.38);
            filter: saturate(1.12);
        }

        .section-panel {
            background: rgba(255,255,255,0.92);
            border: 1px solid var(--palette-border);
            border-radius: 18px;
            box-shadow: 0 12px 28px rgba(94, 70, 52, 0.08);
            padding: 18px 20px;
            margin-top: 18px;
        }

        .section-title {
            font-weight: 800;
            font-size: 1.7rem;
            color: var(--palette-deep);
            margin: 0 0 14px 0;
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

        .modern-grid a {
            color: var(--palette-deep);
            text-decoration: none;
            font-weight: 700;
            padding: 8px 12px;
            border-radius: 10px;
            background: rgba(17, 138, 178, 0.10);
            display: inline-block;
        }

        .modern-grid a:hover {
            text-decoration: none;
            color: var(--palette-pink);
            background: rgba(17, 138, 178, 0.18);
        }

        .section-label {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--palette-deep);
        }

        .home-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            padding: 0;
            border-radius: 12px;
            background: linear-gradient(135deg, #dff6ff, #cfeef8 45%, #b9e3fd);
            border: 1px solid rgba(17, 138, 178, 0.32);
            color: var(--palette-deep);
            text-decoration: none;
            font-size: 2rem;
            box-shadow: 0 8px 18px rgba(17, 138, 178, 0.18);
            line-height: 1;
        }

        .home-btn:hover {
            background: linear-gradient(135deg, #d9f7ff, #bfeafc 48%, #a6def7);
            color: var(--palette-pink);
            transform: translateY(-1px);
        }

        .pager td,
        .pager a,
        .pager span {
            font-size: 0.98rem;
            color: var(--palette-deep);
            font-weight: 700;
            padding: 7px 10px;
            border-radius: 8px;
        }

        .pager a {
            text-decoration: none;
            background: rgba(70, 75, 113, 0.06);
            margin: 0 2px;
        }

        .pager a:hover {
            background: rgba(17, 138, 178, 0.12);
            color: var(--palette-pink);
        }

        .pager {
            text-align: right;
            background: transparent;
            padding: 12px 0 8px;
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 16px;
        }

        .auto-style3 {
            width: 1201px;
        }

        .auto-style4 {
            width: 39px;
        }

        .auto-style5 {
            width: 59px;
        }

        .auto-style6 {
            width: 118px;
        }

        .auto-style7 {
            width: 16px;
            height: 29px;
        }

        .auto-style8 {
            width: 1201px;
            height: 29px;
        }

        .auto-style9 {
            height: 29px;
        }

        .auto-style10 {
            width: 104px;
        }
        .auto-style11 {
            width: 104px;
            height: 28px;
        }
        .auto-style12 {
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="page-shell">
            <table cellpadding="2" cellspacing="3" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <div class="topbar">
                            <div class="topbar-row">
                                <asp:Label ID="webName" runat="server" CssClass="brand" Text="OnlineAuctionSystem"></asp:Label>
                                <nav class="main-nav" aria-label="Auction categories">
                                    <a href="#active-bidding">Currently Active Bidding</a>
                                    <a href="#featured-bidding">Featured Bidding</a>
                                    <a href="#closed-bidding">Closed Bidding</a>
                                </nav>
                                <div class="header-actions">
                                    <asp:ImageButton ID="profileImageBtn" runat="server" CssClass="profile-avatar-btn" OnClick="profileImageBtn_Click" ImageUrl="~/FileUpload/images/DefaultImages/default.png" />
                                    <asp:Button ID="logoutBtn" runat="server" CssClass="action-btn" Text="LogOut" OnClick="logoutBtn_Click" />
                                    <asp:Button ID="loginBtn" runat="server" CssClass="primary-btn" Text="Login" OnClick="loginBtn_Click" />
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <hr />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3" style="display:flex; align-items:center; gap:16px; flex-wrap:wrap;">
                        <asp:Button ID="addProductButton" runat="server" CssClass="primary-btn" Text="Add Product" OnClick="addProductButton_Click" style="padding: 12px 24px; width: 160px;" />
                        <span style="font-size: 0.98rem; color: #2d3e50; font-weight: 600;">List a new item and start your next auction.</span>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <div class="featured-auction">
                            <div class="featured-content">
                                <h1>Rare finds, live bids, and unbeatable deals.</h1>
                                <p>Discover premium collectibles, timeless antiques, and everyday treasures before the auction closes. Place your bid and win the next standout piece.</p>
                            </div>
                        </div>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                        <table cellpadding="2" class="auto-style1">
                            <tr>
                                <td class="auto-style11"></td>
                                <td class="auto-style12"></td>
                                <td class="auto-style12"></td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <a id="active-bidding" class="scroll-anchor" aria-label="Currently Active Bidding"></a>
                                    <asp:Label ID="webName0" runat="server" CssClass="section-label" Text="Currently Active Bidding" style="color:#1b8f5a;"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <%--OnRowCommand="ActiveBidding_RowCommand"--%>
                                    <asp:GridView ID="ActiveBiddingGridView" runat="server" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" DataKeyNames="id" CssClass="modern-grid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" ImageUrl='<%# Bind("image") %>' runat="server" Width="70" Height="70" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("startingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Details">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("Id", "~/Pages/Product.aspx?Id={0}") %>'>View details</asp:HyperLink>
                                                    <%--<asp:Button ID="viewDetailsButton" runat="server" Text="View Details" CommandName="viewDetails" CommandArgument='<%# Bind("Id") %>' />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#FFF2A0" ForeColor="#B93636" />
                                        <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                                        <PagerStyle BackColor="#FFF2A0" ForeColor="#B93636" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#2F2A28" />
                                        <SelectedRowStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                                        <SortedAscendingCellStyle BackColor="#FFF2A0" />
                                        <SortedAscendingHeaderStyle BackColor="#FF9C4C" />
                                        <SortedDescendingCellStyle BackColor="#F7F0E8" />
                                        <SortedDescendingHeaderStyle BackColor="#FF9C4C" />
                                    </asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <a id="featured-bidding" class="scroll-anchor" aria-label="Featured Bidding"></a>
                                    <asp:Label ID="webName1" runat="server" CssClass="section-label" Text="Featured Bidding" style="color:#d97706;"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <%--<asp:Button ID="viewDetailsButton" runat="server" Text="View Details" CommandName="viewDetails" CommandArgument='<%# Bind("Id") %>' />--%> 
                                    <asp:GridView ID="FutureBiddingGridView" runat="server" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" DataKeyNames="id" CssClass="modern-grid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image2" ImageUrl='<%# Bind("image") %>' runat="server" Width="70" Height="70" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel2" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel3" runat="server" Text='<%# Bind("startingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel4" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel5" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Details">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="FutureHyperLink" runat="server" NavigateUrl='<%# Bind("Id", "~/Pages/Product.aspx?Id={0}") %>'>View details</asp:HyperLink>
                                                    <%--<asp:Button ID="viewDetailsButton" runat="server" Text="View Details" CommandName="viewDetails" CommandArgument='<%# Bind("Id") %>' />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#FFF2A0" ForeColor="#B93636" />
                                        <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                                        <PagerStyle BackColor="#FFF2A0" ForeColor="#B93636" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#2F2A28" />
                                        <SelectedRowStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                                        <SortedAscendingCellStyle BackColor="#FFF2A0" />
                                        <SortedAscendingHeaderStyle BackColor="#FF9C4C" />
                                        <SortedDescendingCellStyle BackColor="#F7F0E8" />
                                        <SortedDescendingHeaderStyle BackColor="#FF9C4C" />
                                    </asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <a id="closed-bidding" class="scroll-anchor" aria-label="Closed Bidding"></a>
                                    <asp:Label ID="webName2" runat="server" CssClass="section-label" Text="Closed Bidding" style="color:#B93636;"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <asp:UpdatePanel ID="ClosedBiddingPanel" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="PastBiddingGridView" runat="server" AutoGenerateColumns="False"
                                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                                CellPadding="4" DataKeyNames="id" CssClass="modern-grid"
                                                AllowPaging="True" PageSize="5" OnPageIndexChanging="PastBiddingGridView_PageIndexChanging"
                                                PagerSettings-Mode="Numeric" PagerSettings-Position="Top" PagerStyle-CssClass="pager" PagerStyle-HorizontalAlign="Right" PagerStyle-Font-Size="Large" PagerStyle-Font-Bold="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Image">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image3" ImageUrl='<%# Bind("image") %>' runat="server" Width="70" Height="70" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Product Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="FutureLabel6" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Start Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="FutureLabel7" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Start Time">
                                                        <ItemTemplate>
                                                            <asp:Label ID="FutureLabel8" runat="server" Text='<%# Bind("startingtime") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="End Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="FutureLabel9" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="End Time">
                                                        <ItemTemplate>
                                                            <asp:Label ID="FutureLabel10" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View Details">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="FutureHyperLink0" runat="server" NavigateUrl='<%# Bind("Id", "~/Pages/Product.aspx?Id={0}") %>'>View details</asp:HyperLink>
                                                            <%--<asp:Button ID="viewDetailsButton" runat="server" Text="View Details" CommandName="viewDetails" CommandArgument='<%# Bind("Id") %>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#FFF2A0" ForeColor="#B93636" />
                                                <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                                                <PagerStyle BackColor="#FFF2A0" ForeColor="#B93636" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" ForeColor="#2F2A28" />
                                                <SelectedRowStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                                                <SortedAscendingCellStyle BackColor="#FFF2A0" />
                                                <SortedAscendingHeaderStyle BackColor="#FF9C4C" />
                                                <SortedDescendingCellStyle BackColor="#F7F0E8" />
                                                <SortedDescendingHeaderStyle BackColor="#FF9C4C" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
