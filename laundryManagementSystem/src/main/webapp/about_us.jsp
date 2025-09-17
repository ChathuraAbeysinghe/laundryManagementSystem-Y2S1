<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WashMart - About Us</title>
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
    <section class="about-hero">
        <div class="hero-content">
            <h2>Our Story, Our Passion</h2>
            <p>Transforming laundry from a chore to a delightful experience</p>
        </div>
    </section>

    <!-- Our Mission Section -->
    <section class="mission-section">
        <div class="mission-content">
            <div class="mission-text">
                <h3>Our Mission</h3>
                <p>At WashMart, we're on a mission to revolutionize the way you think about laundry. We believe that every garment tells a story, and we're committed to preserving and enhancing that story with our premium care services.</p>
            </div>
            <div class="mission-icon">
                <i class="fas fa-bullseye"></i>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <h3>Meet Our Team</h3>
        <div class="team-grid">
            <div class="team-member">
                <div class="member-image">
                    <img src="/api/placeholder/300/300" alt="Team Member 1">
                </div>
                <h4>Sarah Johnson</h4>
                <p>Founder & CEO</p>
            </div>
            <div class="team-member">
                <div class="member-image">
                    <img src="/api/placeholder/300/300" alt="Team Member 2">
                </div>
                <h4>Michael Chen</h4>
                <p>Chief Operations Officer</p>
            </div>
            <div class="team-member">
                <div class="member-image">
                    <img src="/api/placeholder/300/300" alt="Team Member 3">
                </div>
                <h4>Emma Rodriguez</h4>
                <p>Head of Customer Experience</p>
            </div>
        </div>
    </section>

    <!-- Values Section -->
    <section class="values-section">
        <h3>Our Core Values</h3>
        <div class="values-grid">
            <div class="value-card">
                <i class="fas fa-heart"></i>
                <h4>Care</h4>
                <p>We treat every garment with the utmost care and respect.</p>
            </div>
            <div class="value-card">
                <i class="fas fa-leaf"></i>
                <h4>Sustainability</h4>
                <p>Committed to environmentally friendly cleaning practices.</p>
            </div>
            <div class="value-card">
                <i class="fas fa-bolt"></i>
                <h4>Innovation</h4>
                <p>Continuously improving our services through technology.</p>
            </div>
            <div class="value-card">
                <i class="fas fa-users"></i>
                <h4>Community</h4>
                <p>Supporting local communities and building strong relationships.</p>
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

        /* About Hero Section */
        .about-hero {
            background: linear-gradient(135deg, var(--background-light), var(--secondary-color));
            color: var(--text-dark);
            text-align: center;
            padding: 100px 20px;
        }

        .about-hero h2 {
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--text-dark);
        }

        .about-hero p {
            font-size: 24px;
            max-width: 700px;
            margin: 0 auto;
            color: var(--text-dark);
        }

        /* Mission Section */
        .mission-section {
            background-color: var(--text-light);
            padding: 80px 20px;
        }

        .mission-content {
            display: flex;
            align-items: center;
            max-width: 1000px;
            margin: 0 auto;
            gap: 50px;
        }

        .mission-text {
            flex: 2;
        }

        .mission-text h3 {
            font-size: 36px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .mission-icon {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mission-icon i {
            font-size: 120px;
            color: var(--accent-color);
        }

        /* Team Section */
        .team-section {
            background-color: var(--background-light);
            padding: 80px 20px;
            text-align: center;
        }

        .team-section h3 {
            font-size: 36px;
            color: var(--text-dark);
            margin-bottom: 50px;
        }

        .team-grid {
            display: flex;
            justify-content: center;
            gap: 40px;
        }

        .team-member {
            background-color: var(--text-light);
            border-radius: 15px;
            padding: 30px;
            width: 300px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .team-member:hover {
            transform: translateY(-10px);
        }

        .member-image {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto 20px;
        }

        .member-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .team-member h4 {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .team-member p {
            color: var(--text-dark);
        }

        /* Values Section */
        .values-section {
            background-color: var(--text-light);
            padding: 80px 20px;
            text-align: center;
        }

        .values-section h3 {
            font-size: 36px;
            color: var(--text-dark);
            margin-bottom: 50px;
        }

        .values-grid {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .value-card {
            background-color: var(--background-light);
            border-radius: 15px;
            padding: 30px;
            width: 250px;
            transition: all 0.3s ease;
        }

        .value-card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .value-card i {
            font-size: 60px;
            color: var(--accent-color);
            margin-bottom: 20px;
        }

        .value-card h4 {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 15px;
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
            }

            .mission-content {
                flex-direction: column;
                text-align: center;
            }

            .team-grid,
            .values-grid {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</body>
</html>