<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Delivery.Order" %>
<%
    Order order = (Order) request.getAttribute("order");
    if (order == null) {
%>
    <script>
      alert("Order not found.");
      window.location.href = "ListOrdersServlet";
    </script>
<%
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Order</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-red-50 flex justify-center items-center min-h-screen">
  <div class="bg-white p-6 rounded-lg shadow w-full max-w-lg text-center">
    <h2 class="text-2xl text-red-600 font-bold mb-4">Confirm Delete</h2>
    <p>Are you sure you want to delete Order ID: <strong><%= order.getId() %></strong>?</p>

    <div class="mt-6 flex justify-center gap-4">
        <button onclick="window.location.href='DeleteOrderServlet?orderId=<%= order.getId() %>'"
                class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded">
            Yes, Delete
        </button>
        <button onclick="history.back()" class="bg-gray-300 hover:bg-gray-400 px-4 py-2 rounded">
            Cancel
        </button>
    </div>
  </div>
</body>
</html>
