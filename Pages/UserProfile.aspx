<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="OnlineAuctionSystem.Pages.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
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
            max-width: 1200px;
            margin: 28px auto;
            padding: 0 18px 40px;
        }

        .card {
            background: var(--palette-white);
            border: 1px solid var(--palette-border);
            border-radius: 20px;
            box-shadow: 0 14px 28px var(--palette-shadow);
            padding: 20px 18px;
        }

        .brand {
            font-size: 2.1rem;
            font-weight: 800;
            color: var(--palette-deep);
            letter-spacing: -0.04em;
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
            line-height: 1;
            transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.25s ease;
        }

        .home-btn:hover {
            background: linear-gradient(135deg, #d9f7ff, #bfeafc 48%, #a6def7);
            color: var(--palette-pink);
            transform: translateY(-2px);
            box-shadow: 0 14px 22px rgba(17, 138, 178, 0.18);
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

        input[type="text"], input[type="number"], select {
            border: 1px solid rgba(255,157,157,0.45);
            border-radius: 12px;
            background: #fdfdf7;
            padding: 9px 12px;
            font-size: 0.98rem;
            color: var(--palette-text);
            box-sizing: border-box;
            transition: border-color 0.25s ease, box-shadow 0.25s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus, select:focus {
            outline: none;
            border-color: var(--palette-pink);
            box-shadow: 0 0 0 3px rgba(255, 157, 157, 0.15);
        }

        input[type="submit"], input[type="button"], button {
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--palette-peach), var(--palette-pink));
            color: var(--palette-text);
            padding: 10px 18px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 10px 18px rgba(255, 157, 157, 0.18);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        input[type="submit"]:hover, input[type="button"]:hover, button:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 20px rgba(255, 157, 157, 0.25);
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 82px;
        }

        .auto-style3 {
            width: 1132px;
        }

        .auto-style12 {
            width: 286px;
        }

        .auto-style6 {
            width: 788px;
        }

        .auto-style11 {
            width: 105%;
            margin-left: 0px;
        }

        .auto-style10 {
            width: 156px;
        }

        .auto-style14 {
            width: 430px;
        }

        .auto-style15 {
            width: 319px;
        }

        .auto-style16 {
            height: 300px;
        }

        .auto-style17 {
            margin-left: 0px;
        }

        .auto-style18 {
            width: 260px;
        }
        .auto-style19 {
            height: 22px;
        }

        .edit-details-btn {
            background: linear-gradient(135deg, var(--palette-pink), var(--palette-peach));
            border: 2px solid var(--palette-pink);
            border-radius: 12px;
            color: var(--palette-text);
            cursor: pointer;
            font-size: 1rem;
            font-weight: 700;
            height: 40px;
            padding: 0 18px;
            box-shadow: 0 8px 18px rgba(255, 157, 157, 0.2);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .edit-details-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 20px rgba(255, 157, 157, 0.28);
        }

        .detail-action-row {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 12px;
            margin-top: 8px;
        }

        .profile-input,
        select,
        input[type="text"],
        input[type="number"],
        input[type="file"] {
            border: 2px solid var(--palette-pink);
            border-radius: 12px;
            background: #ffffff;
            padding: 8px 12px;
            color: #2F2A28;
            font-size: 1.06rem;
            font-weight: 600;
            box-shadow: inset 0 0 0 1px rgba(125, 156, 101, 0.08);
        }

        select {
            min-width: 340px;
            width: 340px;
            height: 52px;
            font-size: 1.2rem;
            font-weight: 700;
            padding-right: 18px;
            color: #2F2A28;
        }

        select option {
            color: #2F2A28;
            background: #ffffff;
            font-size: 1rem;
        }

        .profile-avatar {
            width: 280px;
            height: 280px;
            object-fit: cover;
            border-radius: 50%;
            display: block;
            border: 3px solid var(--palette-pink);
            box-shadow: 0 12px 24px rgba(13,95,156,0.12);
        }

        #editFirstNameImageButton,
        #editLastNameImageButton,
        #editAgeImageButton,
        #editGenderImageButton,
        #editPhotoImageButton0 {
            display: none !important;
        }
    </style>
    <script type="text/javascript">
        function enableProfileEditing() {
            var first = document.getElementById('<%= firstnameTextBox.ClientID %>');
            var last = document.getElementById('<%= lastnameTextBox.ClientID %>');
            var age = document.getElementById('<%= ageTextBox.ClientID %>');
            var gender = document.getElementById('<%= genderSelectBox.ClientID %>');

            if (first) first.readOnly = false;
            if (last) last.readOnly = false;
            if (age) age.readOnly = false;
            if (gender) gender.disabled = false;

            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <div class="card">
            <table cellpadding="2" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <div class="detail-header">
                            <asp:Label ID="Label1" runat="server" CssClass="brand" Text="Profile"></asp:Label>
                            <div class="header-spacer"></div>
                            <asp:HyperLink ID="homeLink" runat="server" CssClass="home-btn" NavigateUrl="~/Default.aspx" Text="⌂"></asp:HyperLink>
                        </div>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <table cellpadding="3" cellspacing="3" class="auto-style1">
                            <tr>
                                <td class="auto-style15">
                                    <table cellpadding="2" class="auto-style1">
                                        <tr>
                                            <td class="auto-style16">
                                                <asp:Image ID="userImage" runat="server" CssClass="profile-avatar" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FileUpload ID="profilePhotoFileUpload" runat="server" Width="224px" />
                                                <asp:ImageButton ID="editPhotoImageButton0" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editProfilePicImageButton_Click" Width="25px" />
                                                <br />
                                                <asp:Label ID="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="updateButton" runat="server" BackColor="#008CBA" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" Text="Update" Width="248px" OnClick="updateButton_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="auto-style6">
                                    <table cellpadding="3" cellspacing="3" class="auto-style11">
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId" runat="server" Font-Bold="True" Font-Size="Medium" Text="FirstName"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="firstnameTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                                <asp:ImageButton ID="editFirstNameImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editFirstNameImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstnameTextBox" ErrorMessage="Please enter a firstname" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a firstname</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="lastnameLabel" runat="server" Font-Bold="True" Font-Size="Medium" Text="LastName"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="lastnameTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                                <asp:ImageButton ID="editLastNameImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editLastNameImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastnameTextBox" ErrorMessage="Please enter a lastname" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a lastname</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="Agelbl" runat="server" Font-Bold="True" Font-Size="Medium" Text="Age"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="ageTextBox" runat="server" Height="30px" Width="245px" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                                <asp:ImageButton ID="editAgeImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editAgeImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ageTextBox" ErrorMessage="Please enter a age" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a age</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ageTextBox" Display="Dynamic" ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="95" MinimumValue="18" SetFocusOnError="True">Age must be greater than 18</asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Email"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="emailTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a email" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a email</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please enter valid email" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="gender" runat="server" Font-Bold="True" Font-Size="Medium" Text="Gender"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:DropDownList ID="genderSelectBox" runat="server" Height="30px" Width="253px" Font-Size="Medium" Enabled="False">
                                                    <asp:ListItem Selected="True">select</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:ImageButton ID="editGenderImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editGenderImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="genderSelectBox" Display="Dynamic" ErrorMessage="Please Select Gender" Font-Bold="True" ForeColor="Red" InitialValue="select" SetFocusOnError="True">Please select gender</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="status" runat="server" Font-Bold="True" Font-Size="Medium" Text="Status"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="statusTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="joiningDate" runat="server" Font-Bold="True" Font-Size="Medium" Text="Registered Date"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="registerDateTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="detail-action-row">
                                                    <asp:Button ID="editProfileButton" runat="server" CssClass="edit-details-btn" Text="Edit Details" OnClientClick="return enableProfileEditing();" />
                                                    <asp:Button ID="updateDetailButton" runat="server" BackColor="#FF9C4C" BorderColor="#7D9C65" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" ForeColor="#2F2A28" Height="40px" Text="Update Details" Width="211px" OnClick="updateDetailsButton_Click" />
                                                    <asp:Button ID="viewYourBids" runat="server" BackColor="#555555" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" Height="40px" Text="View Your Bids" Width="197px" ForeColor="White" CssClass="auto-style17" OnClick="viewYourBids_Click" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style19">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="yourProductLabel" runat="server" CssClass="brand" Text="Your Products" Visible="False" style="font-size:1.5rem; color:#1b8f5a;"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="YourProductsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Visible="False" CssClass="modern-grid">
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="productImage" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="productNameHyperLink" runat="server" NavigateUrl='<%# Bind("Id","~/Pages/Product.aspx?id={0}") %>' ForeColor="DarkBlue" Text='<%# Bind("name") %>'>HyperLink</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="starting date">
                                    <ItemTemplate>
                                        <asp:Label ID="startingdate" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ending date">
                                    <ItemTemplate>
                                        <asp:Label ID="endingdate" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
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
                            <SortedDescendingHeaderStyle BackColor="#FFB0B0" />
                        </asp:GridView>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="currentActiveLabel" runat="server" CssClass="brand" Text="Current Active Biddings" Visible="False" style="font-size:1.5rem; color:#7c3aed;"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="CurrentActiveBidGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" ForeColor="Black" Visible="False" CssClass="modern-grid">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="productImage" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="productNameHyperLink" runat="server" NavigateUrl='<%# Bind("Id","~/Pages/Product.aspx?id={0}") %>' ForeColor="DarkBlue" Text='<%# Bind("ProductName") %>'>HyperLink</asp:HyperLink>
                                        <%--<asp:Label ID="productName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidding Value">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("bidValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingDate" runat="server" Text='<%# Bind("Date","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="pastBiddingLabel" runat="server" CssClass="brand" Text="Past Biddings" Visible="False" style="font-size:1.5rem; color:#B93636;"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="PastBiddingGridView" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Visible="False" CssClass="modern-grid">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="productImage" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="productNameHyperLink" runat="server" NavigateUrl='<%# Bind("Id","~/Pages/Product.aspx?id={0}") %>' ForeColor="DarkBlue" Text='<%# Bind("ProductName") %>'></asp:HyperLink>
                                        <%--<asp:Label ID="productName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidding Value">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("bidValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingDate" runat="server" Text='<%# Bind("Date","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
