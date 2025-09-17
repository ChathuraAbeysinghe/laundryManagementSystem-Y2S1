<%@ page import="java.util.List" %>
<%@ page import="Delivery.CardPaymentModel" %>
<%@ page import="Delivery.PaymentService" %>
<%@ page session="true" %>

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
    <title>Payment History</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        body {
            background-image: url("../images/laundry2.jpg");
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            padding: 2rem;
        }

        h2 {
            color: #ea580c;
            margin-bottom: 2rem;
            text-align: center;
            font-size: 2.2rem;
            font-weight: 600;
        }

        .success-message {
            background-color: rgba(255, 255, 255, 0.9);
            color: #155724;
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 500;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .payment-table {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 2rem;
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

        .action-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .update-btn {
            background-color: #f97316;
            color: white;
            margin-right: 0.5rem;
        }

        .delete-btn {
            background-color: #dc2626;
            color: white;
        }

        .action-btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            background-color: rgba(255, 255, 255, 0.95);
            margin: 15% auto;
            padding: 2rem;
            width: 400px;
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .modal-content h3 {
            color: #ea580c;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .modal-content form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .modal-content label {
            font-weight: 500;
            color: #2c3e50;
        }

        .modal-content input[type="text"] {
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 0.375rem;
            font-size: 1rem;
        }

        .modal-content input[type="submit"],
        .modal-content button {
            padding: 0.8rem;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .modal-content input[type="submit"] {
            background-color: #f97316;
            color: white;
        }

        .modal-content button {
            background-color: #6b7280;
            color: white;
        }

        .modal-content input[type="submit"]:hover,
        .modal-content button:hover {
            opacity: 0.9;
        }

        .status-pending {
            color: #f97316;
            font-weight: 500;
        }

        .status-completed {
            color: #16a34a;
            font-weight: 500;
        }

        .status-failed {
            color: #dc2626;
            font-weight: 500;
        }
    </style>
    <script>
        function openModal(paymentID, currentName) {
            document.getElementById("modal").style.display = "block";
            document.getElementById("paymentID").value = paymentID;
            document.getElementById("newName").value = currentName;
        }

        function closeModal() {
            document.getElementById("modal").style.display = "none";
        }
    </script>
</head>
<body>

<h2>My Payment History</h2>

<% if (message != null) { %>
    <div class="success-message"><%= message %></div>
<% } %>

<div class="payment-table">
    <table>
        <tr>
            <th>Payment ID</th>
            <th>Name</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <% for (CardPaymentModel payment : payments) { %>
            <tr>
                <td><%= payment.getPaymentID() %></td>
                <td><%= payment.getName() %></td>
                <td>$<%= payment.getAmount() %></td>
                <td><%= payment.getDate() %></td>
                <td>
                    <span class="status-<%= payment.getStatus().toLowerCase() %>">
                        <%= payment.getStatus() %>
                    </span>
                </td>
                <td>
                    <% if ("pending".equalsIgnoreCase(payment.getStatus())) { %>
                        <button class="action-btn update-btn" onclick="openModal(<%= payment.getPaymentID() %>, '<%= payment.getName() %>')">Update</button>
                        <form action="DeleteUserPayment" method="post" style="display:inline;">
                            <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                            <input type="submit" class="action-btn delete-btn" value="Delete">
                        </form>
                    <% } else { %>
                        <i>N/A</i>
                    <% } %>
                </td>
            </tr>
        <% } %>
    </table>
</div>

<!-- Modal for update -->
<div id="modal" class="modal">
    <div class="modal-content">
        <h3>Update Payment Details</h3>
        <form action="UpdateUserPayment" method="post">
            <input type="hidden" name="paymentID" id="paymentID">
            <label>New Name:</label>
            <input type="text" name="newName" id="newName" required>
            <input type="submit" value="Update">
            <button type="button" onclick="closeModal()">Cancel</button>
        </form>
    </div>
</div>

</body>
</html>
