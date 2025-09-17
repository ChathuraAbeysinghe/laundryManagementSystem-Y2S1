<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Order</title>
    <style>
        body {
            background-image: url("../images/laundry2.jpg");
            background-position: center;
            background-repeat: no-repeat;
            font-family: sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 0.5rem;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ea580c;
            text-align: center;
            margin-bottom: 1rem;
        }

        .form-input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 0.375rem;
            margin-bottom: 1rem;
        }

        .submit-btn {
            background-color: #f97316;
            color: white;
            padding: 0.75rem;
            font-weight: bold;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #ea580c;
        }

        .inline-fields {
            display: flex;
            justify-content: space-between;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .inline-fields .field {
            flex: 1;
        }

        .inline-fields .field label {
            display: block;
            margin-bottom: 0.25rem;
            font-weight: 500;
        }
    </style>
</head>
<body class="page-body">
    <form id="placeOrderForm" class="form-container">
        <h2 class="form-title">Place Laundry Order</h2>

        <label>Category:</label>
        <select name="category" class="form-input" required>
            <option>Clothes</option>
            <option>Bedsheets</option>
        </select>

        <label>Quantity:</label>
        <input type="number" name="quantity" required class="form-input">

        <label>Wash Type:</label>
        <select name="washType" class="form-input" required>
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

        <input type="submit" value="Place Order" class="submit-btn">
    </form>

    <script>
        document.getElementById('placeOrderForm').addEventListener('submit', function (e) {
            e.preventDefault(); // prevent default form submit

            // Optional: Show success message
            alert("Order placed successfully!");

            // Redirect to checkout.jsp
            window.location.href = "payment.jsp";
        });
    </script>
</body>
</html>
