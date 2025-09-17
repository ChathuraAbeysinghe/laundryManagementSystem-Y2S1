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
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
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
        .message-box {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 0.5rem;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ea580c;
            margin-bottom: 1rem;
        }
        p {
            color: #333;
            margin-bottom: 1.5rem;
            font-size: 1.1rem;
        }
        .history-btn {
            background-color: #f97316;
            color: white;
            padding: 0.75rem 1.5rem;
            font-weight: bold;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        .history-btn:hover {
            background-color: #ea580c;
        }
    </style>
</head>
<body>
<div class="message-box">
    <h2>Payment Successful!</h2>
    <p>Thank you for your payment. Your transaction has been completed successfully.</p>
    <a href="userPaymentHistory.jsp" class="history-btn">Go To Payment History</a>
</div>
</body>
</html>
