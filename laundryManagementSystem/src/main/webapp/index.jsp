<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WashMart - Professional Laundry Services</title>
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
    <section id="home" class="hero">
        <div class="hero-content">
            <h2>Professional Laundry Services Redefined</h2>
            <p>Experience the perfect blend of convenience, quality, and care. WashMart offers premium laundry solutions tailored to your lifestyle.</p>
            <a href="register.jsp" class="btn">Get Started</a>
        </div>
    </section>

    <!-- Features Section -->
    <section id="services" class="features">
        <div class="feature-card">
            <i class="fas fa-bolt"></i>
            <h4>Quick Service</h4>
            <p>Lightning-fast turnaRound with same-day and next-day options available.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-star"></i>
            <h4>Premium Quality</h4>
            <p>Cutting-edge cleaning techniques and eco-friendly premium detergents.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-truck"></i>
            <h4>Convenient Delivery</h4>
            <p>Free pickup and delivery at your preferred time and location.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-shield-alt"></i>
            <h4>Secure Handling</h4>
            <p>Advanced tracking and secure processing of all your garments.</p>
        </div>
    </section>

    <!-- About Us Section -->
    <section id="about" class="about-us">
        <h3>About WashMart</h3>
        <div class="about-content">
            <div class="about-text">
                <p>WashMart is more than just a laundry service. We're a technology-driven solution dedicated to transforming how you experience clothing care. Founded in 2023, our mission is to provide unparalleled convenience, quality, and peace of mind.</p>
                <br>
                <p>With state-of-the-art facilities and a commitment to sustainability, we ensure your clothes receive the most professional treatment possible. Our team of experts uses advanced cleaning technologies and eco-friendly practices to deliver exceptional results.</p>
            </div>
            <div class="about-image">
                <img src="/api/placeholder/500/300" alt="WashMart Facility" />
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <h3>Contact Us</h3>
        <div class="contact-info">
            <div class="contact-detail">
                <i class="fas fa-phone"></i>
                <h4>Phone</h4>
                <p>+1 (555) 123-4567</p>
            </div>
            <div class="contact-detail">
                <i class="fas fa-envelope"></i>
                <h4>Email</h4>
                <p>support@washmart.com</p>
            </div>
            <div class="contact-detail">
                <i class="fas fa-map-marker-alt"></i>
                <h4>Address</h4>
                <p>123 Clean Street, Laundry City, WA 98765</p>
            </div>
        </div>
    </section>
    <style>
        :root {
            --primary-color: #00796b;
            --secondary-color: #00acc1;
            --background-light: #e0f7fa;
            --text-dark: #004d40;
            --text-light: #ffffff;
            --gradient-start: #00796b;
            --gradient-end: #00acc1;
        }

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

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, var(--background-light), #80deea);
            padding: 100px 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero h2 {
            font-size: 42px;
            color: var(--text-dark);
            margin-bottom: 20px;
            font-weight: 700;
        }

        .hero p {
            font-size: 20px;
            color: var(--text-dark);
            max-width: 800px;
            margin: 0 auto 30px;
            line-height: 1.6;
        }

        .btn {
            display: inline-block;
            padding: 14px 30px;
            background-color: var(--primary-color);
            color: var(--text-light);
            text-decoration: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background-color: var(--text-dark);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        /* Features Section */
        .features {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 60px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            background: var(--text-light);
            border-radius: 12px;
            padding: 35px;
            text-align: center;
            width: 250px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .feature-card i {
            font-size: 50px;
            color: var(--secondary-color);
            margin-bottom: 20px;
        }

        .feature-card h4 {
            color: var(--text-dark);
            margin-bottom: 15px;
            font-size: 20px;
        }

        .feature-card p {
            color: #666;
            font-size: 15px;
        }

        /* About Us Section */
        .about-us {
            background-color: var(--text-light);
            padding: 80px 20px;
            text-align: center;
        }

        .about-us h3 {
            font-size: 36px;
            color: var(--text-dark);
            margin-bottom: 30px;
        }

        .about-content {
            max-width: 900px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            gap: 40px;
        }

        .about-text {
            flex: 1;
            text-align: left;
        }

        .about-image {
            flex: 1;
        }

        .about-image img {
            max-width: 100%;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        /* Contact Section */
        .contact {
            background: linear-gradient(135deg, var(--gradient-start), var(--gradient-end));
            color: var(--text-light);
            padding: 60px 20px;
            text-align: center;
        }

        .contact h3 {
            font-size: 36px;
            margin-bottom: 30px;
        }

        .contact-info {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        .contact-detail {
            background: rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 10px;
            width: 250px;
        }

        .contact-detail i {
            font-size: 30px;
            margin-bottom: 15px;
            color: var(--text-light);
        }

        /* Footer */
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
            }

            .hero h2 {
                font-size: 32px;
            }

            .hero p {
                font-size: 16px;
            }

            .about-content {
                flex-direction: column;
            }

            .contact-info {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>

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
</body>
</html>