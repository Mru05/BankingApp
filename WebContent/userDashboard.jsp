<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #e9ecef;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: #6f42c1;
            padding: 15px;
        }

        .navbar-brand {
            color: #ffffff;
            font-size: 1.5rem;
            text-align: center;
            width: 100%;
            display: block;
        }

        .navbar-brand:hover {
            color: #e0e0e0;
        }

        .logout-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .logout-button {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 15px 30px;
            border-radius: 8px;
            font-size: 1.25rem;
            text-decoration: none;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .logout-button:hover {
            background-color: #c82333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .container {
            width: 90%;
            max-width: 1200px;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            text-align: center;
            margin: auto;
            margin-top: 30px;
        }

        .container h1 {
            color: #343a40;
            margin-bottom: 30px;
            font-size: 2.5rem;
            font-weight: 600;
            font-family: 'Roboto', sans-serif;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        .card-body {
            text-align: center;
        }

        .card-body a {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px;
            font-size: 1.5rem;
            color: #ffffff;
            background-color: #fd7e14;
            border-radius: 10px;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            font-weight: 500;
        }

        .card-body a i {
            margin-right: 15px;
            font-size: 1.75rem;
        }

        .card-body a:hover {
            background-color: #e76000;
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        .card-body a:active {
            transform: scale(1);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .row {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .col-md-4 {
            flex: 1 1 30%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%
    // No need to declare the session object, it is already available
    if (session == null) {
        // Redirect to login page if session is invalid or has expired
        response.sendRedirect("Login.jsp");
        return; // Prevent further processing
    }

    String firstName = (String) session.getAttribute("firstName");
    String lastName = (String) session.getAttribute("lastName");
    Double accountBalance = (Double) session.getAttribute("accountBalance");

    if (firstName != null && lastName != null) {
        out.println("<h1>Welcome, " + firstName + " " + lastName + "!</h1>");
    } else {
        out.println("<h1>Welcome!</h1>");
    }

    out.println("<p>Your account balance is: $" + accountBalance + "</p>");
%>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">User Dashboard</a>
    </nav>

    <div class="logout-container">
        <a class="logout-button" href="LogoutController">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>

    <div class="container">
        <h1>Hello! Hope you are having a great day!!!</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="passbook.jsp">
                            <i class="bi bi-journal-bookmark"></i> PassBook
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="TransactionPage.jsp">
                            <i class="bi bi-cash-stack"></i> New Transaction
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="edit.jsp">
                            <i class="bi bi-person-circle"></i> Edit Profile
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.min.js"></script>
</body>
</html>
