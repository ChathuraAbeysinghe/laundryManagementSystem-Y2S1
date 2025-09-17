<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wash Mart - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #e0f7fa 0%, #80deea 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            overflow-x: hidden;
        }
        
        .login-wrapper {
            display: flex;
            width: 100%;
            max-width: 1000px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        
        .login-image {
            flex: 1;
            background-image: url('assets/login-img.jpg');
            background-size: cover;
            background-position: center;
            min-height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            position: relative;
        }
        
        .login-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 105, 92, 0.7);
        }
        
        .login-image-content {
            position: relative;
            z-index: 1;
            padding: 30px;
            text-align: center;
        }
        
        .login-image h2 {
            font-size: 28px;
            margin-bottom: 15px;
            color: white;
        }
        
        .login-image p {
            font-size: 16px;
            margin-bottom: 30px;
            color: rgba(255,255,255,0.9);
        }
        
        .login-features {
            text-align: left;
            margin-top: 30px;
        }
        
        .login-feature {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            color: white;
        }
        
        .login-feature i {
            margin-right: 10px;
            font-size: 20px;
            color: #80deea;
        }
        
        .login-container {
            flex: 1;
            padding: 40px;
            max-width: 500px;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 15px;
        }
        
        .logo i {
            font-size: 40px;
            color: #00acc1;
            margin-bottom: 10px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 25px;
        }
        
        .login-header h2 {
            color: #00796b;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .login-header p {
            color: #00897b;
            font-size: 14px;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #00695c;
            font-weight: 500;
            font-size: 14px;
        }
        
        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 6px;
            border: 1px solid #b2dfdb;
            outline: none;
            transition: border 0.3s;
            font-size: 15px;
        }
        
        .form-group input:focus, 
        .form-group select:focus {
            border-color: #00897b;
            box-shadow: 0 0 0 2px rgba(0, 137, 123, 0.2);
        }
        
        .password-container {
            position: relative;
        }
        
        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #00897b;
        }
        
        .form-group select {
            background-color: white;
        }
        
        .btn-login {
            width: 100%;
            background-color: #00897b;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 14px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        
        .btn-login:hover {
            background-color: #00695c;
        }
        
        .register-link {
            text-align: center;
            margin-top: 20px;
            color: #00695c;
            font-size: 14px;
        }
        
        .register-link a {
            color: #00897b;
            text-decoration: none;
            font-weight: 500;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            color: #c62828;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }

        /* Success Popup Styles */
        .success-popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }
        
        .success-popup.active {
            opacity: 1;
            visibility: visible;
        }
        
        .popup-content {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            transform: translateY(20px);
            transition: all 0.3s ease;
        }
        
        .success-popup.active .popup-content {
            transform: translateY(0);
        }
        
        .popup-icon {
            font-size: 50px;
            color: #4CAF50;
            margin-bottom: 15px;
        }
        
        .popup-title {
            font-size: 22px;
            color: #00796b;
            margin-bottom: 10px;
        }
        
        .popup-message {
            color: #555;
            margin-bottom: 20px;
        }
        
        .popup-button {
            background-color: #00897b;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .popup-button:hover {
            background-color: #00695c;
        }
        
        @media (max-width: 768px) {
            .login-wrapper {
                flex-direction: column;
            }
            
            .login-image {
                display: none;
            }
            
            .login-container {
                padding: 30px;
            }
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <!-- Left side image with overlay content -->
        <div class="login-image">
            <div class="login-image-content">
                <h2>Welcome to Wash Mart</h2>
                <p>Your trusted laundry service provider</p>
                
                <div class="login-features">
                    <div class="login-feature">
                        <i class="fas fa-bolt"></i>
                        <span>Fast and reliable service</span>
                    </div>
                    <div class="login-feature">
                        <i class="fas fa-star"></i>
                        <span>Premium quality cleaning</span>
                    </div>
                    <div class="login-feature">
                        <i class="fas fa-truck"></i>
                        <span>Free pickup and delivery</span>
                    </div>
                    <div class="login-feature">
                        <i class="fas fa-shield-alt"></i>
                        <span>100% satisfaction guarantee</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main login form container -->
        <div class="login-container">
            <div class="logo">
                <i class="fas fa-tshirt"></i>
            </div>
            <div class="login-header">
                <h2>Wash Mart</h2>
                <p>Please login to manage laundry operations</p>
            </div>
            
            <% if (request.getParameter("error") != null) { %>
                <div style="color: #c62828; background-color: #ffebee; padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center;">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error") %>
                </div>
            <% } %>
            
            <form id="loginForm" action="Login" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    <div class="error-message" id="username-error"></div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="password-container">
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                        <i class="toggle-password fas fa-eye" onclick="togglePassword()"></i>
                    </div>
                    <div class="error-message" id="password-error"></div>
                </div>
                
                <div class="form-group">
                    <label for="role">Select Role</label>
                    <select name="role" id="role" required>
                        <option value="" disabled selected>Select your role</option>
                        <option value="admin">Admin</option>
                        <option value="staff">Laundry Staff</option>
                        <option value="delivery">Delivery Person</option>
                        <option value="user">Customer</option>
                    </select>
                    <div class="error-message" id="role-error"></div>
                </div>
                
                <button type="submit" class="btn-login">
                    <span id="login-text">Login</span>
                    <span id="login-spinner" style="display:none;">
                        <i class="fas fa-spinner fa-spin"></i> Processing...
                    </span>
                </button>
                
                <div class="register-link">
                    Don't have an account? <a href="register.jsp">Register here</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Success Popup -->
    <div class="success-popup" id="successPopup">
        <div class="popup-content">
            <div class="popup-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h3 class="popup-title">Login Successful!</h3>
            <p class="popup-message" id="successMessage">Welcome back to Wash Mart! Redirecting to your dashboard...</p>
            <button class="popup-button" onclick="redirectToDashboard()">Continue to Dashboard</button>
        </div>
    </div>

    <script>
        function togglePassword() {
            const password = document.getElementById('password');
            const icon = document.querySelector('.toggle-password');
            if (password.type === 'password') {
                password.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                password.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }

        document.getElementById('loginForm').addEventListener('submit', function(e) {
            // Show loading spinner
            document.getElementById('login-text').style.display = 'none';
            document.getElementById('login-spinner').style.display = 'inline';
            
            // Simple validation
            let isValid = true;
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const role = document.getElementById('role').value;
            
            // Reset error messages
            document.querySelectorAll('.error-message').forEach(el => el.style.display = 'none');
            
            if (!username) {
                document.getElementById('username-error').textContent = 'Username is required';
                document.getElementById('username-error').style.display = 'block';
                isValid = false;
            }
            
            if (!password) {
                document.getElementById('password-error').textContent = 'Password is required';
                document.getElementById('password-error').style.display = 'block';
                isValid = false;
            }
            
            if (!role) {
                document.getElementById('role-error').textContent = 'Please select a role';
                document.getElementById('role-error').style.display = 'block';
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                document.getElementById('login-text').style.display = 'inline';
                document.getElementById('login-spinner').style.display = 'none';
            }
        });

        // Check if login was successful from URL parameter
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('success')) {
                showSuccessPopup(urlParams.get('success'));
            }
        };

        function showSuccessPopup(message) {
            const popup = document.getElementById('successPopup');
            if (message) {
                document.getElementById('successMessage').textContent = message;
            }
            popup.classList.add('active');
            
            // Auto-redirect based on role after 3 seconds
            setTimeout(redirectToDashboard, 3);
        }

        function redirectToDashboard() {
            const role = document.getElementById('role').value;
            let dashboardUrl = 'dashboard.jsp'; // Default dashboard
            
            // Redirect to different dashboards based on role - using consistent naming
            switch(role) {
                case 'admin':
                    dashboardUrl = 'admin-dashboard.jsp';
                    break;
                case 'staff':
                    dashboardUrl = 'staffDashboard'; // This is a servlet, not a JSP
                    break;
                case 'delivery':
                    dashboardUrl = 'delivery-dashboard.jsp';
                    break;
                case 'customer':
                    dashboardUrl = 'customer-dashboard.jsp';
                    break;
            }
            
            window.location.href = dashboardUrl;
        }
    </script>
</body>
</html>