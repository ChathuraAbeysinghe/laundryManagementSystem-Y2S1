<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Delivery.Order" %>
<%
    Order order = (Order) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Order</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="css/updateOrder.css">
</head>
<body class="custom-body">

<form action="UOrderServlet" method="post" class="form-container">
    <h2 class="form-title">Update Order</h2>
    <input type="hidden" name="orderId" value="<%= order.getId() %>">

    <label>Category:</label>
    <input name="category" value="<%= order.getCategory() %>" class="input-field" required>

    <label>Quantity:</label>
    <input type="number" name="quantity" value="<%= order.getQuantity() %>" class="input-field" required>

    <label>Wash Type:</label>
    <input name="washType" value="<%= order.getWashType() %>" class="input-field">

    <label>Wash Note:</label>
    <textarea name="washNote" class="input-field"><%= order.getWashNote() %></textarea>

    <label>Pickup Address:</label>
    <input name="pickupAddress" value="<%= order.getPickupAddress() %>" class="input-field">

    <label>Pickup Date:</label>
    <input type="date" name="pickupDate" value="<%= order.getPickupDate() %>" class="input-field">

    <label>Pickup Time:</label>
    <input type="time" name="pickupTime" value="<%= order.getPickupTime() %>" class="input-field">

    <label>Delivery Address:</label>
    <input name="deliveryAddress" value="<%= order.getDeliveryAddress() %>" class="input-field">

    <label>Delivery Date:</label>
    <input type="date" name="deliveryDate" value="<%= order.getDeliveryDate() %>" class="input-field">

    <label>Delivery Time:</label>
    <input type="time" name="deliveryTime" value="<%= order.getDeliveryTime() %>" class="input-field">

    <label>Delivery Note:</label>
    <textarea name="deliveryNote" class="input-field"><%= order.getDeliveryNote() %></textarea>

    <label>Payment Method:</label>
    <input name="paymentMethod" value="<%= order.getPaymentMethod() %>" class="input-field">

    <button type="submit" class="btn-submit">Update Order</button>
</form>
</body>
</html>
