<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Delivery.Order" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Orders</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8 font-sans">
    <div class="max-w-5xl mx-auto">
        <h1 class="text-2xl font-bold mb-6 text-center text-gray-700">All Orders</h1>
        <table class="min-w-full bg-white border rounded shadow">
            <thead class="bg-orange-500 text-white">
                <tr>
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Category</th>
                    <th class="px-4 py-2">Quantity</th>
                    <th class="px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Order o : orders) {
                %>
                <tr class="border-t">
                    <td class="px-4 py-2"><%= o.getId() %></td>
                    <td class="px-4 py-2"><%= o.getCategory() %></td>
                    <td class="px-4 py-2"><%= o.getQuantity() %></td>
                    <td class="px-4 py-2">
                        <a href="ViewOrderServlet?orderId=<%= o.getId() %>" class="text-blue-600 hover:underline">View</a>
                        |
                        <a href="DeleteOrderServlet?orderId=<%= o.getId() %>" onclick="return confirm('Are you sure?')" class="text-red-500 hover:underline">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
