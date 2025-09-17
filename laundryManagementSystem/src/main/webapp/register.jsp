<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Washmart Laundry</title>
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
        
        .register-wrapper {
            display: flex;
            width: 100%;
            max-width: 1000px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        
        .register-image {
            flex: 1;
            background-image: url('assets/register-img.jpg');
            background-size: cover;
            background-position: center;
            min-height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            position: relative;
        }
        
        .register-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 105, 92, 0.7);
        }
        
        .register-image-content {
            position: relative;
            z-index: 1;
            padding: 30px;
            text-align: center;
        }
        
        .register-image h2 {
            font-size: 28px;
            margin-bottom: 15px;
            color: white;
        }
        
        .register-image p {
            font-size: 16px;
            margin-bottom: 30px;
            color: rgba(255,255,255,0.9);
        }
        
        .register-features {
            text-align: left;
            margin-top: 30px;
        }
        
        .register-feature {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            color: white;
        }
        
        .register-feature i {
            margin-right: 10px;
            font-size: 20px;
            color: #80deea;
        }
        
        .register-container {
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
        
        .register-header {
            text-align: center;
            margin-bottom: 25px;
        }
        
        .register-header h2 {
            color: #00796b;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .register-header p {
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
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border-radius: 6px;
            border: 1px solid #b2dfdb;
            outline: none;
            transition: border 0.3s;
            font-size: 15px;
        }
        
        .form-group input:focus {
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
        
        .btn-register {
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
        
        .btn-register:hover {
            background-color: #00695c;
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #00695c;
            font-size: 14px;
        }
        
        .login-link a {
            color: #00897b;
            text-decoration: none;
            font-weight: 500;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            color: #c62828;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }
        
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
            .register-wrapper {
                flex-direction: column;
            }
            
            .register-image {
                display: none;
            }
            
            .register-container {
                padding: 30px;
            }
        }
        
        @media (max-width: 480px) {
            .register-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="register-wrapper">
        <!-- Left side image with overlay content -->
        <div class="register-image">
            <div class="register-image-content">
                <h2>Join Wash Mart Today</h2>
                <p>Experience premium laundry services</p>
                
                <div class="register-features">
                    <div class="register-feature">
                        <i class="fas fa-clock"></i>
                        <span>24/7 service availability</span>
                    </div>
                    <div class="register-feature">
                        <i class="fas fa-medal"></i>
                        <span>Professional cleaning</span>
                    </div>
                    <div class="register-feature">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Convenient locations</span>
                    </div>
                    <div class="register-feature">
                        <i class="fas fa-lock"></i>
                        <span>Secure account protection</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main register form container -->
        <div class="register-container">
            <div class="logo">
                <i class="fas fa-tshirt"></i>
            </div>
            <div class="register-header">
                <h2>Create Your Account</h2>
                <p>Join our laundry service today</p>
            </div>
            
            <% if (request.getParameter("error") != null) { %>
                <div style="color: #c62828; background-color: #ffebee; padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center;">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error") %>
                </div>
            <% } %>
            
            <form id="registerForm" method="post" action="Register">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    <div class="error-message" id="username-error"></div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="password-container">
                        <input type="password" id="password" name="password" placeholder="Create a password" required>
                        <i class="toggle-password fas fa-eye" onclick="togglePassword()"></i>
                    </div>
                    <div class="error-message" id="password-error"></div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email">
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" placeholder="Enter your phone number">
                </div>
                
                <button type="submit" class="btn-register">
                    <span id="register-text">Create Account</span>
                    <span id="register-spinner" style="display:none;">
                        <i class="fas fa-spinner fa-spin"></i> Processing...
                    </span>
                </button>
                
                <div class="login-link">
                    Already have an account? <a href="login.jsp">Sign in here</a>
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
            <h3 class="popup-title">Registration Successful!</h3>
            <p class="popup-message">Your Washmart account has been created successfully. You'll be redirected to login page shortly.</p>
            <button class="popup-button" onclick="redirectToLogin()">Continue to Login</button>
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

        document.getElementById('registerForm').addEventListener('submit', function(e) {
            // Show loading spinner
            document.getElementById('register-text').style.display = 'none';
            document.getElementById('register-spinner').style.display = 'inline';
            
            // Simple validation
            let isValid = true;
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
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
            } else if (password.length < 6) {
                document.getElementById('password-error').textContent = 'Password must be at least 6 characters';
                document.getElementById('password-error').style.display = 'block';
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                document.getElementById('register-text').style.display = 'inline';
                document.getElementById('register-spinner').style.display = 'none';
            }
        });

        // Check if registration was successful from URL parameter
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('success')) {
                showSuccessPopup(urlParams.get('success'));
            }
        };

        function showSuccessPopup(message) {
            const popup = document.getElementById('successPopup');
            if (message) {
                document.querySelector('.popup-message').textContent = message;
            }
            popup.classList.add('active');
            
            // Auto-redirect after 5 seconds
            setTimeout(redirectToLogin, 5000);
        }

        function redirectToLogin() {
            window.location.href = 'login.jsp';
        }
    </script>
</body>
</html>