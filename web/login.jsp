<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Yinka Enoch Adedokun">
    <title>DriveLine Inventory Management - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            background-image: linear-gradient(135deg, #0066cc 10%, #00b8f4 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s ease-out;
        }

        nav {
            background-color: #003366;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 999;
            transition: all 0.3s ease-in-out;
        }

        nav ul {
            padding: 0;
            list-style: none;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            padding: 16px 25px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        nav ul li a {
            color: #f1f1f1;
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        nav ul li:hover {
            background-color: #0066cc;
            transform: scale(1.1);
            border-radius: 4px;
        }

        nav ul li a:hover {
            color: #fff;
            transform: translateY(-5px);
        }

        .container {
            text-align: center;
            padding: 40px 20px;
            background-color: #ffffff;
            color: #333;
            border-radius: 15px;
            width: 360px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 1.5s ease-out;
            transition: transform 0.3s ease;
        }

        h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #007bff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
            font-weight: 700;
        }

        .form__input {
            width: 100%;
            padding: 15px;
            margin: 1.5em auto;
            font-size: 16px;
            border: 2px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form__input:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        .btn {
            width: 70%;
            padding: 15px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .forgot-password {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .forgot-password:hover {
            color: #0056b3;
            text-decoration: underline;
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
            box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
        }

        footer p {
            color: #f8f9fa;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 85%;
            }
        }

        /* Keyframe Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        .form__input, .btn {
            animation: slideIn 1s ease-in-out;
        }

    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <ul>
        <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
        <li><a href="signIn.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
        <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
        <li><a href="contactUs.jsp"><i class="fas fa-phone-alt"></i> Contact Us</a></li>
    </ul>
</nav>

<!-- Main Content -->
<div class="container">
    <h2><i class="fas fa-sign-in-alt"></i> Log In</h2>
    <form action="Login" method="POST">
        <input type="text" name="username" class="form__input" placeholder="Enter Username" required>
        <input type="password" name="password" class="form__input" placeholder="Enter Password" required>
        <input type="submit" value="Login" class="btn">
    </form>
    <a href="#" class="forgot-password">Forgot Password?</a>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 DriveLine Inventory Management | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    // Assuming you want to show an alert if login fails
    const loginError = false;  // Set this flag based on your login check
    if (loginError) {
        Swal.fire({
            icon: 'error',
            title: 'Invalid username or password',
            text: 'Please try again.'
        });
    }
</script>

</body>
</html>
