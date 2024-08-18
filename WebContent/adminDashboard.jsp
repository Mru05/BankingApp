<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
            background: #f8f9fa;
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
            text-decoration: none;
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
            background-color: #fd7e14; /* Orange color */
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
            background-color: #e76000; /* Darker orange color */
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

        .col-md-3 {
            flex: 1 1 23%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
    </nav>

    <div class="logout-container">
        <a class="logout-button" href="LogoutController">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>

    <div class="container">
        <h1>Hello, Hope You are having a great day!!!</h1>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <a href="addCustomer.jsp">
                            <i class="bi bi-person-plus"></i>Add New Customer
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <a href="transactions.jsp">
                            <i class="bi bi-cash-stack"></i> Transactions
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <a href="addBankAccount.jsp">
                            <i class="bi bi-bank"></i> Add Bank Account
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <a href="viewCustomers.jsp">
                            <i class="bi bi-eye"></i> View Customers
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
