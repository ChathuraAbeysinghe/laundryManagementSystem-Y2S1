<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Order</title>
    <link rel="stylesheet" href="css/PlaceOrder.css">
</head>
<body class="page-body">
    <form action="POrderServlet" method="post" class="form-container">
        <h2 class="form-title">Place Laundry Order</h2>

        <label>Category:</label>
        <select name="category" class="form-input">
            <option>Clothes</option>
            <option>Bedsheets</option>
        </select>

        <label>Quantity:</label>
        <input type="number" name="quantity" required class="form-input">

        <label>Wash Type:</label>
        <select name="washType" class="form-input">
            <option>Washing</option>
            <option>Ironing</option>
            <option>Dry Cleaning</option>
        </select>

        <label>Wash Note:</label>
        <textarea name="washNote" class="form-input"></textarea>

        <label>Pickup Address:</label>
        <input type="text" name="pickupAddress" required class="form-input">

        <div class="inline-fields">
    <div class="field">
        <label>Pickup Date:</label>
        <input type="date" name="pickupDate" required class="form-input">
    </div>
    <div class="field">
        <label>Pickup Time:</label>
        <input type="time" name="pickupTime" required class="form-input">
    </div>
    </div>
        

        <label>Delivery Address:</label>
        <input type="text" name="deliveryAddress" required class="form-input">

        <div class="inline-fields">
    <div class="field">
        <label>Delivery Date:</label>
        <input type="date" name="deliveryDate" required class="form-input">
    </div>
    <div class="field">
        <label>Delivery Time:</label>
        <input type="time" name="deliveryTime" required class="form-input">
    </div>
</div>
        

        <label>Delivery Note:</label>
        <textarea name="deliveryNote" class="form-input"></textarea>

        <label>Payment Method:</label>
        <select name="paymentMethod" class="form-input">
            <option>Cash on Delivery</option>
            <option>Card</option>
        </select>

        <input type="submit" value="Place Order" class="submit-btn">
    </form>
</body>
</html>
