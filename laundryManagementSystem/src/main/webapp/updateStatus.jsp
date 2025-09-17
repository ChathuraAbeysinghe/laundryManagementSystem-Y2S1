<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Delivery Status</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f4f8;
        }
        .dropdown {
            width: 350px;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
        }
        label {
            font-size: 18px;
            margin-bottom: 15px;
            display: block;
            color: #333;
        }
        select, input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s;
            margin-bottom: 15px;
        }
        select:focus, input:focus {
            border-color: #4a90e2;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            border-radius: 8px;
            border: none;
            background-color: #4a90e2;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        button:hover {
            background-color: #357ab8;
            transform: translateY(-2px);
        }
        button:active {
            transform: translateY(1px);
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
%>

<div class="dropdown">
    <form action="update" method="post" onsubmit="return validateDate()">
        <input type="hidden" name="CustomerId" value="<%=id%>">

        <label for="delivery-status">Update Delivery Status:</label>
        <select id="delivery-status" name="DeliveryStatus">
            <option value="<%=status%>"><%=status%></option>
            <option value="pending">Pending</option>
            <option value="inprogress">In Progress</option>
            <option value="completed">Completed</option>
        </select>

        <label for="delivery-date">Select Date:</label>
        <input type="date" id="delivery-date" name="EstimatedDateOfDelivery" value="<%=date%>">

        <label for="delivery-time">Select Time:</label>
        <input type="time" id="delivery-time" name="EstimatedTimeOfDelivery" value="<%=time%>">

        <button type="submit" value="submit">Update Status</button>
    </form>
</div>

<script>
    function validateDate() {
        const selectedDate = new Date(document.getElementById("delivery-date").value);
        const currentDate = new Date();
        
        selectedDate.setHours(0, 0, 0, 0);
        currentDate.setHours(0, 0, 0, 0);

        if (selectedDate < currentDate) {
            alert("The selected date must be today or a future date.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
