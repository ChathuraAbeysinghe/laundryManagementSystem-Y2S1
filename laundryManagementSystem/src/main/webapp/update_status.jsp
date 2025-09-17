<%@ page session="true" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !"staff".equals(role)) {
    response.sendRedirect("login.jsp");
    return;
}

String orderId = request.getParameter("id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Order Status</title>
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
            transition: width 0.3s ease;
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
            transition: all 0.3s ease;
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
            padding: 30px;
            transition: margin-left 0.3s ease;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .breadcrumb {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
            color: #7f8c8d;
        }
        
        .breadcrumb a {
            color: #3498db;
            text-decoration: none;
            transition: color 0.2s;
        }
        
        .breadcrumb a:hover {
            color: #2980b9;
        }
        
        .breadcrumb span {
            margin: 0 10px;
        }
        
        .order-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .order-card h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .order-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 25px;
        }
        
        .detail-group {
            margin-bottom: 15px;
        }
        
        .detail-label {
            font-size: 0.85rem;
            color: #7f8c8d;
            margin-bottom: 5px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .detail-value {
            font-weight: 500;
            color: #2c3e50;
            font-size: 1rem;
        }
        
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }
        
        .items-table th, .items-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .items-table th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: #2c3e50;
        }
        
        .items-table tr:hover td {
            background-color: #f5f7fa;
        }
        
        .status-section {
            margin-top: 40px;
            border-top: 1px solid #e0e0e0;
            padding-top: 30px;
        }
        
        .status-section h3 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .status-section p {
            color: #7f8c8d;
            margin-bottom: 20px;
        }
        
        .status-options {
            display: flex;
            gap: 20px;
            margin-top: 25px;
            flex-wrap: wrap;
        }
        
        .status-option {
            flex: 1;
            min-width: 200px;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid #e0e0e0;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            background-color: white;
        }
        
        .status-option:hover {
            border-color: #3498db;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.1);
        }
        
        .status-option.selected {
            border-color: #3498db;
            background-color: #edf7fd;
        }
        
        .status-option.selected::after {
            content: "✓";
            position: absolute;
            top: 10px;
            right: 10px;
            width: 20px;
            height: 20px;
            background-color: #3498db;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
        }
        
        .status-icon {
            font-size: 2.2rem;
            margin-bottom: 15px;
        }
        
        .status-option:nth-child(1) .status-icon {
            color: #ff9800;
        }
        
        .status-option:nth-child(2) .status-icon {
            color: #2196f3;
        }
        
        .status-option:nth-child(3) .status-icon {
            color: #4caf50;
        }
        
        .status-option:nth-child(4) .status-icon {
            color: #f44336;
        }
        
        .status-option h4 {
            color: #2c3e50;
            margin-bottom: 8px;
            font-size: 1.1rem;
        }
        
        .status-option p {
            color: #7f8c8d;
            font-size: 0.9rem;
            line-height: 1.4;
        }
        
        .notes-section {
            margin-top: 35px;
        }
        
        .notes-section h3 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .notes-section p {
            color: #7f8c8d;
            margin-bottom: 15px;
        }
        
        .notes-input {
            width: 100%;
            padding: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            resize: vertical;
            height: 120px;
            margin-top: 10px;
            transition: all 0.3s ease;
            font-family: inherit;
            font-size: 0.95rem;
        }
        
        .notes-input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }
        
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 35px;
        }
        
        .btn {
            padding: 12px 28px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }
        
        .btn-primary {
            background-color: #3498db;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(41, 128, 185, 0.2);
        }
        
        .btn-secondary {
            background-color: #ecf0f1;
            color: #2c3e50;
        }
        
        .btn-secondary:hover {
            background-color: #dfe4ea;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* Status badges */
        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-pending {
            background-color: #fff8e1;
            color: #ff9800;
        }
        
        .status-processing {
            background-color: #e3f2fd;
            color: #2196f3;
        }
        
        .status-completed {
            background-color: #e8f5e9;
            color: #4caf50;
        }
        
        .status-cancelled {
            background-color: #feecef;
            color: #f44336;
        }
        
        /* Checkbox styling */
        input[type="checkbox"] {
            accent-color: #3498db;
            width: 18px;
            height: 18px;
            margin-right: 10px;
        }
        
        /* Responsive adjustments */
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
                padding: 18px 15px;
            }
            
            .menu-item i {
                margin-right: 0;
                font-size: 1.3rem;
            }
            
            .main-content {
                margin-left: 70px;
                padding: 20px;
            }
        }
        
        @media (max-width: 768px) {
            .order-details {
                grid-template-columns: 1fr;
            }
            
            .status-options {
                flex-direction: column;
            }
            
            .status-option {
                min-width: 100%;
                margin-bottom: 15px;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .breadcrumb {
                flex-wrap: wrap;
                row-gap: 5px;
            }
            
            .action-buttons {
                justify-content: center;
                flex-wrap: wrap;
            }
            
            .btn {
                width: 100%;
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
                <a href="pending_orders.jsp" class="menu-item">
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
                <h1>Update Order Status</h1>
                <div class="breadcrumb">
                    <a href="staff_dashboard.jsp">Dashboard</a>
                    <span>/</span>
                    <a href="all_orders.jsp">Orders</a>
                    <span>/</span>
                    Order #<%= orderId %>
                </div>
            </div>
            
            <div class="order-card">
                <h2>Order #<%= orderId %></h2>
                
                <div class="order-details">
                    <div>
                        <div class="detail-group">
                            <div class="detail-label">Customer</div>
                            <div class="detail-value">John Doe</div>
                        </div>
                        <div class="detail-group">
                            <div class="detail-label">Contact</div>
                            <div class="detail-value">johndoe@example.com</div>
                        </div>
                        <div class="detail-group">
                            <div class="detail-label">Phone</div>
                            <div class="detail-value">(555) 123-4567</div>
                        </div>
                    </div>
                    <div>
                        <div class="detail-group">
                            <div class="detail-label">Order Date</div>
                            <div class="detail-value">May 09, 2025</div>
                        </div>
                        <div class="detail-group">
                            <div class="detail-label">Expected Pickup</div>
                            <div class="detail-value">May 11, 2025</div>
                        </div>
                        <div class="detail-group">
                            <div class="detail-label">Current Status</div>
                            <div class="detail-value">
                                <span class="status status-pending">Pending</span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="detail-group">
                            <div class="detail-label">Total Items</div>
                            <div class="detail-value">5</div>
                        </div>
                        <div class="detail-group">
                            <div class="detail-label">Service Type</div>
                            <div class="detail-value">Wash & Fold</div>
                        </div>
                        <div class="detail-group">
                            <div class="detail-label">Special Instructions</div>
                            <div class="detail-value">Use gentle detergent for all items</div>
                        </div>
                    </div>
                </div>
                
                <table class="items-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Item Type</th>
                            <th>Quantity</th>
                            <th>Service</th>
                            <th>Notes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>T-shirts</td>
                            <td>2</td>
                            <td>Wash & Fold</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Jeans</td>
                            <td>1</td>
                            <td>Wash & Fold</td>
                            <td>Treat stain on right knee</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Bed Sheets</td>
                            <td>1 set</td>
                            <td>Wash & Fold</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Towels</td>
                            <td>2</td>
                            <td>Wash & Fold</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="status-section">
                    <h3>Update Status</h3>
                    <p>Please select the new status for this order.</p>
                    
                    <form action="process_status_update.jsp" method="post">
                        <input type="hidden" name="orderId" value="<%= orderId %>">
                        
                        <div class="status-options">
                            <div class="status-option selected" onclick="selectStatus(this, 'pending')">
                                <div class="status-icon">
                                    <i class="fas fa-hourglass-half"></i>
                                </div>
                                <h4>Pending</h4>
                                <p>Order received, awaiting processing</p>
                                <input type="radio" name="status" value="pending" checked style="display:none;">
                            </div>
                            
                            <div class="status-option" onclick="selectStatus(this, 'processing')">
                                <div class="status-icon">
                                    <i class="fas fa-spinner"></i>
                                </div>
                                <h4>Processing</h4>
                                <p>Order is being processed</p>
                                <input type="radio" name="status" value="processing" style="display:none;">
                            </div>
                            
                            <div class="status-option" onclick="selectStatus(this, 'completed')">
                                <div class="status-icon">
                                    <i class="fas fa-check-circle"></i>
                                </div>
                                <h4>Completed</h4>
                                <p>Order is ready for pickup</p>
                                <input type="radio" name="status" value="completed" style="display:none;">
                            </div>
                            
                            <div class="status-option" onclick="selectStatus(this, 'cancelled')">
                                <div class="status-icon">
                                    <i class="fas fa-times-circle"></i>
                                </div>
                                <h4>Cancelled</h4>
                                <p>Order has been cancelled</p>
                                <input type="radio" name="status" value="cancelled" style="display:none;">
                            </div>
                        </div>
                        
                        <div class="notes-section">
                            <h3>Staff Notes</h3>
                            <p>Add any notes or comments about this order status update.</p>
                            <textarea class="notes-input" name="notes" placeholder="Enter any notes about this status update..."></textarea>
                        </div>
                        
                        <div style="margin-top: 25px;">
                            <label style="display: flex; align-items: center; color: #2c3e50; cursor: pointer;">
                                <input type="checkbox" name="sendNotification" checked style="margin-right: 10px;">
                                Send notification to customer about this status update
                            </label>
                        </div>
                        
                        <div class="action-buttons">
                            <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancel</button>
                            <button type="submit" class="btn btn-primary">Update Status</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Function to handle status selection
        function selectStatus(element, status) {
            // Remove selected class from all options
            const options = document.querySelectorAll('.status-option');
            options.forEach(option => {
                option.classList.remove('selected');
                option.querySelector('input[type="radio"]').checked = false;
            });
            
            // Add selected class to clicked option
            element.classList.add('selected');
            element.querySelector('input[type="radio"]').checked = true;
            
            // Add subtle animation
            element.style.transform = 'scale(0.98)';
            setTimeout(() => {
                element.style.transform = '';
            }, 200);
        }
        
        // Highlight current page in sidebar
        document.addEventListener('DOMContentLoaded', function() {
            const currentLocation = location.pathname.split('/').slice(-1)[0];
            const menuItems = document.querySelectorAll('.menu-item');
            
            menuItems.forEach(item => {
                const href = item.getAttribute('href');
                if (href === currentLocation) {
                    item.classList.add('active');
                }
            });
            
            // Add animation to order card on load
            const orderCard = document.querySelector('.order-card');
            orderCard.style.animation = 'fadeIn 0.5s ease';
        });
    </script>
</body>
</html>