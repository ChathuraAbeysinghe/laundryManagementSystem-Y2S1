<%@ page import="java.util.List" %>
<%@ page import="Delivery.CardPaymentModel" %>
<%@ page import="Delivery.PaymentService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PaymentService service = new PaymentService();
    List<CardPaymentModel> pendingPayments = service.getPendingPayments();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Payments</title>
    <style>
        body {
            background-image: url("../images/laundry2.jpg");
            background-position: center;
            background-repeat: no-repeat;
            font-family: sans-serif;
            min-height: 100vh;
            padding: 2rem;
            margin: 0;
        }
        h2 {
            font-size: 2.2rem;
            font-weight: 600;
            color: #ea580c;
            text-align: center;
            margin-bottom: 2rem;
        }
        .payment-table {
            width: 90%;
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            background-color: #f97316;
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }
        td {
            padding: 1rem;
            border-bottom: 1px solid #eee;
            color: #2c3e50;
        }
        tr:hover {
            background-color: rgba(249, 115, 22, 0.1);
        }
        button {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .accept {
            background-color: #16a34a;
            color: white;
            margin-right: 0.5rem;
        }
        .reject {
            background-color: #dc2626;
            color: white;
        }
        button:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <h2>Pending Payments</h2>
    <div class="payment-table">
        <table>
            <tr>
                <th>Payment ID</th>
                <th>Name</th>
                <th>Amount (LKR)</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            <%
                for (CardPaymentModel payment : pendingPayments) {
            %>
            <tr>
                <td><%= payment.getPaymentID() %></td>
                <td><%= payment.getName() %></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getDate() %></td>
                <td>
                    <form action="AcceptPayment" method="post" style="display:inline;">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>" />
                        <button type="submit" class="accept">Accept</button>
                    </form>
                    <form action="RejectPayment" method="post" style="display:inline;">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>" />
                        <button type="submit" class="reject">Reject</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
