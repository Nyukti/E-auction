<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="OnlineAuctionSystem.Pages.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details</title>
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

        .card {
            background: var(--palette-white);
            border: 1px solid var(--palette-border);
            border-radius: 22px;
            box-shadow: 0 14px 28px var(--palette-shadow);
            padding: 20px 18px;
        }

        .brand {
            font-size: 2.2rem;
            font-weight: 800;
            letter-spacing: -0.05em;
            color: var(--palette-deep);
        }

        .detail-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            width: 100%;
        }

        .header-spacer {
            flex: 1;
        }

        .home-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            border-radius: 12px;
            background: linear-gradient(135deg, #dff6ff, #cfeef8 45%, #b9e3fd);
            border: 1px solid rgba(17, 138, 178, 0.32);
            color: var(--palette-deep);
            text-decoration: none;
            font-size: 2rem;
            box-shadow: 0 8px 18px rgba(17, 138, 178, 0.18);
            margin-left: auto;
            transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.25s ease;
        }

        .home-btn:hover {
            background: linear-gradient(135deg, #d9f7ff, #bfeafc 48%, #a6def7);
            color: var(--palette-pink);
            transform: translateY(-2px);
            box-shadow: 0 14px 22px rgba(17, 138, 178, 0.18);
        }

        .section-label {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--palette-deep);
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

        .status-badge {
            display: inline-block;
            background: linear-gradient(135deg, #464B71, #118AB2);
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: 800;
            letter-spacing: 0.04em;
            padding: 12px 22px;
            border-radius: 999px;
            box-shadow: 0 12px 26px rgba(70, 75, 113, 0.18);
            text-transform: uppercase;
        }

        .winner-badge {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, rgba(124, 213, 199, 0.16), rgba(17, 138, 178, 0.10));
            border: 1px solid rgba(17, 138, 178, 0.22);
            color: var(--palette-deep);
            font-size: 1.4rem;
            font-weight: 800;
            padding: 14px 22px;
            border-radius: 18px;
            box-shadow: 0 12px 24px rgba(70, 75, 113, 0.08);
        }

        .winner-badge a {
            color: #0c6b8f;
            text-decoration: none;
            font-weight: 800;
        }

        .winner-badge a:hover {
            text-decoration: underline;
        }

        .owner-link {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(135deg, rgba(70, 75, 113, 0.12), rgba(17, 138, 178, 0.18));
            color: var(--palette-deep);
            font-weight: 700;
            padding: 8px 14px;
            border-radius: 10px;
            border: 1px solid rgba(70, 75, 113, 0.12);
            transition: transform 0.2s ease, background 0.2s ease;
        }

        .owner-link:hover {
            text-decoration: none;
            transform: translateY(-1px);
            background: linear-gradient(135deg, rgba(70, 75, 113, 0.18), rgba(17, 138, 178, 0.24));
        }

        .bid-box {
            background: rgba(255,255,255,0.8);
            border: 1px solid rgba(255,157,157,0.35);
            border-radius: 16px;
            padding: 18px 16px;
        }

        .bid-textbox {
            border: 1px solid rgba(255,157,157,0.45);
            border-radius: 12px;
            padding: 10px 12px;
            font-size: 1rem;
            width: 260px;
            transition: border-color 0.25s ease, box-shadow 0.25s ease;
        }

        .bid-textbox:focus {
            outline: none;
            border-color: var(--palette-pink);
            box-shadow: 0 0 0 3px rgba(255, 157, 157, 0.15);
        }

        .update-btn {
            background: linear-gradient(135deg, var(--palette-mint), var(--palette-peach));
            color: var(--palette-text);
            border: none;
            border-radius: 12px;
            padding: 10px 18px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .update-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 18px rgba(255, 157, 157, 0.2);
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 20px;
        }

        .auto-style3 {
            margin-left: 0px;
        }

        .auto-style4 {
            width: 819px;
        }

        .auto-style5 {
            width: 253px;
        }

        .auto-style6 {
            width: 253px;
            height: 45px;
        }

        .auto-style7 {
            height: 45px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
        <div class="card">
        <table cellpadding="2" class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2">
                                <div class="detail-header">
                                    <asp:Label ID="Label11" runat="server" CssClass="brand" Text="Product Details"></asp:Label>
                                    <div class="header-spacer"></div>
                                    <asp:HyperLink ID="homeLink" runat="server" CssClass="home-btn" NavigateUrl="~/Default.aspx" Text="⌂"></asp:HyperLink>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <center>
                        <asp:Label ID="productOwnerLabel" runat="server" CssClass="status-badge" Text="Your Product" Visible="False"></asp:Label>
                    </center>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:GridView ID="ProductBiddingGridView" runat="server" AutoGenerateColumns="False"
                        CellPadding="3" DataKeyNames="id" CssClass="modern-grid" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="productImage" ImageUrl='<%# Eval("image") %>' runat="server" Width="100" Height="100" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <asp:Label ID="productName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="productDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Base Price">
                                <ItemTemplate>
                                    <asp:Label ID="productbaseprice" runat="server" Text='<%# Bind("baseprice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="FutureLabel2" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="75px" />
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
                                <ControlStyle Width="75px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Time">
                                <ItemTemplate>
                                    <asp:Label ID="FutureLabel5" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Owner">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="owner-link" Text="View Owner" NavigateUrl='<%# Bind("userid","~/Pages/ShowUserProfile.aspx?id={0}") %>'></asp:HyperLink>
                                    <%--<asp:Button ID="viewOwnerDetailsButton" runat="server" Text="Owner" CommandName="viewOwnerDetails" CommandArgument='<%# Bind("userid") %>' />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                        <PagerStyle BackColor="White" ForeColor="#B93636" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#2F2A28" />
                        <SelectedRowStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                        <SortedAscendingCellStyle BackColor="#FFF2A0" />
                        <SortedAscendingHeaderStyle BackColor="#FF9C4C" />
                        <SortedDescendingCellStyle BackColor="#F7F0E8" />
                        <SortedDescendingHeaderStyle BackColor="#E8B6AA" />
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
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <table class="auto-style1" id="bidValueTable">
                        <tr>
                            <td class="auto-style6">
                                <asp:Label ID="ChangeBidLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Change Your Bid Value"></asp:Label>
                                &nbsp;
                            </td>
                            <td class="auto-style7">
                                <asp:TextBox ID="changeBidTextBox" runat="server" CssClass="bid-textbox" BackColor="LightGray" Enabled="False" Font-Bold="True" Font-Size="Large" Height="30px" TextMode="Number" Width="300px">0</asp:TextBox>
                                <asp:ImageButton ID="editBidValueImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editBidValueImageButton_Click" Width="25px" style="vertical-align:middle; margin-left:8px;" />
                                <br />
                                <asp:Label ID="errorMessageBidValueLabel" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>
                                <asp:Button ID="updateBidValueButton" runat="server" CssClass="update-btn" Font-Bold="True" Font-Size="Medium" Height="35px" Text="Update" Width="150px" OnClick="updateBidValueButton_Click" Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <div class="winner-badge">
                                        <asp:Label ID="winnerLabel" runat="server" Text="Winner" Visible="False"></asp:Label>
                                        <asp:HyperLink ID="winnerLinkHyperLink" runat="server" Visible="False">UserName</asp:HyperLink>
                                    </div>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                    <asp:Label ID="Label12" runat="server" CssClass="section-label" Text="Current Biddings"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:GridView ID="BiddingGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="modern-grid">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Bidder Name">
                                <ItemTemplate>
                                    <asp:HyperLink ID="userLinkHyperLink" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Blue" Visible="True" NavigateUrl='<%# Bind("userid","~/Pages/ShowUserProfile.aspx?Id={0}") %>' Text='<%# Bind("firstname") %>'></asp:HyperLink>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("bidvalue") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="biddingDate" runat="server" Text='<%# Bind("biddate","{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time">
                                <ItemTemplate>
                                    <asp:Label ID="biddingTime" runat="server" Text='<%# Bind("bidtime","{0:t}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#FFF2A0" Font-Bold="True" ForeColor="#2F2A28" />
                        <HeaderStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                        <PagerStyle BackColor="#7D9C65" ForeColor="#2F2A28" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFDF8" />
                        <SelectedRowStyle BackColor="#7D9C65" Font-Bold="True" ForeColor="#2F2A28" />
                        <SortedAscendingCellStyle BackColor="#FFF2A0" />
                        <SortedAscendingHeaderStyle BackColor="#FF9C4C" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
        </div>
    </form>
</body>
</html>
