<%@ page import="java.util.*, Delivery.OrderAz" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Orders</title>
</head>
<body>

<h2>Your Orders</h2>

<%-- Check if orders are available --%>
<% List<OrderAz> orders = (List<OrderAz>) request.getAttribute("orders"); %>

<% if (orders != null && !orders.isEmpty()) { %>
    <table border="1">
        <thead>
            <tr>
                <th>Order Code</th>
                <th>Item Count</th>
                <th>Order Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% for (OrderAz order : orders) { %>
                <tr>
                    <td><%= order.getOrderCode() %></td>
                    <td><%= order.getItemCount() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td><%= order.getStatus() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>You have not placed any orders yet.</p>
<% } %>

</body>
</html>
