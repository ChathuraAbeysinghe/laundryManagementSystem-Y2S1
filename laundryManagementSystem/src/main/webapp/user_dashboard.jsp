<%@ page session="true" %>
<%@ page import="java.sql.*, Delivery.DBconnect" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Delivery.OrderAz" %>

<%
String role = (String) session.getAttribute("role");
if (role == null || !"user".equals(role)) {
    response.sendRedirect("loginPage.jsp");
}

String publicMessage = "";
try (Connection conn = DBconnect.getConnection()) {
    String sql = "SELECT message FROM public_messages ORDER BY created_at DESC LIMIT 1";
    try (PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            publicMessage = rs.getString("message");
        }
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f5f7fa;
            --dark-color: #212529;
            --success-color: #4bb543;
            --warning-color: #f0ad4e;
            --danger-color: #d9534f;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-color);
            color: var(--dark-color);
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .notice-board {
            background: #fff9c4;
            border-left: 5px solid #ffd600;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .card-title {
            margin: 0 0 15px;
            color: var(--primary-color);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: var(--primary-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: var(--secondary-color);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: var(--primary-color);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .status-pending {
            color: var(--warning-color);
            font-weight: bold;
        }

        .status-completed {
            color: var(--success-color);
            font-weight: bold;
        }

        .status-processing {
            color: var(--accent-color);
            font-weight: bold;
        }

        .no-orders {
            text-align: center;
            color: var(--danger-color);
            font-style: italic;
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr !important;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Welcome to Your Dashboard</h1>
        <p>Manage your orders and place new requests</p>
    </div>

    <% if (!publicMessage.isEmpty()) { %>
    <div class="notice-board">
        <strong>Announcement from Staff:</strong><br>
        <%= publicMessage %>
    </div>
    <% } %>

    <div class="card">
        <h2 class="card-title">Place a New Order</h2>
        <form action="PlaceOrderServlet" method="post">
            <div class="form-group">
                <label for="itemCount">Number of Items:</label>
                <input type="number" id="itemCount" name="itemCount" min="1" required>
            </div>
            <button type="submit">Place Order</button>
        </form>
    </div>

<a href="viewOrders">View My Orders</a>


</body>
</html>
