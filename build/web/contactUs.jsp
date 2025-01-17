<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Drive Line Company</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            color: #333;
        }

        header {
            background-color: #003366;
            width: 100%;
            padding: 15px 0;
            text-align: center;
            color: #fff;
            font-size: 2.5em;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .contact-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            width: 80%;
            max-width: 1100px;
            text-align: center;
            padding: 40px 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            gap: 30px;
        }

        .contact-form-container {
            width: 100%;
            max-width: 500px;
        }

        .contact-form-container h2 {
            color: #007bff;
            font-size: 2.5em;
            margin-bottom: 30px;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
            align-items: center;
        }

        .contact-form input,
        .contact-form textarea {
            width: 80%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1.1em;
            transition: border-color 0.3s ease;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #007bff;
            outline: none;
        }

        .contact-form button {
            padding: 15px 30px;
            background-color: #28a745;
            color: white;
            border: none;
            font-size: 1.2em;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .contact-form button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .social-media-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .social-media-icons i {
            font-size: 2.5em;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .social-media-icons a {
            color: inherit;
            text-decoration: none;
        }

        .social-media-icons i.fa-facebook-f {
            color: #3b5998; /* Facebook default color */
        }

        .social-media-icons i.fa-twitter {
            color: #1da1f2; /* Twitter default color */
        }

        .social-media-icons i.fa-linkedin-in {
            color: #0077b5; /* LinkedIn default color */
        }

        .social-media-icons i.fa-instagram {
            background: linear-gradient(45deg, #f58529, #d32f2f, #8e24aa, #1976d2); /* Instagram gradient */
            -webkit-background-clip: text;
            color: transparent;
            font-size: 2.5em;
        }

        .social-media-icons i.fa-whatsapp {
            color: #25d366; /* WhatsApp color */
        }

        .social-media-icons i.fa-google {
            color: #db4437; /* Google color */
        }

        .social-media-icons i:hover {
            transform: scale(1.2);
            opacity: 0.8;
        }

        /* Map container style */
        .map-container {
            width: 100%;
            max-width: 500px;
            height: 400px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 12px;
            width: 100%;
            margin-top: 30px;
        }

        footer a {
            color: #f1f1f1;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #007bff;
        }

        /* Responsiveness for small screens */
        @media (max-width: 768px) {
            .contact-container {
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }

            .contact-form-container,
            .map-container {
                width: 100%;
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        Contact Us - Drive Line Company
    </header>

    <!-- Contact Us Form Section -->
    <div class="contact-container">
        <!-- Contact Form -->
        <div class="contact-form-container">
            <h2>Get in Touch</h2>
            <p>Have questions? We?d love to hear from you! Please fill out the form below to reach us.</p>
            <form class="contact-form" action="submitContactForm" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                <button type="submit">Send Message</button>
            </form>
            
            <!-- Social Media Icons -->
            <div class="social-media-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-whatsapp"></i></a>
                <a href="#"><i class="fab fa-google"></i></a>
            </div>
        </div>

        <!-- Google Map Section -->
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387190.2799083517!2d-74.2598732!3d40.6976701!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a1e6cf4e5c1%3A0x9f17b0640b922968!2sNew%20York%2C%20NY!5e0!3m2!1sen!2sus!4v1595745622131!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Drive Line Company | <a href="home.jsp">Home</a> | <a href="about.jsp">About Us</a></p>
    </footer>

</body>
</html>
