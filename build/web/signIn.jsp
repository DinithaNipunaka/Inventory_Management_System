<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
            font-family: 'Poppins', sans-serif;
        }
        .card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 16px 30px rgba(0, 0, 0, 0.3);
        }
        .btn-primary {
            background: linear-gradient(90deg, #ff758c, #ff7eb3);
            border: none;
            font-size: 1.2rem;
            transition: background 0.4s ease-in-out, transform 0.2s;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #fa4299, #ff6070);
            transform: translateY(-3px);
        }
        .form-check-input:checked {
            background-color: #fa4299;
            border-color: #fa4299;
        }
        label {
            font-weight: bold;
        }
        .form-control:focus {
            box-shadow: 0 0 5px 2px rgba(250, 66, 153, 0.6);
            border-color: #fa4299;
        }
        .img-fluid {
            animation: fadeInLeft 1.5s ease-in-out;
        }
        .form-outline {
            transition: transform 0.3s ease-in-out;
        }
        .form-outline:hover {
            transform: translateY(-3px);
        }
        .fa-fw {
            color: #fa4299;
        }
        @keyframes fadeInLeft {
            0% {
                opacity: 0;
                transform: translateX(-30px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }
        .text-center {
            animation: bounceIn 1.5s ease-in-out;
        }
        @keyframes bounceIn {
            0%, 20%, 40%, 60%, 80%, 100% {
                animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);
            }
            0% {
                opacity: 0;
                transform: scale3d(.3, .3, .3);
            }
            20% {
                transform: scale3d(1.1, 1.1, 1.1);
            }
            40% {
                transform: scale3d(.9, .9, .9);
            }
            60% {
                opacity: 1;
                transform: scale3d(1.03, 1.03, 1.03);
            }
            80% {
                transform: scale3d(.97, .97, .97);
            }
            100% {
                opacity: 1;
                transform: scale3d(1, 1, 1);
            }
        }
    </style>
</head>
<body>
    <section class="vh-100">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-12 col-xl-11">
                    <div class="card text-black animate__animated animate__zoomIn">
                        <div class="card-body p-md-5">
                            <div class="row justify-content-center">
                                <div class="col-md-10 col-lg-6 col-xl-5">
                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign Up</p>
                                    <form action="SignIn" method="POST" class="mx-1 mx-md-4">
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="text" class="form-control" id="fullName" name="fullName" required />
                                                <label class="form-label" for="fullName">Your Name</label>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user-circle fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="text" class="form-control" id="username" name="username" required />
                                                <label class="form-label" for="username">Username For Login</label>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="email" class="form-control" id="email" name="email" required />
                                                <label class="form-label" for="email">Your Email</label>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="password" class="form-control" id="password" name="password" required />
                                                <label class="form-label" for="password">Password</label>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" required />
                                                <label class="form-label" for="repeatPassword">Repeat your password</label>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-briefcase fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <select class="form-select" id="department" name="department" required>
                                                    <option value="1">HR</option>
                                                    <option value="2">Finance</option>
                                                    <option value="3">Sales</option>
                                                    <option value="4">Marketing</option>
                                                    <option value="5">IT Support</option>
                                                </select>
                                                <label class="form-label" for="department">Department</label>
                                            </div>
                                        </div>
                                        <div class="form-check d-flex justify-content-center mb-5">
                                            <input class="form-check-input me-2" type="checkbox" value="" id="terms" required />
                                            <label class="form-check-label" for="terms">
                                                I agree all statements in <a href="#!">Terms of service</a>
                                            </label>
                                        </div>
                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <button type="submit" class="btn btn-primary btn-lg">Register</button>
                                        </div>
                                    </form>
                                </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const errorMessage = '<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>';
        if (errorMessage) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: errorMessage,
            });
        }
    </script>
</body>
</html>
