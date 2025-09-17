<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Delivery.CardPaymentModel" %>
<%@ page import="Delivery.PaymentService" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%
    //String userID = (String) session.getAttribute("userID");
	String userID = "0";
    PaymentService service = new PaymentService();
    List<CardPaymentModel> payments = service.getPaymentsByUser(userID);

    String message = request.getParameter("msg");
%>
<%
    String name = request.getParameter("name");
    String amount = request.getParameter("amount");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cash on Delivery</title>
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
            margin: 0;
        }
        .payment-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 0.5rem;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ea580c;
            text-align: center;
            margin-bottom: 1.5rem;
        }
        label {
            display: block;
            margin-top: 1rem;
            color: #2c3e50;
            font-weight: 500;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 0.8rem;
            margin-top: 0.5rem;
            border-radius: 0.375rem;
            border: 1px solid #ddd;
            box-sizing: border-box;
            font-size: 1rem;
        }
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            margin-top: 1.5rem;
            background-color: #f97316;
            color: white;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #ea580c;
        }
    </style>
</head>
<body>
<div class="payment-container">
    <h2>Cash on Delivery</h2>
    <form action="CashOnDeliveryServlet" method="post">
        <label>Name</label>
        <input type="text" name="name" value="<%= name %>" readonly />

        <label>Amount (LKR)</label>
        <input type="number" name="amount" value="<%= amount %>" readonly />

        <input type="submit" value="Confirm Order" />
    </form>
</div>
</body>
</html>