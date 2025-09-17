<%@ page session="true" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !"staff".equals(role)) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Orders</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
        }
        
        .container {
            display: flex;
            min-height: 100vh;
        }
        
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }
        
        .sidebar-header {
            padding: 0 20px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-header h2 {
            font-size: 1.5rem;
            margin-bottom: 5px;
        }
        
        .sidebar-menu {
            padding: 20px 0;
        }
        
        .menu-item {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            color: #ecf0f1;
            text-decoration: none;
            transition: 0.3s;
        }
        
        .menu-item:hover, .menu-item.active {
            background-color: #34495e;
            border-left: 4px solid #3498db;
        }
        
        .menu-item i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .filter-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .search-box {
            flex: 1;
            max-width: 400px;
            position: relative;
        }
        
        .search-box input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 0.9rem;
        }
        
        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #95a5a6;
        }
        
        .filter-options {
            display: flex;
            gap: 10px;
        }
        
        .filter-select {
            padding: 10px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            background-color: white;
            font-size: 0.9rem;
        }
        
        .orders-table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }
        
        .orders-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .orders-table th, .orders-table td {
            padding: 15px;
            text-align: left;
        }
        
        .orders-table thead {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .orders-table tbody tr {
            border-bottom: 1px solid #e0e0e0;
        }
        
        .orders-table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-pending {
            background-color: #fff8e1;
            color: #ff9800;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .btn {
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s;
        }
        
        .btn-view {
            background-color: #e3f2fd;
            color: #2196f3;
        }
        
        .btn-view:hover {
            background-color: #bbdefb;
        }
        
        .btn-update {
            background-color: #fff8e1;
            color: #ff9800;
        }
        
        .btn-update:hover {
            background-color: #ffecb3;
        }
        
        .btn-bulk {
            padding: 10px 15px;
            border-radius: 6px;
            font-size: 0.9rem;
            background-color: #3498db;
            color: white;
        }
        
        .btn-bulk:hover {
            background-color: #2980b9;
        }
        
        .checkbox-cell {
            width: 30px;
        }
        
        .order-checkbox {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        
        .pagination {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 20px;
            gap: 10px;
        }
        
        .pagination-info {
            font-size: 0.9rem;
            color: #7f8c8d;
        }
        
        .pagination-buttons {
            display: flex;
            gap: 5px;
        }
        
        .pagination-buttons button {
            padding: 8px 12px;
            border: 1px solid #e0e0e0;
            background-color: white;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .pagination-buttons button:hover, .pagination-buttons button.active {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
        }
        
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
                padding: 20px 0;
            }
            
            .sidebar-header h2, .sidebar-header p, .menu-item span {
                display: none;
            }
            
            .menu-item {
                justify-content: center;
                padding: 15px;
            }
            
            .menu-item i {
                margin-right: 0;
                font-size: 1.2rem;
            }
            
            .main-content {
                margin-left: 70px;
            }
            
            .filter-section {
                flex-direction: column;
                align-items: stretch;
            }
            
            .search-box {
                max-width: 100%;
            }
            
            .filter-options {
                width: 100%;
                overflow-x: auto;
                padding-bottom: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>Laundry Service</h2>
                <p>Staff Portal</p>
            </div>
            <div class="sidebar-menu">
                <a href="staff_dashboard.jsp" class="menu-item">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                <a href="pending_orders.jsp" class="menu-item active">
                    <i class="fas fa-hourglass-half"></i>
                    <span>Pending Orders</span>
                </a>
                <a href="processing_orders.jsp" class="menu-item">
                    <i class="fas fa-spinner"></i>
                    <span>Processing</span>
                </a>
                <a href="completed_orders.jsp" class="menu-item">
                    <i class="fas fa-check-circle"></i>
                    <span>Completed</span>
                </a>
                <a href="all_orders.jsp" class="menu-item">
                    <i class="fas fa-list"></i>
                    <span>All Orders</span>
                </a>
                <a href="user_management.jsp" class="menu-item">
                    <i class="fas fa-users"></i>
                    <span>Users</span>
                </a>
                <a href="settings.jsp" class="menu-item">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </a>
                <a href="logout.jsp" class="menu-item">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-header">
                <h1>Pending Orders</h1>
                <button class="btn btn-bulk" id="bulkUpdateBtn" disabled>
                    <i class="fas fa-tasks"></i> Bulk Update
                </button>
            </div>
            
            <div class="filter-section">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search by order ID, customer name...">
                </div>
                
                <div class="filter-options">
                    <select class="filter-select">
                        <option value="">Sort By: Newest First</option>
                        <option value="oldest">Sort By: Oldest First</option>
                        <option value="customer">Sort By: Customer Name</option>
                        <option value="items">Sort By: Number of Items</option>
                    </select>
                    
                    <select class="filter-select">
                        <option value="">All Service Types</option>
                        <option value="wash">Wash & Fold</option>
                        <option value="dry">Dry Cleaning</option>
                        <option value="iron">Ironing Only</option>
                    </select>
                </div>
            </div>
            
            <div class="orders-table-container">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th class="checkbox-cell">
                                <input type="checkbox" id="selectAll" class="order-checkbox">
                            </th>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date Submitted</th>
                            <th>Items</th>
                            <th>Service Type</th>
                            <th>Expected Pickup</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2305</td>
                            <td>John Doe</td>
                            <td>May 09, 2025</td>
                            <td>5</td>
                            <td>Wash & Fold</td>
                            <td>May 11, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2305'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2305'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2307</td>
                            <td>Alice Smith</td>
                            <td>May 09, 2025</td>
                            <td>3</td>
                            <td>Dry Cleaning</td>
                            <td>May 12, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2307'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2307'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2308</td>
                            <td>Robert Johnson</td>
                            <td>May 09, 2025</td>
                            <td>7</td>
                            <td>Wash & Fold</td>
                            <td>May 12, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2308'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2308'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2309</td>
                            <td>Emma Wilson</td>
                            <td>May 08, 2025</td>
                            <td>2</td>
                            <td>Ironing Only</td>
                            <td>May 10, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2309'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2309'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2310</td>
                            <td>Michael Brown</td>
                            <td>May 08, 2025</td>
                            <td>4</td>
                            <td>Wash & Fold</td>
                            <td>May 11, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2310'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2310'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2311</td>
                            <td>Olivia Garcia</td>
                            <td>May 08, 2025</td>
                            <td>9</td>
                            <td>Dry Cleaning</td>
                            <td>May 12, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2311'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2311'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2312</td>
                            <td>William Davis</td>
                            <td>May 07, 2025</td>
                            <td>3</td>
                            <td>Wash & Fold</td>
                            <td>May 10, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2312'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2312'">Update</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" class="order-checkbox">
                            </td>
                            <td>#LD2313</td>
                            <td>Sophie Miller</td>
                            <td>May 07, 2025</td>
                            <td>5</td>
                            <td>Ironing Only</td>
                            <td>May 09, 2025</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-view" onclick="window.location.href='view_order.jsp?id=LD2313'">View</button>
                                    <button class="btn btn-update" onclick="window.location.href='update_status.jsp?id=LD2313'">Update</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="pagination">
                <div class="pagination-info">
                    Showing 1 to 8 of 18 entries
                </div>
                <div class="pagination-buttons">
                    <button disabled><i class="fas fa-chevron-left"></i></button>
                    <button class="active">1</button>
                    <button>2</button>
                    <button>3</button>
                    <button><i class="fas fa-chevron-right"></i></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bulk Update Modal (Hidden by Default) -->
    <div id="bulkUpdateModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 1000; justify-content: center; align-items: center;">
        <div style="background-color: white; border-radius: 8px; padding: 30px; width: 80%; max-width: 500px;">
            <h2 style="margin-bottom: 20px;">Bulk Update Orders</h2>
            <p>You are about to update the status for <span id="selectedCount">0</span> orders.</p>
            
            <div style="margin: 20px 0;">
                <label for="bulkStatus" style="display: block; margin-bottom: 10px;">New Status:</label>
                <select id="bulkStatus" style="width: 100%; padding: 10px; border: 1px solid #e0e0e0; border-radius: 6px;">
                    <option value="processing">Processing</option>
                    <option value="completed">Completed</option>
                    <option value="cancelled">Cancelled</option>
                </select>
            </div>
            
            <div style="margin: 20px 0;">
                <label for="bulkNotes" style="display: block; margin-bottom: 10px;">Notes:</label>
                <textarea id="bulkNotes" style="width: 100%; padding: 10px; border: 1px solid #e0e0e0; border-radius: 6px; height: 100px;" placeholder="Enter any notes about this bulk update..."></textarea>
            </div>
            
            <div style="margin: 20px 0;">
                <label style="display: flex; align-items: center;">
                    <input type="checkbox" checked style="margin-right: 10px;">
                    Send notifications to customers
                </label>
            </div>
            
            <div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 20px;">
                <button onclick="closeBulkModal()" style="padding: 10px 15px; border: none; border-radius: 6px; background-color: #ecf0f1; color: #2c3e50; cursor: pointer;">Cancel</button>
                <button style="padding: 10px 15px; border: none; border-radius: 6px; background-color: #3498db; color: white; cursor: pointer;">Update All</button>
            </div>
        </div>
    </div>

    <script>
        // Handle select all checkbox
        document.getElementById('selectAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.order-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
            updateBulkButton();
        });
        
        // Handle individual checkboxes
        document.querySelectorAll('.order-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', updateBulkButton);
        });
        
        // Update bulk button state
        function updateBulkButton() {
            const checkboxes = document.querySelectorAll('tbody .order-checkbox');
            const selectedCount = Array.from(checkboxes).filter(checkbox => checkbox.checked).length;
            
            const bulkBtn = document.getElementById('bulkUpdateBtn');
            bulkBtn.disabled = selectedCount ===