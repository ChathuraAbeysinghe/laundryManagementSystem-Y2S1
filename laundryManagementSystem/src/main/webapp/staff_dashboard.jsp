<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WashMart - Staff Dashboard</title>
    
    <!-- Professional Icon and Font Libraries -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    
</head>
<body>
    <div class="dashboard-container">
        <header class="dashboard-header">
            <div class="header-left">
                <h1>
                    <i class="fas fa-tachometer-alt"></i> Staff Dashboard
                </h1>
            </div>
            <div class="header-right">
                <div class="user-info">
                    <i class="fas fa-user-circle"></i> 
                    <span>${sessionScope.username} | ${sessionScope.role}</span>
                </div>
            <div class="header-actions">
    <a href="logout.jsp" class="btn-logout">
        <i class="fas fa-sign-out-alt"></i> Logout
    </a>
</div>
            

            </div>
        </header>

        <c:if test="${not empty staffDetails}">
            <section class="section staff-details">
                <h2><i class="fas fa-id-card"></i> Your Details</h2>
                <c:forEach items="${staffDetails}" var="staff">
                    <div class="detail-grid">
                        <div class="detail-item">
                            <i class="fas fa-fingerprint"></i>
                            <strong>Staff ID:</strong> ${staff.id}
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-user"></i>
                            <strong>Username:</strong> ${staff.username}
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-envelope"></i>
                            <strong>Email:</strong> ${staff.email}
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-phone"></i>
                            <strong>Phone:</strong> ${staff.phone}
                        </div>
                    </div>
                    <div class="action-buttons">
                        <form action="editStaff.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="${staff.id}" />
                            <button type="submit" class="btn btn-edit">
                                <i class="fas fa-edit"></i> Edit Profile
                            </button>
                        </form>
                        <form action="DeleteStaffServlet" method="post" style="display:inline;" 
                              onsubmit="return confirm('Are you sure you want to delete your profile?');">
                            <input type="hidden" name="id" value="${staff.id}" />
                            <button type="submit" class="btn btn-delete">
                                <i class="fas fa-trash"></i> Delete Profile
                            </button>
                        </form>
                    </div>
                </c:forEach>
            </section>
        </c:if>

        <c:if test="${empty staffDetails}">
            <div class="no-data">
                <i class="fas fa-exclamation-triangle"></i> No staff details found for your account.
            </div>
        </c:if>

        <c:if test="${not empty orderList}">
            <section class="section orders-section">
                <h2><i class="fas fa-shopping-basket"></i> Order Management</h2>
                <div class="table-responsive">
                    <table class="orders-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Code</th>
                                <th>User ID</th>
                                <th>Items</th>
                                <th>Order Date</th>
                                <th>Current Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderList}" var="order">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.orderCode}</td>
                                    <td>${order.userId}</td>
                                    <td>${order.itemCount}</td>
                                    <td>
                                        <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                    <td>
                                        <span class="status-badge 
                                            ${order.status == 'Completed' ? 'text-success' : 
                                              order.status == 'Cancelled' ? 'text-danger' : 
                                              'text-warning'}">
                                            ${order.status}
                                        </span>
                                    </td>
                                    <td>
                                        <form action="updateOrderStatus" method="post" class="status-select">
                                            <input type="hidden" name="orderId" value="${order.id}" />
                                            <select name="status">
                                                <option value="Processing" ${order.status == 'Processing' ? 'selected' : ''}>Processing</option>
                                                <option value="Completed" ${order.status == 'Completed' ? 'selected' : ''}>Completed</option>
                                                <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                            </select>
                                            <button type="submit" class="btn btn-edit" style="padding: 6px 10px;">
                                                <i class="fas fa-sync"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </c:if>

        <c:if test="${empty orderList}">
            <div class="no-data">
                <i class="fas fa-shopping-cart"></i> No orders found at the moment.
            </div>
        </c:if>
    </div>
    <c:if test="${not empty staffDetails}">
    <section class="section staff-details">
        <!-- Display Staff Details -->
    </section>
</c:if>

<c:if test="${not empty orderList}">
    <section class="section orders-section">
        <!-- Display Orders Table -->
    </section>
</c:if>
    

    <!-- Optional: Add some subtle animations or interactivity with JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Subtle hover effects for interactive elements
            const interactiveElements = document.querySelectorAll('.btn, .detail-item, .status-select');
            interactiveElements.forEach(el => {
                el.addEventListener('mouseenter', function() {
                    this.style.transform = 'scale(1.02)';
                    this.style.transition = 'transform 0.2s ease';
                });
                el.addEventListener('mouseleave', function() {
                    this.style.transform = 'scale(1)';
                });
            });
        });
        
    </script>
    <section class="section">
   <h2>Post Public Message</h2>
<form action="PostPublicMessageServlet" method="post">
    <textarea name="message" rows="5" cols="50" required></textarea><br>
    <input type="submit" value="Send to All Users">
</form>

</section>
    
    <style>
        :root {
            /* Professional Color Palette */
            --primary-color: #2c58a0;
            --secondary-color: #4d79ff;
            --accent-color: #27ae60;
            --warning-color: #e74c3c;
            --background-light: #f0f4f8;
            --text-dark: #333;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            background: linear-gradient(135deg, var(--background-light) 0%, #e6f2ff 100%);
            color: var(--text-dark);
            line-height: 1.6;
            padding: 20px;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .dashboard-header {
            background: var(--primary-color);
            color: var(--white);
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dashboard-header h1 {
            font-size: 1.8rem;
            font-weight: 500;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            background: rgba(255,255,255,0.2);
            padding: 8px 15px;
            border-radius: 20px;
        }

        .header-actions {
            display: flex;
            gap: 10px;
        }

        .btn-logout {
            background: rgba(255,255,255,0.1);
            color: var(--white);
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.3s ease;
        }

        .btn-logout:hover {
            background: rgba(255,255,255,0.2);
        }

        .logout-form {
            margin: 0;
            display: inline;
        }

        .logout-form button {
            background: none;
            border: none;
            color: var(--white);
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .section {
            padding: 20px;
            background: var(--white);
            margin: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .staff-details, .orders-section {
            display: grid;
            gap: 15px;
        }

        .detail-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }

        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 8px;
            background: var(--background-light);
            border-radius: 6px;
        }

        .detail-item i {
            color: var(--secondary-color);
            min-width: 25px;
            text-align: center;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background: var(--secondary-color);
            color: var(--white);
        }

        .btn-edit:hover {
            background: #3367d6;
        }

        .btn-delete {
            background: var(--warning-color);
            color: var(--white);
        }

        .btn-delete:hover {
            background: #c0392b;
        }

        .orders-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
        }

        .orders-table thead {
            background: var(--secondary-color);
            color: var(--white);
        }

        .orders-table th, .orders-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        .orders-table tr:nth-child(even) {
            background: #f9f9f9;
        }

        .status-select {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .status-select select {
            padding: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .no-data {
            text-align: center;
            color: var(--warning-color);
            padding: 20px;
            background: #fff0f0;
            border-radius: 8px;
        }

        @media (max-width: 768px) {
            .detail-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</body>
</html>