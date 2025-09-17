<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<title>Checkout Page</title>
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

.checkout-container {
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

select, input[type="text"] {
	width: 100%;
	padding: 0.8rem;
	margin-top: 0.5rem;
	border-radius: 0.375rem;
	border: 1px solid #ddd;
	box-sizing: border-box;
	font-size: 1rem;
}

input[type="button"] {
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

input[type="button"]:hover {
	background-color: #ea580c;
}
</style>
<script>
    function redirectToForm() {
        const paymentMethod = document.getElementById("payment").value;
        const fullName = document.getElementById("name").value;
        const amount = document.getElementById("amount").value;

        if (!paymentMethod || !fullName || !amount) {
            alert("Please fill in all fields.");
            return;
        }

        const params = "name=" + encodeURIComponent(fullName) + "&amount=" + encodeURIComponent(amount);

        if (paymentMethod === "debit_card") {
            window.location.href = "cardPayment.jsp?" + params;
        } else if (paymentMethod === "cash_on_delivery") {
            window.location.href = "cashOnDelivery.jsp?" + params;
        }
    }
</script>

</head>
<body>
	<div class="checkout-container">
		<h2>Checkout</h2>

		<!-- No form submission, using JS for navigation -->
		<label for="name">Full Name</label> <input type="text" id="name"
			name="name" required /> <label for="amount">Amount</label> <input
			type="text" id="amount" name="amount" required /> <label
			for="payment">Select Payment Method</label> <select id="payment"
			name="paymentMethod" required>
			<option value="">-- Select Payment Method --</option>
			<option value="debit_card">Debit Card</option>
			<option value="cash_on_delivery">Cash on Delivery</option>
		</select> <input type="button" value="Proceed to Pay"
			onclick="redirectToForm()" />
	</div>
</body>
</html>
