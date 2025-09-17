<%@ page session="true" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !"admin".equals(role)) {
    response.sendRedirect("loginPage.jsp");
}

// For demo purposes - in a real application, these would come from database
String adminName = (String) session.getAttribute("username") != null ? 
                  (String) session.getAttribute("username") : "Admin User";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wash Mart - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #00897b;
            --primary-light: #4ebaaa;
            --primary-dark: #005b4f;
            --secondary-color: #26c6da;
            --text-color: #263238;
            --text-light: #78909c;
            --bg-light: #f5f7fa;
            --white: #ffffff;
            --danger: #f44336;
            --warning: #ff9800;
            --success: #4caf50;
            --info: #2196f3;
            --border-radius: 10px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background-color: var(--white);
            box-shadow: var(--box-shadow);
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            transition: var(--transition);
            z-index: 10;
            height: 100vh;
            position: fixed;
        }

        .sidebar-header {
            padding: 0 25px 20px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
        }

        .logo-icon {
            font-size: 28px;
            color: var(--primary-color);
            margin-right: 10px;
        }

        .logo-text {
            font-weight: 700;
            font-size: 22px;
            color: var(--primary-dark);
        }

        .logo-text span {
            font-weight: 400;
            color: var(--secondary-color);
        }

        .sidebar-menu {
            padding: 20px 0;
            flex-grow: 1;
            overflow-y: auto;
        }

        .menu-section {
            margin-bottom: 15px;
            padding: 0 15px;
        }

        .menu-section-title {
            color: var(--text-light);
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 10px 10px 5px;
        }

        .menu-items {
            list-style: none;
        }

        .menu-item {
            margin-bottom: 5px;
        }

        .menu-link {
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 8px;
            color: var(--text-color);
            text-decoration: none;
            transition: var(--transition);
        }

        .menu-link:hover, .menu-link.active {
            background-color: rgba(0, 137, 123, 0.1);
            color: var(--primary-color);
        }

        .menu-link.active {
            font-weight: 600;
        }

        .menu-icon {
            width: 20px;
            text-align: center;
            margin-right: 10px;
            font-size: 16px;
        }

        .sidebar-footer {
            padding: 15px 25px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-profile {
            display: flex;
            align-items: center;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-light);
            color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: 500;
            margin-right: 10px;
        }

        .admin-info {
            line-height: 1.2;
        }

        .admin-name {
            font-weight: 600;
            font-size: 14px;
        }

        .admin-role {
            font-size: 12px;
            color: var(--text-light);
        }

        .logout-btn {
            width: 36px;
            height: 36px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-light);
            cursor: pointer;
            transition: var(--transition);
        }

        .logout-btn:hover {
            background-color: rgba(244, 67, 54, 0.1);
            color: var(--danger);
        }

        /* Main Content */
        .main-content {
            flex-grow: 1;
            margin-left: 280px;
            padding: 25px;
            transition: var(--transition);
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .menu-toggle {
            display: none;
            font-size: 24px;
            color: var(--text-color);
            cursor: pointer;
        }

        .page-title {
            font-size: 24px;
            font-weight: 600;
            color: var(--text-color);
        }

        .header-actions {
            display: flex;
            align-items: center;
        }

        .action-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-light);
            background-color: var(--white);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-left: 15px;
            cursor: pointer;
            transition: var(--transition);
        }

        .action-btn:hover {
            background-color: var(--primary-color);
            color: var(--white);
        }

        /* Dashboard Content */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
            margin-bottom: 25px;
        }

        .stat-card {
            background-color: var(--white);
            border-radius: var(--border-radius);
            padding: 25px;
            box-shadow: var(--box-shadow);
            display: flex;
            align-items: center;
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-right: 20px;
        }

        .stat-icon.orders {
            background-color: rgba(33, 150, 243, 0.1);
            color: var(--info);
        }

        .stat-icon.revenue {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--success);
        }

        .stat-icon.customers {
            background-color: rgba(255, 152, 0, 0.1);
            color: var(--warning);
        }

        .stat-icon.staff {
            background-color: rgba(156, 39, 176, 0.1);
            color: #9c27b0;
        }

        .stat-data {
            flex-grow: 1;
        }

        .stat-value {
            font-size: 28px;
            font-weight: 700;
            line-height: 1.2;
        }

        .stat-label {
            color: var(--text-light);
            font-size: 14px;
        }

        .stat-change {
            font-size: 13px;
            display: flex;
            align-items: center;
            margin-top: 5px;
        }

        .change-positive {
            color: var(--success);
        }

        .change-negative {
            color: var(--danger);
        }

        /* Dashboard Charts */
        .charts-row {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
            margin-bottom: 25px;
        }

        .chart-card {
            background-color: var(--white);
            border-radius: var(--border-radius);
            padding: 25px;
            box-shadow: var(--box-shadow);
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .chart-title {
            font-size: 18px;
            font-weight: 600;
        }

        .chart-tabs {
            display: flex;
            align-items: center;
        }

        .chart-tab {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            cursor: pointer;
            transition: var(--transition);
        }

        .chart-tab.active {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .chart-container {
            height: 260px;
            position: relative;
        }

        /* Orders Table */
        .recent-orders {
            background-color: var(--white);
            border-radius: var(--border-radius);
            padding: 25px;
            box-shadow: var(--box-shadow);
            margin-bottom: 25px;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table-title {
            font-size: 18px;
            font-weight: 600;
        }

        .view-all {
            color: var(--primary-color);
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .view-all i {
            margin-left: 5px;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
        }

        .orders-table th,
        .orders-table td {
            padding: 12px 15px;
            text-align: left;
        }

        .orders-table th {
            font-weight: 600;
            color: var(--text-light);
            font-size: 14px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .orders-table tbody tr {
            border-bottom: 1px solid rgba(0, 0, 0, 0.03);
            transition: var(--transition);
        }

        .orders-table tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.01);
        }

        .orders-table tbody tr:last-child {
            border-bottom: none;
        }

        .customer-info {
            display: flex;
            align-items: center;
        }

        .customer-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: var(--primary-light);
            color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            margin-right: 10px;
        }

        .customer-name {
            font-weight: 500;
        }

        .order-id {
            font-weight: 600;
            color: var(--primary-dark);
        }

        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-processing {
            background-color: rgba(33, 150, 243, 0.1);
            color: var(--info);
        }

        .status-delivered {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--success);
        }

        .status-pending {
            background-color: rgba(255, 152, 0, 0.1);
            color: var(--warning);
        }

        .status-cancelled {
            background-color: rgba(244, 67, 54, 0.1);
            color: var(--danger);
        }

        .action-dots {
            font-size: 18px;
            cursor: pointer;
            color: var(--text-light);
            transition: var(--transition);
        }

        .action-dots:hover {
            color: var(--primary-color);
        }

        /* Modal Window */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 100;
            justify-content: center;
            align-items: center;
        }
        
        .modal.active {
            display: flex;
        }

        .modal-content {
            background: var(--white);
            border-radius: var(--border-radius);
            width: 95%;
            max-width: 600px;
            padding: 30px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.15);
            position: relative;
            transform: scale(0.9);
            opacity: 0;
            transition: all 0.3s ease;
        }
        
        .modal.active .modal-content {
            transform: scale(1);
            opacity: 1;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
        }

        .close-modal {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            color: var(--text-light);
            transition: var(--transition);
        }

        .close-modal:hover {
            color: var(--danger);
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-280px);
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .menu-toggle {
                display: block;
            }

            .charts-row {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .orders-table {
                min-width: 600px;
            }
            
            .table-responsive {
                overflow-x: auto;
            }
        }

        /* Chart placeholders */
        .chart-placeholder {
            width: 100%;
            height: 260px;
            background: linear-gradient(45deg, #f2f8f9 25%, #e6f2f5 25%, #e6f2f5 50%, #f2f8f9 50%, #f2f8f9 75%, #e6f2f5 75%, #e6f2f5 100%);
            background-size: 20px 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
        }

        .chart-placeholder-text {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
            color: var(--text-light);
        }

        /* Notification Badge */
        .notification-badge {
            position: relative;
        }

        .badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--danger);
            color: white;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            font-weight: 700;
            border: 2px solid white;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="logo-icon">
                <i class="fas fa-tshirt"></i>
            </div>
            <div class="logo-text">Wash<span>Mart</span></div>
        </div>
        
        <div class="sidebar-menu">
            <div class="menu-section">
                <div class="menu-section-title">Main</div>
                <ul class="menu-items">
                    <li class="menu-item">
                        <a href="#" class="menu-link active">
                            <span class="menu-icon"><i class="fas fa-th-large"></i></span>
                            Dashboard
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-shopping-bag"></i></span>
                            Orders
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-users"></i></span>
                            Customers
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-id-card"></i></span>
                            Staff
                        </a>
                    </li>
                </ul>
            </div>
            
            <div class="menu-section">
                <div class="menu-section-title">Management</div>
                <ul class="menu-items">
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-list-alt"></i></span>
                            Services
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-truck"></i></span>
                            Delivery
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-percentage"></i></span>
                            Promotions
                        </a>
                    </li>
                </ul>
            </div>
            
            <div class="menu-section">
                <div class="menu-section-title">Settings</div>
                <ul class="menu-items">
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-user-circle"></i></span>
                            Profile
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-cog"></i></span>
                            Settings
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <span class="menu-icon"><i class="fas fa-question-circle"></i></span>
                            Help
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="sidebar-footer">
            <div class="admin-profile">
                <div class="admin-avatar">
                    <%= adminName.substring(0, 1).toUpperCase() %>
                </div>
                <div class="admin-info">
                    <div class="admin-name"><%= adminName %></div>
                    <div class="admin-role">Administrator</div>
                </div>
            </div>
            <div class="logout-btn" onclick="confirmLogout()">
                <i class="fas fa-sign-out-alt"></i>
            </div>
        </div>
    </aside>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="main-header">
            <div class="header-left">
                <div class="menu-toggle" id="sidebarToggle">
                    <i class="fas fa-bars"></i>
                </div>
                <h1 class="page-title">Dashboard</h1>
            </div>
            <div class="header-actions">
                <div class="action-btn notification-badge">
                    <i class="fas fa-bell"></i>
                    <span class="badge">3</span>
                </div>
                <div class="action-btn">
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="action-btn">
                    <i class="fas fa-search"></i>
                </div>
            </div>
        </div>
         </div>
        
        <!-- Stats Cards -->
        <div class="dashboard-grid">
            <div class="stat-card">
                <div class="stat-icon orders">
                    <i class="fas fa-shopping-basket"></i>
                </div>
                <div class="stat-data">
                    <div class="stat-value">246</div>
                    <div class="stat-label">Total Orders</div>
                    <div class="stat-change change-positive">
                        <i class="fas fa-arrow-up"></i> 12.5% from last week
                    </div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon revenue">
                    <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="stat-data">
                    <div class="stat-value">$8,549</div>
                    <div class="stat-label">Total Revenue</div>
                    <div class="stat-change change-positive">
                        <i class="fas fa-arrow-up"></i> 8.2% from last week
                    </div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon customers">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-data">
                    <div class="stat-value">128</div>
                    <div class="stat-label">New Customers</div>
                    <div class="stat-change change-positive">
                        <i class="fas fa-arrow-up"></i> 5.3% from last week
                    </div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon staff">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="stat-data">
                    <div class="stat-value">24</div>
                    <div class="stat-label">Staff Members</div>
                    <div class="stat-change change-negative">
                        <i class="fas fa-arrow-down"></i> 2.1% from last week
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Charts Row -->
        <div class="charts-row">
            <div class="chart-card">
                <div class="chart-header">
                    <div class="chart-title">Revenue Overview</div>
                    <div class="chart-tabs">
                        <div class="chart-tab active">Weekly</div>
                        <div class="chart-tab">Monthly</div>
                        <div class="chart-tab">Yearly</div>
                    </div>
                </div>
                <div class="chart-container">
                    <div class="chart-placeholder">
                        <div class="chart-placeholder-text">Revenue Chart Here</div>
                    </div>
                </div>
            </div>
            
            <div class="chart-card">
                <div class="chart-header">
                    <div class="chart-title">Service Distribution</div>
                </div>
                <div class="chart-container">
                    <div class="chart-placeholder">
                        <div class="chart-placeholder-text">Pie Chart Here</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Recent Orders -->
        <div class="recent-orders">
            <div class="table-header">
                <div class="table-title">Recent Orders</div>
                <a href="#" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
            </div>
            
            <div class="table-responsive">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Service</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="order-id">#WM-5289</td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-avatar">JD</div>
                                    <div class="customer-name">John Doe</div>
                                </div>
                            </td>
                            <td>Dry Cleaning</td>
                            <td>$45.80</td>
                            <td>May 8, 2025</td>
                            <td><span class="status-badge status-processing">Processing</span></td>
                            <td><i class="fas fa-ellipsis-v action-dots"></i></td>
                        </tr>
                        <tr>
                            <td class="order-id">#WM-5288</td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-avatar">MS</div>
                                    <div class="customer-name">Maria Smith</div>
                                </div>
                            </td>
                            <td>Full Service</td>
                            <td>$72.50</td>
                            <td>May 8, 2025</td>
                            <td><span class="status-badge status-delivered">Delivered</span></td>
                            <td><i class="fas fa-ellipsis-v action-dots"></i></td>
                        </tr>
                        <tr>
                            <td class="order-id">#WM-5287</td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-avatar">RJ</div>
                                    <div class="customer-name">Robert Johnson</div>
                                </div>
                            </td>
                            <td>Wash & Fold</td>
                            <td>$32.00</td>
                            <td>May 7, 2025</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td><i class="fas fa-ellipsis-v action-dots"></i></td>
                        </tr>
                        <tr>
                            <td class="order-id">#WM-5286</td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-avatar">LW</div>
                                    <div class="customer-name">Lisa Wong</div>
                                </div>
                            </td>
                            <td>Premium Wash</td>
                            <td>$65.20</td>
                            <td>May 7, 2025</td>
                            <td><span class="status-badge status-delivered">Delivered</span></td>
                            <td><i class="fas fa-ellipsis-v action-dots"></i></td>
                        </tr>
                        <tr>
                            <td class="order-id">#WM-5285</td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-avatar">MJ</div>
                                    <div class="customer-name">Michael James</div>
                                </div>
                            </td>
                        </tr>    