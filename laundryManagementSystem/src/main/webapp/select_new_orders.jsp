<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f4f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .form {
            background-color: rgba(255,255,255,0.5);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #1976d2;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #333;
            font-size: 1rem;
            margin-bottom: 8px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: #1976d2;
        }


		.btns {
  			display: flex;
  			gap: 15px;
  			margin-top: 20px;
		}


		.submit-btn, .back-btn {
		  	background-color: #ff7a1a;
		  	color: white;
		  	border: none;
		  	padding: 12px 20px;
		  	font-size: 16px;
		  	border-radius: 5px;
		  	cursor: pointer;
		  	transition: background-color 0.3s ease;
		  	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}

		.submit-btn:hover, .back-btn:hover {
		  	background-color: #e06912;
		}
		
		.submit-btn:focus, .back-btn:focus {
		  	outline: 2px solid #ff7a1a;
		}
		
		.submit-btn span, .back-btn span {
		  	font-weight: bold;
		  	display: inline-block;
		}


            h2 {
                font-size: 1.5rem;
            }
        }

    </style>
    
    
    <!-- <script>
        function fetchAddress() {
            const customerId = document.getElementById("customer-id").value;

            fetch(`custometAddress?Cid=${customerId}`)
                .then(response => response.json())
                .then(data => {
                    document.getElementById("delivery-address").value = data.address || "Address not found";
                })
                .catch(error => console.log("Error: " + error));
        }
    </script>  -->
    
    <script>
    function fetchAddress() {
        const customerId = document.getElementById("customer-id").value;

        fetch(`custometAddress?Cid=${customerId}`)
            .then(response => response.json())
            .then(data => {
                document.getElementById("delivery-address").value = data.address || "Address not found";
            })
            .catch(error => console.log("Error: " + error));
    }
</script>
    
    
    
</head>
<body>
    <div class="form">
    <h2>Add delivery</h2>
    
    <form action="Insert" method="post" onsubmit="return validateDate()">
    
        <label for="customer-id">Customer ID:</label>
        <input type="text" id="customer-id" name="CustomerId" placeholder="Enter customer ID" onblur="fetchAddress()" required>
        
        <label for="delivery-address">Delivery Address:</label>
        <input type="text" id="delivery-address" name="DeliveryAddress" required>
        
        <label for="delivery-status">Delivery Status:</label>
        <select id="delivery-status" name="DeliveryStatus">
            <option value="pending">Pending</option>
            <option value="in-progress">In Progress</option>
            <option value="completed">Completed</option>
        </select>

        <label for="estimate-date-of-delivery">Estimated Date of Delivery:</label>
        <input type="date" id="estimate-date-of-delivery" name="EstimatedDateOfDelivery" required>
        
        <label for="estimate-time-of-delivery">Estimated Time of Delivery:</label>
        <input type="time" id="estimate-time-of-delivery" name="EstimatedTimeOfDelivery" required>

        <div class="btns">
            <button type="submit" class="submit-btn"><span>Save</span></button>
            <button type="button" class="back-btn" onclick="window.location.href='showServlet'"><span>Selected ones</span></button>
        </div>
        
    </form>
</div>

<script>
    function validateDate() {
        const selectedDate = new Date(document.getElementById("estimate-date-of-delivery").value);
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
