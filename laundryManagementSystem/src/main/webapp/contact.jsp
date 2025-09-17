<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WashMart - Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <header>
        <h1><i class="fas fa-tshirt"></i> WashMart</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="about_us.jsp">About</a>
            <a href="services.jsp">Services</a>
            <a href="contact.jsp">Contact</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="contact-hero">
        <div class="hero-content">
            <h2>Get In Touch</h2>
            <p>We'd love to hear from you! Drop us a message or reach out directly.</p>
        </div>
    </section>

    <!-- Contact Info Section -->
    <section class="contact-info-section">
        <div class="contact-grid">
            <div class="contact-card">
                <i class="fas fa-map-marker-alt"></i>
                <h4>Visit Us</h4>
                <p>123 Laundry Lane, Cleansville<br>NYC, 10001</p>
            </div>
            <div class="contact-card">
                <i class="fas fa-phone"></i>
                <h4>Call Us</h4>
                <p>+1 (555) 123-4567<br>Mon-Fri: 8am - 8pm</p>
            </div>
            <div class="contact-card">
                <i class="fas fa-envelope"></i>
                <h4>Email Us</h4>
                <p>info@washmart.com<br>support@washmart.com</p>
            </div>
            <div class="contact-card">
                <i class="fas fa-clock"></i>
                <h4>Hours</h4>
                <p>Mon-Sat: 7am - 9pm<br>Sunday: 9am - 7pm</p>
            </div>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section class="contact-form-section">
        <div class="form-container">
            <h3>Send Us a Message</h3>
            <form id="contactForm" action="processContact.jsp" method="post">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone">
                </div>
                
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <select id="subject" name="subject">
                        <option value="general">General Inquiry</option>
                        <option value="service">Service Question</option>
                        <option value="pricing">Pricing Information</option>
                        <option value="feedback">Feedback</option>
                        <option value="complaint">Complaint</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="message">Your Message</label>
                    <textarea id="message" name="message" rows="6" required></textarea>
                </div>
                
                <button type="submit" class="submit-btn">
                    <i class="fas fa-paper-plane"></i> Send Message
                </button>
            </form>
            
            <div id="success-message" class="success-message">
                Thank you for reaching out! We'll get back to you shortly.
            </div>
        </div>
    </section>
    
    <!-- Map Section -->
    <section class="map-section">
        <div class="map-container">
            <div class="map-placeholder">
                <!-- In a real implementation, you would include an actual map here -->
                <i class="fas fa-map"></i>
                <p>Interactive Map Would Be Displayed Here</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="social-links">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
        </div>
        &copy; 2025 WashMart. All rights reserved. | Designed with ❤️ by WashMart Team
    </footer>

    <!-- Inline CSS Styles -->
    <style>
        /* Root Variables for Color Scheme */
        :root {
            --primary-color: #00796b;
            --secondary-color: #00acc1;
            --accent-color: #ff6b6b;
            --background-light: #e0f7fa;
            --text-dark: #004d40;
            --text-light: #ffffff;
            --gradient-start: #00796b;
            --gradient-end: #00acc1;
        }

        /* Reset and Base Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-dark);
            background: #f4f7f8;
        }

        /* Header Styles */
        header {
            background: linear-gradient(to right, var(--gradient-start), var(--gradient-end));
            color: var(--text-light);
            padding: 20px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        header h1 {
            display: flex;
            align-items: center;
            font-size: 32px;
            font-weight: 700;
        }

        header h1 i {
            margin-right: 15px;
            color: var(--text-light);
        }

        /* Navigation Styles */
        nav {
            display: flex;
            align-items: center;
        }

        nav a {
            color: var(--text-light);
            margin-left: 20px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        nav a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--text-light);
            transition: width 0.3s ease;
        }

        nav a:hover::after {
            width: 100%;
        }

        /* Contact Hero Section */
        .contact-hero {
            background: linear-gradient(135deg, var(--background-light), var(--secondary-color));
            color: var(--text-dark);
            text-align: center;
            padding: 80px 20px;
        }

        .contact-hero h2 {
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--text-dark);
        }

        .contact-hero p {
            font-size: 24px;
            max-width: 700px;
            margin: 0 auto;
            color: var(--text-dark);
        }

        /* Contact Info Section */
        .contact-info-section {
            background-color: var(--text-light);
            padding: 60px 20px;
        }

        .contact-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
            gap: 30px;
        }

        .contact-card {
            background-color: var(--background-light);
            border-radius: 15px;
            padding: 30px;
            width: 260px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-10px);
        }

        .contact-card i {
            font-size: 50px;
            color: var(--accent-color);
            margin-bottom: 20px;
        }

        .contact-card h4 {
            font-size: 22px;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .contact-card p {
            color: var(--text-dark);
            line-height: 1.8;
        }

        /* Contact Form Section */
        .contact-form-section {
            background-color: var(--background-light);
            padding: 80px 20px;
        }

        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: var(--text-light);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .form-container h3 {
            font-size: 32px;
            color: var(--primary-color);
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-dark);
            font-weight: 500;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d0d0d0;
            border-radius: 8px;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: var(--secondary-color);
            outline: none;
        }

        .submit-btn {
            background: linear-gradient(to right, var(--gradient-start), var(--gradient-end));
            color: var(--text-light);
            border: none;
            padding: 14px 30px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            margin-top: 20px;
            display: none;
        }

        /* Map Section */
        .map-section {
            padding: 40px 20px;
            background-color: var(--text-light);
        }

        .map-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .map-placeholder {
            background-color: var(--background-light);
            height: 400px;
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: var(--text-dark);
        }

        .map-placeholder i {
            font-size: 80px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        /* Footer Styles */
        footer {
            background-color: var(--text-dark);
            color: var(--text-light);
            text-align: center;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .social-links {
            margin-bottom: 15px;
        }

        .social-links a {
            color: var(--text-light);
            margin: 0 10px;
            font-size: 24px;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: var(--secondary-color);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
            }

            nav {
                margin-top: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            nav a {
                margin: 5px 10px;
            }

            .contact-hero h2 {
                font-size: 36px;
            }

            .contact-hero p {
                font-size: 18px;
            }

            .contact-grid {
                flex-direction: column;
                align-items: center;
            }

            .form-container {
                padding: 30px 20px;
            }
        }

        /* Script to handle form submission */
        document.addEventListener('DOMContentLoaded', function() {
            const contactForm = document.getElementById('contactForm');
            const successMessage = document.getElementById('success-message');
            
            if (contactForm) {
                contactForm.addEventListener('submit', function(e) {
                    // In a real application, you would handle form submission via AJAX
                    // For demonstration, we're just showing the success message
                    
                    // Uncomment the next line to prevent the actual form submission for testing
                    // e.preventDefault();
                    
                    // Show success message - this would typically happen after a successful AJAX call
                    // successMessage.style.display = 'block';
                });
            }
        });
    </style>

    <script>
        // JavaScript for form handling
        document.addEventListener('DOMContentLoaded', function() {
            const contactForm = document.getElementById('contactForm');
            const successMessage = document.getElementById('success-message');
            
            if (contactForm) {
                contactForm.addEventListener('submit', function(e) {
                    // In a real application, you would handle form submission via AJAX
                    // For demonstration, we're just showing the success message
                    
                    // Uncomment the next line to prevent the actual form submission for testing
                    // e.preventDefault();
                    
                    // Show success message - this would typically happen after a successful AJAX call
                    // successMessage.style.display = 'block';
                });
            }
        });
    </script>
</body>
</html>