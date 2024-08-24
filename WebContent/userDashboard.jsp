<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            background: linear-gradient(135deg, #6f42c1, #5936b1);
            color: #fff;
            padding: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            font-weight: bold;
        }
        .card-body {
            padding: 30px;
        }
        .btn {
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-bottom: 15px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #6f42c1, #5936b1);
            color: #fff;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #5936b1, #6f42c1);
            transform: scale(1.05);
        }
        .btn-secondary {
            background: linear-gradient(135deg, #fd7e14, #e96010);
            color: #fff;
        }
        .btn-secondary:hover {
            background: linear-gradient(135deg, #e96010, #fd7e14);
            transform: scale(1.05);
        }
        .btn-info {
            background: linear-gradient(135deg, #28a745, #218838);
            color: #fff;
        }
        .btn-info:hover {
            background: linear-gradient(135deg, #218838, #28a745);
            transform: scale(1.05);
        }
        .btn i {
            margin-right: 10px;
        }
        .navbar {
            background: linear-gradient(135deg, #6f42c1, #5936b1);
            padding: 15px;
        }
        .navbar-brand {
            color: #fff;
            font-size: 1.5rem;
        }
        .navbar-nav {
            margin-left: auto;
        }
        .logout-button {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 1rem;
            text-decoration: none;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .logout-button:hover {
            background-color: #c82333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<%
    if (session == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String firstName = (String) session.getAttribute("firstName");
    String lastName = (String) session.getAttribute("lastName");
    Double accountBalance = (Double) session.getAttribute("accountBalance");
%>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">User Dashboard</a>
        <div class="navbar-nav">
            <a class="nav-item nav-link logout-button" href="LogoutController">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </nav>

    <div class="container">
        <div class="card">
            <div class="card-header">
                Welcome, <%= firstName %> <%= lastName %>!
            </div>
            <div class="card-body">
                <h5>Your account balance is: $<%= accountBalance %></h5>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="passbook.jsp" class="btn btn-primary btn-block">
                            <i class="fas fa-book"></i> PassBook
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="TransactionPage.jsp" class="btn btn-secondary btn-block">
                            <i class="fas fa-exchange-alt"></i> New Transaction
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="edit.jsp" class="btn btn-info btn-block">
                            <i class="fas fa-user-edit"></i> Edit Profile
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
