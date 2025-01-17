<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Drive Line Company</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: #333;
        }

        header {
            background: linear-gradient(90deg, #4CAF50, #03A9F4);
            width: 100%;
            padding: 15px 0;
            text-align: center;
            color: #fff;
            font-size: 2em;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .content {
            width: 80%;
            max-width: 1000px;
            text-align: center;
            padding: 40px 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        .content h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        .about-text {
            font-size: 1.2em;
            line-height: 1.6;
            color: #555;
        }

        .team {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 30px;
        }

        .team-member {
            width: 260px;
            margin-bottom: 30px;
            padding: 20px;
            background: linear-gradient(135deg, #03A9F4, #4CAF50);
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            color: white;
        }

        .team-member:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 22px rgba(0, 0, 0, 0.3);
        }

        .team-member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid white;
        }

        .team-member h3 {
            font-size: 1.6em;
            margin-bottom: 10px;
        }

        .team-member p {
            font-size: 1em;
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px;
            width: 100%;
            margin-top: 30px;
        }

        footer a {
            color: #f1f1f1;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #03A9F4;
        }

        /* Icons Styles */
        .team-member p i {
            margin-right: 5px;
            color: #FFD700; /* Gold icon color */
        }

        h2 i {
            color: #FF5722;
            margin-right: 10px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <i class="fas fa-building"></i> About Us - Drive Line Company
    </header>

    <!-- Main Content -->
    <div class="content">
        <h2><i class="fas fa-bullseye"></i> Our Mission</h2>
        <p class="about-text">
            At Drive Line Company, we are dedicated to providing top-notch inventory management solutions. Our goal is to help businesses optimize their inventory processes, increase efficiency, and reduce waste. With years of expertise in the field, we offer a comprehensive solution tailored to meet the unique needs of every business.
        </p>

        <h2><i class="fas fa-users"></i> Our Team</h2>
        <div class="team">
            <div class="team-member">
                <img src="img/IMG-20240220-WA0007.jpg" alt="Dinitha Nipunaka">
                <h3>Dinitha Nipunaka</h3>
                <p><i class="fas fa-user-tie"></i> Founder & CEO</p>
                <p>Over 20 years of experience in inventory management and business strategy.</p>
            </div>
            <div class="team-member">
                <img src="img/20200819_130432.jpg" alt="Anoma Samarakoon">
                <h3>Anoma Samarakoon</h3>
                <p><i class="fas fa-cogs"></i> Chief Technology Officer</p>
                <p>Leads the development team, focusing on innovative technology solutions.</p>
            </div>
            <div class="team-member">
                <img src="img/12.jpg" alt="Sarath Kumarasiri">
                <h3>Sarath Kumarasiri</h3>
                <p><i class="fas fa-bullhorn"></i> Marketing Director</p>
                <p>Oversees marketing efforts, ensuring the brand reaches the right audience.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Drive Line Company | <a href="contactUs.jsp">Contact Us</a> | <a href="home.jsp">Home</a></p>
    </footer>

</body>
</html>
