<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome Icons -->
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
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: #fff;
            padding: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: #fff;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: scale(1.05);
        }
        .btn-secondary {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: #fff;
        }
        .btn-secondary:hover {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            transform: scale(1.05);
        }
        .btn-info {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: #fff;
        }
        .btn-info:hover {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
            transform: scale(1.05);
        }
        .btn-warning {
            background: linear-gradient(135deg, #f39c12, #d35400);
            color: #fff;
        }
        .btn-warning:hover {
            background: linear-gradient(135deg, #d35400, #f39c12);
            transform: scale(1.05);
        }
        .btn i {
            margin-right: 10px;
        }
        .logout-btn {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: #fff;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .logout-btn:hover {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div>
                            <i class="fas fa-tachometer-alt"></i> Admin Dashboard
                        </div>
                        <div>
                            <a href="Login.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <a href="addCustomer.jsp" class="btn btn-primary btn-block"><i class="fas fa-user-plus"></i> Add New Customer</a>
                                <a href="transactions.jsp" class="btn btn-secondary btn-block"><i class="fas fa-exchange-alt"></i> Transactions</a>
                            </div>
                            <div class="col-md-3">
                                <a href="addBankAccount.jsp" class="btn btn-info btn-block"><i class="fas fa-piggy-bank"></i> Add Bank Account</a>
                            </div>
                            <div class="col-md-3">
                                <a href="viewCustomers.jsp" class="btn btn-warning btn-block"><i class="fas fa-users"></i> View Customers</a>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
