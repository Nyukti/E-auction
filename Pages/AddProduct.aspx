<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OnlineAuctionSystem.Pages.AddProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product</title>
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
            max-width: 1100px;
            margin: 28px auto;
            padding: 0 18px 40px;
        }

        .card {
            background: var(--palette-white);
            border: 1px solid var(--palette-border);
            border-radius: 20px;
            box-shadow: 0 14px 28px var(--palette-shadow);
            padding: 20px 24px;
        }

        .topbar {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 8px 0 20px;
        }

        .brand {
            font-size: 2.1rem;
            font-weight: 800;
            color: var(--palette-deep);
            letter-spacing: -0.04em;
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
            transition: color 0.25s ease, transform 0.25s ease, background 0.25s ease;
        }

        .home-btn:hover {
            background: linear-gradient(135deg, #d9f7ff, #bfeafc 48%, #a6def7);
            color: var(--palette-pink);
            transform: translateY(-1px);
        }

        .modern-form {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        .modern-form td {
            vertical-align: top;
            padding: 10px 12px;
        }

        .modern-form .label-cell {
            width: 220px;
            font-weight: 700;
            color: var(--palette-text);
            font-size: 1.05rem;
        }

        .modern-form input[type="text"],
        .modern-form input[type="number"],
        .modern-form input[type="date"],
        .modern-form input[type="time"],
        .modern-form textarea {
            width: 100%;
            max-width: 360px;
            padding: 12px 14px;
            border: 1px solid rgba(255,157,157,0.45);
            border-radius: 12px;
            background: #fdfdf7;
            color: var(--palette-text);
            font-size: 1rem;
            box-sizing: border-box;
            transition: border-color 0.25s ease, box-shadow 0.25s ease;
        }

        .modern-form input:focus,
        .modern-form textarea:focus {
            outline: none;
            border-color: var(--palette-pink);
            box-shadow: 0 0 0 3px rgba(255, 157, 157, 0.15);
        }

        .modern-form textarea {
            min-height: 110px;
            resize: vertical;
        }

        .modern-btn {
            width: 100%;
            max-width: 460px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, #3fa6d5, #2279b3);
            color: #ffffff;
            border: 1px solid rgba(17, 138, 178, 0.8);
            font-weight: 800;
            font-size: 1.05rem;
            padding: 15px 18px;
            cursor: pointer;
            box-shadow: 0 12px 22px rgba(17, 138, 178, 0.30);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .modern-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 28px rgba(17, 138, 178, 0.36);
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 80px;
        }

        .auto-style3 {
            width: 1088px;
        }

        .auto-style4 {
            width: 87px;
        }

        .auto-style6 {
            width: 719px;
        }

        .auto-style11 {
            width: 105%;
            margin-left: 0px;
        }

        .auto-style10 {
            width: 181px;
        }

        .auto-style14 {
            width: 427px;
        }

        .auto-style15 {
            width: 138px;
        }

        .auto-style16 {
            width: 116px;
        }

        .auto-style17 {
            margin-left: 31px;
        }
    </style>

</head>
<body>
    <form id="form2" runat="server">
        <div class="page-shell">
            <div class="card">
                <div class="topbar">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="home-btn" NavigateUrl="~/Default.aspx" Text="⌂"></asp:HyperLink>
                <asp:Label ID="Label1" runat="server" CssClass="brand" Text="Add Product"></asp:Label>
            </div>

            <table cellpadding="3" cellspacing="3" class="modern-form">
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="imageId" runat="server" Text="Product Image"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="productImageFileUpload" runat="server" BackColor="White" ForeColor="Blue" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="productImageFileUpload" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">Please select file</asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lastnameLabel0" runat="server" Text="Product Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="productNameTextBox" runat="server" Height="30px" Width="245px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="productNameTextBox" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter product name</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lastnameLabel" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td>
                        <textarea runat="server" id="descriptionTextarea" value="" rows="5" cols="31" name="descriptionTextarea"></textarea>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="descriptionTextarea" ErrorMessage="Please enter a base price" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a Description</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="basepriceLbl" runat="server" Text="Base Price"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="basePriceTextBox" runat="server" Height="30px" Width="245px" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="basePriceTextBox" ErrorMessage="Please enter a base price" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a base price</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="basePriceTextBox" Display="Dynamic" ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="1000000" MinimumValue="1" SetFocusOnError="True" Type="Integer">base price not be 0</asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="startdateLbl" runat="server" Text="Starting Date-Time"></asp:Label>
                    </td>
                    <td>
                        <input type="date" runat="server" id="startDate" value="" name="startDateName" required="required" autofocus="autofocus" />
                        <input type="time" runat="server" id="startTime" value="" name="startTimeName" required="required" autofocus="autofocus" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="gender" runat="server" Text="Ending Date-Time"></asp:Label>
                    </td>
                    <td>
                        <input type="date" runat="server" id="endDate" value="" name="endDateName" required="required" autofocus="autofocus" />
                        <input type="time" runat="server" id="endTime" value="" name="endTimeName" required="required" autofocus="autofocus" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="addProductButton" runat="server" CssClass="modern-btn" Text="Add Product" OnClick="addProductButton_Click" />
                    </td>
                </tr>
            </table>
            </div>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>

        /*var toCheck = Date.now();
        var msToCheck = toCheck.getTime();
        var msNow = Date.now();*/
        $("#startDate").change(function () {
            var startDate = document.getElementById("startDate").value;
            let currentDate = new Date().toJSON().slice(0, 10);

            if (Date.parse(startDate) < Date.parse(currentDate)) {
                alert("Start date cannot be earlier than today");
                document.getElementById("startDate").value = "";
            }
        });

        $("#endDate").change(function () {
            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;

            if ((Date.parse(endDate) < Date.parse(startDate))) {
                alert("End date should be greater than Start date");
                document.getElementById("endDate").value = "";
            }
        });
    </script>
</body>
</html>
