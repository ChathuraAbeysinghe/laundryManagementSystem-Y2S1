<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WashMart - Our Services</title>
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

    <!-- Services Hero Section -->
    <section class="services-hero">
        <div class="hero-content">
            <h2>Comprehensive Laundry Solutions</h2>
            <p>Tailored services to meet all your clothing care needs</p>
        </div>
    </section>

    <!-- Service Types Section -->
    <section class="service-types">
        <h3>Our Service Offerings</h3>
        <div class="services-grid">
            <div class="service-card">
                <i class="fas fa-tshirt"></i>
                <h4>Standard Wash & Fold</h4>
                <p>Everyday laundry cleaning with careful sorting and folding.</p>
                <div class="service-details">
                    <span class="price">Starting at 1000.Rs</span>
                    <ul>
                        <li>Separate color sorting</li>
                        <li>Gentle detergent</li>
                        <li>Precise folding</li>
                    </ul>
                </div>
            </div>

            <div class="service-card">
                <i class="fas fa-tie"></i>
                <h4>Dry Cleaning</h4>
                <p>Premium care for delicate and formal wear.</p>
                <div class="service-details">
                    <span class="price">Starting at 1500.Rs</span>
                    <ul>
                        <li>Suits & Dresses</li>
                        <li>Leather & Suede</li>
                        <li>Delicate Fabrics</li>
                    </ul>
                </div>
            </div>

            <div class="service-card">
                <i class="fas fa-heart"></i>
                <h4>Specialty Care</h4>
                <p>Expert treatment for delicate and designer items.</p>
                <div class="service-details">
                    <span class="price">Custom Pricing</span>
                    <ul>
                        <li>Wedding Gowns</li>
                        <li>Vintage Clothing</li>
                        <li>Designer Wear</li>
                    </ul>
                </div>
            </div>

            <div class="service-card">
                <i class="fas fa-truck"></i>
                <h4>Pickup & Delivery</h4>
                <p>Convenient laundry service right to your doorstep.</p>
                <div class="service-details">
                    <span class="price">Free within 5 Km</span>
                    <ul>
                        <li>Scheduled Pickups</li>
                        <li>Flexible Timings</li>
                        <li>Contactless Options</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <h3>How WashMart Works</h3>
        <div class="steps-container">
            <div class="step">
                <div class="step-number">1</div>
                <h4>Schedule</h4>
                <p>Book online or via our mobile app. Choose your preferred pickup time.</p>
            </div>
            <div class="step">
                <div class="step-number">2</div>
                <h4>Pickup</h4>
                <p>Our friendly staff collects your laundry with care and precision.</p>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <h4>Clean</h4>
                <p>We meticulously clean and treat each garment using eco-friendly methods.</p>
            </div>
            <div class="step">
                <div class="step-number">4</div>
                <h4>Deliver</h4>
                <p>Freshly cleaned clothes delivered back to you, perfectly folded.</p>
            </div>
        </div>
    </section>

    <!-- Pricing Section -->
    <section class="pricing-section">
        <h3>Transparent Pricing</h3>
        <div class="pricing-cards">
            <div class="pricing-card">
                <h4>Basic Plan</h4>
                <div class="price-tag">10000.Rs</div>
                <ul>
                    <li>Up to 20 Kg Wash & Fold</li>
                    <li>Standard Delivery</li>
                    <li>Basic Stain Removal</li>
                </ul>
                <a href="login.jsp" class="btn">Choose Basic</a>
            </div>
            <div class="pricing-card featured">
                <h4>Premium Plan</h4>
                <div class="price-tag">18000.Rs</div>
                <ul>
                    <li>Up to 40 Kg Wash & Fold</li>
                    <li>Free Express Delivery</li>
                    <li>Advanced Stain Treatment</li>
                    <li>Dry Cleaning Credits</li>
                </ul>
                <a href="login.jsp" class="btn">Choose Premium</a>
            </div>
            <div class="pricing-card">
                <h4>Business Plan</h4>
                <div class="price-tag">30000.Rs</div>
                <ul>
                    <li>Unlimited Wash & Fold</li>
                    <li>Priority Service</li>
                    <li>Dedicated Account Manager</li>
                    <li>Corporate Invoicing</li>
                </ul>
                <a href="login.jsp" class="btn">Choose Business</a>
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

        /* Services Hero Section */
        .services-hero {
            background: linear-gradient(135deg, var(--background-light), var(--secondary-color));
            color: var(--text-dark);
            text-align: center;
            padding: 100px 20px;
        }

        .services-hero h2 {
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--text-dark);
        }

        .services-hero p {
            font-size: 24px;
            max-width: 700px;
            margin: 0 auto;
            color: var(--text-dark);
        }

        /* Service Types Section */
        .service-types {
            background-color: var(--text-light);
            padding: 80px 20px;
            text-align: center;
        }

        .service-types h3 {
            font-size: 36px;
            color: var(--text-dark);
            margin-bottom: 50px;
        }

        .services-grid {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .service-card {
            background-color: var(--background-light);
            border-radius: 15px;
            padding: 30px;
            width: 280px;
            transition: all 0.3s ease;
            text-align: center;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .service-card i {
            font-size: 60px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .service-card h4 {
            font-size: 24px;
            color: var(--text-dark);
            margin-bottom: 15px;
        }

        .service-details .price {
            display: block;
            color: var(--accent-color);
            font-weight: bold;
            margin-bottom: 15px;
        }

        .service-details ul {
            list-style-type: none;
            text-align: center;
        }

        .service-details ul li {
            margin-bottom: 10px;
            color: var(--text-dark);
        }

        /* How It Works Section */
        .how-it-works {
            background-color: var(--text-light);
            padding: 80px 20px;
            text-align: center;
        }

        .how-it-works h3 {
            font-size: 36px;
            color: var(--text-dark);
            margin-bottom: 50px;
        }

        .steps-container {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .step {
            background-color: var(--background-light);
            border-radius: 15px;
            padding: 30px;
            width: 250px;
            position: relative;
            transition: transform 0.3s ease;
        }

        .step:hover {
            transform: translateY(-10px);
        }

        .step-number {
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            background-color: var(--primary-color);
            color: var(--text-light);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }

        .step h4 {
            color: var(--text-dark);
            margin-top: 20px;
            margin-bottom: 15px;
            font-size: 24px;
        }

        /* Pricing Section */
        .pricing-section {
            background-color: var(--background-light);
            padding: 80px 20px;
            text-align: center;
        }

        .pricing-section h3 {
            font-size: 36px;
            color: var(--text-dark);
            margin-bottom: 50px;
        }

        .pricing-cards {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .pricing-card {
            background-color: var(--text-light);
            border-radius: 15px;
            padding: 30px;
            width: 300px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .pricing-card:hover {
            transform: translateY(-10px);
        }

        .pricing-card.featured {
            border: 2px solid var(--primary-color);
            transform: scale(1.05);
        }

        .pricing-card h4 {
            font-size: 24px;
            color: var(--text-dark);
            margin-bottom: 20px;
        }

        .price-tag {
            font-size: 36px;
            color: var(--primary-color);
            margin-bottom: 20px;
            font-weight: bold;
        }

        .pricing-card ul {
            list-style-type: none;
            margin-bottom: 20px;
        }

        .pricing-card ul li {
            margin-bottom: 10px;
            color: var(--text-dark);
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: var(--primary-color);
            color: var(--text-light);
            text-decoration: none;
            border-radius: 8px;
            transition:
