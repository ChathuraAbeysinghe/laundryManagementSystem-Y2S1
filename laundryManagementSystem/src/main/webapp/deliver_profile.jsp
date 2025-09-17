<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Profile</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f4f6f9;
    }

    .full {
      padding: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }

    .profile {
    background-color: #007bff;
    color: white;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
	}
	
	.profile-pic {
	    width: 120px;
	    height: 120px;
	    border-radius: 50%;
	    object-fit: cover;
	    border: 3px solid white;
	    margin-right: 20px;
	}
	
	.deliver-name {
	    margin: 0;
	}
	
	.logout-btn {
	    padding: 5px 14px;
	    border-radius: 5px;
	    background-color: #0056b3;
	    color: white;
	    border: none;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	    align-self: start;
	}
	
	.logout-btn:hover {
	    background-color: #003d80;
	}

    h2 {
      color: #1976d2;
      margin-top: 40px;
    }
    
    p {
      font-weight: bold;
      color: white;
      font-size: 30px;
    }

    .del-and-pick {
      display: flex;
      gap: 20px;
      justify-content: space-between;
      margin: 20px 0;
    }

    .part {
      flex: 1;
      padding: 20px;
      border-radius: 10px;
      color: white;
      font-weight: bold;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .part.purple { background-color: #6a4c93; }
    .part.pink { background-color: #e91e63; }
    .part.red { background-color: #f44336; }

    .order-count {
      font-size: 2em;
      font-weight: bold;
    }

    .count-name {
      font-size: 0.9em;
      margin-top: 5px;
    }

    .new-order-btn {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 12px 25px;
      font-size: 1.1em;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .new-order-btn:hover {
      background-color: #218838;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 30px;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f1f1f1;
      color: #333;
      font-weight: bold;
    }

    td {
      font-style: italic;
      color: #555;
    }

    .update-btn, .delete-btn {
      padding: 10px 20px;
      border-radius: 5px;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 0.9em;
      transition: transform 0.2s ease;
    }

    .update-btn {
      background-color: #4CAF50;
    }

    .update-btn:hover {
      transform: scale(1.05);
    }

    .delete-btn {
      background-color: #f44336;
    }

    .delete-btn:hover {
      transform: scale(1.05);
    }

  </style>
</head>
<body>

  <div class="full">
    
    <div class="profile">
    <img src="img/profilePic.jpg" alt="Profile Picture" class="profile-pic">
    
        <p class="deliver-name">Wash Mart Delivery</p> 
        <a href="index.jsp">  <!--                       edit profile page                     -->
            <button class="logout-btn" onclick="confirmLogout()">Logout</button>
        </a>
    
	</div>


    <h2>Delivery and Pickup Orders</h2>
	
    <div class="del-and-pick">
      <div class="part purple">
        <div>
          <div class="order-count">${count.pending != null ? count.pending : 0}</div>
          <div class="count-name">Pending</div>
        </div>
      </div>

      <div class="part pink">
        <div>
          <div class="order-count">${count.inprogress != null ? count.inprogress : 0}</div>
          <div class="count-name">In Progress</div> 
        </div>
      </div>

      <div class="part red">
        <div>
          <div class="order-count">${count.completed != null ? count.completed : 0}</div>
          <div class="count-name">Complete</div>
        </div>
      </div>
    </div>

    <h2>Orders</h2>

    <a href="select_new_orders.jsp">
      <button class="new-order-btn">+ Add New Order</button>
    </a>

    <table>
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Customer ID</th>
          <th>Delivery Address</th>
          <th>Status</th>
          <th>Delivery Date</th>
          <th>Delivery Time</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="deliverice" items="${alldelivery}">
          <tr>
            <td>${deliverice.orderId}</td>
            <td>${deliverice.customerId}</td>
            <td>${deliverice.deliveryAddress}</td>
            <td>${deliverice.deliveryStatus}</td>
            <td>${deliverice.estimatedDateOfDelivery}</td>
            <td>${deliverice.estimatedTimeOfDelivery}</td>
            <td>
              <a href="updateStatus.jsp?id=${deliverice.orderId}&status=${deliverice.deliveryStatus}&date=${deliverice.estimatedDateOfDelivery}&time=${deliverice.estimatedTimeOfDelivery}">
                <button class="update-btn">Update</button>
              </a>
              <form action="delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="${deliverice.orderId}">
                <button class="delete-btn">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  
  <script>
    function confirmLogout() {
        if (confirm("Are you sure you want to logout?")) {
            window.location.href = "home.jsp";
        } else {
        	window.location.href = "showServlet";
        }
    }
</script>

</body>
</html>
