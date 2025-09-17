<%@ page import="Delivery.Order" %>
<%
  Order order = (Order) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Order Success</title>
  <link rel="stylesheet" href="css/OrderSuccess.css">
</head>
<body>
  <div class="container">
    <div class="success-box">
      <h2>Order Placed Successfully!</h2>
      <p>Your order ID is: <strong><%= order.getId() %></strong></p>
      <a href="ViewOrderServlet?orderId=<%= order.getId() %>">View Order</a>
    </div>
  </div>
</body>
</html>
