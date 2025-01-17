<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive Line Company - Inventory Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        nav {
            background-color: #003366; /* Dark blue background for navbar */
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        nav ul {
            padding: 0;
            list-style: none;
            margin: 0;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            padding: 16px 30px;
            transition: background-color 0.3s ease;
        }
        nav ul li a {
            color: #f1f1f1; /* Light gray text for links */
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }
        nav ul li a:hover {
            color: #fff; /* White text on hover */
        }
        nav ul li:hover {
            background-color: #0066cc; /* Lighter blue on hover */
            border-radius: 4px;
        }
        .container {
            text-align: center;
            padding: 60px 20px;
            background-color: #ffffff;
            color: #333;
            border-radius: 8px;
            margin: 50px auto;
            width: 50%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.8em;
            margin-bottom: 20px;
            color: #007bff;
        }
        p {
            font-size: 1.2em;
            margin-bottom: 30px;
            color: #666;
        }
        .button {
            padding: 15px 35px;
            background-color: #28a745;
            color: white;
            border: none;
            font-size: 1.1em;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin: 10px;
        }
        .button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
        .button-secondary {
            background-color: #007bff;
        }
        .button-secondary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 5px;
            font-size: 0.8em;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        footer p {
            color: #f8f9fa;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <ul>
            <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
            <li><a href="signIn.jsp"><i class="fa fa-sign-in-alt"></i> Sign In</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-in-alt"></i> Login</a></li>
            <li><a href="about.jsp"><i class="fa fa-info-circle"></i> About Us</a></li>
            <li><a href="contactUs.jsp"><i class="fa fa-phone-alt"></i> Contact Us</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="container">
          <h1>Welcome to Drive Line Company</h1>
        <p>Your trusted partner in inventory management. Streamline your operations, manage your stock, and achieve efficiency.</p>
        <a href="signIn.jsp"><button class="button button-secondary">Sign In</button></a>
        <a href="login.jsp"><button class="button">Login</button></a>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Drive Line Company | All Rights Reserved</p>
    </footer>

</body>
</html>
