<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .carousel {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .carousel-inner {
            width: 100%;
            height: 100%;
        }

        .carousel-item {
            height: 100%;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .login-container {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 450px;
            background: rgba(255, 255, 255, 0.65); 
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            color: #333;
        }

        .login-container h2 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: 600;
        }

        .login-container input[type="text"],
        .login-container input[type="password"],
        .login-container select {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus,
        .login-container select:focus {
            border-color: #4568DC; /* Purple Color for focus */
            box-shadow: 0 0 0 0.2rem rgba(69, 104, 220, 0.25);
            border-bottom: 2px solid #4568DC; /* Add a bottom border */
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #007bff;
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
        }

        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #e74c3c;
            margin-top: 10px;
            text-align: center; /* Center the error message */
        }

        .transaction-button {
            margin-top: 15px;
            background-color: #28a745;
            border-color: #28a745;
            color: white;
            font-size: 16px;
            padding: 12px;
            border-radius: 10px;
        }

        .transaction-button:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>

    <!-- Image Slider -->
    <div id="backgroundCarousel" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/image1.jpg" alt="Image 1">
            </div>
            <div class="carousel-item">
                <img src="images/image2.jpg" alt="Image 2">
            </div>
            <div class="carousel-item">
                <img src="images/image3.jpg" alt="Image 3">
            </div>
            <div class="carousel-item">
                <img src="images/image4.jpg" alt="Image 4">
            </div>
        </div>
        <a class="carousel-control-prev" href="#backgroundCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#backgroundCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="overlay"></div>

    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginController" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <select name="loginAs" required>
                <option value="Admin">Admin</option>
                <option value="User">User</option>
            </select><br>
            <input type="submit" value="Login">
        </form>

      
        <%
            String error = request.getParameter("error");
            if (error != null && error.equals("true")) {
                out.println("<p class='error-message'>Invalid login credentials. Please try again.</p>");
            }
        %>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>