<%@ page import="Delivery.Order" %>
<%
    Order order = (Order) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Order</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <!-- <link rel="stylesheet" href="css/viewOrder.css">  -->
    
    <style>
    /* Background with laundry2.jpg */
.custom-body {
    background-image: url('../images/laundry2.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    min-height: 100vh;
    padding: 2.5rem;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Main card/container */
.order-container {
    background-color: rgba(255, 255, 255, 0.95);
    padding: 2rem;
    border-radius: 0.5rem;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    max-width: 640px;
    width: 100%;
}

/* Title */
.order-title {
    font-size: 1.5rem;
    font-weight: bold;
    color: #ea580c; /* Tailwind orange-600 */
    margin-bottom: 1.5rem;
    text-align: center;
}

/* Order detail text */
.order-details {
    color: #1f2937; /* Tailwind gray-800 */
    font-size: 0.875rem; /* text-sm */
    line-height: 1.75;
}

/* Buttons */
.btn-gray {
    background-color: #d1d5db; /* gray-300 */
    padding: 0.5rem 1rem;
    border-radius: 0.375rem;
    transition: background-color 0.2s;
}
.btn-gray:hover {
    background-color: #9ca3af; /* gray-400 */
}

.btn-yellow {
    background-color: #f59e0b; /* yellow-500 */
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 0.375rem;
    transition: background-color 0.2s;
}
.btn-yellow:hover {
    background-color: #d97706; /* yellow-600 */
}

.btn-red {
    background-color: #ef4444; /* red-500 */
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 0.375rem;
    transition: background-color 0.2s;
}
.btn-red:hover {
    background-color: #dc2626; /* red-600 */
}

/* Button container */
.action-buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 1.5rem;
}
    
    </style>
</head>
<body class="custom-body">
    <div class="order-container">
        <h2 class="order-title">Order Summary</h2>
        <div class="order-details">
            <p><strong>Order ID:</strong> <%= order.getId() %></p>
            <p><strong>Category:</strong> <%= order.getCategory() %></p>
            <p><strong>Quantity:</strong> <%= order.getQuantity() %></p>
            <p><strong>Wash Type:</strong> <%= order.getWashType() %></p>
            <p><strong>Wash Note:</strong> <%= order.getWashNote() %></p>
            <p><strong>Pickup Address:</strong> <%= order.getPickupAddress() %></p>
            <p><strong>Pickup Date & Time:</strong> <%= order.getPickupDate() %> at <%= order.getPickupTime() %></p>
            <p><strong>Delivery Address:</strong> <%= order.getDeliveryAddress() %></p>
            <p><strong>Delivery Date & Time:</strong> <%= order.getDeliveryDate() %> at <%= order.getDeliveryTime() %></p>
            <p><strong>Delivery Note:</strong> <%= order.getDeliveryNote() %></p>
            <p><strong>Payment Method:</strong> <%= order.getPaymentMethod() %></p>
            <p><strong>Payment Status:</strong> <%= order.getPaymentStatus() %></p>
        </div>

        <div class="action-buttons">
            <button onclick="history.back()" class="btn-gray">Back</button>
            <div>
                <a href="loadUpdateOrder?orderId=<%= order.getId() %>" class="btn-yellow">Update</a>
                <a href="DOrderServlet?orderId=<%= order.getId() %>" onclick="return confirm('Are you sure you want to delete this order?')" class="btn-red ml-2">Delete</a>
                <a href="payment.jsp" class="btn-yellow ml-2">Payment</a>
            </div>
        </div>
    </div>
</body>
</html>
