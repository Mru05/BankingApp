<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #fbe8eb, #f9e5f0);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 100%;
            max-width: 600px;
        }
        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
        }
        .card-header {
            background-color: #b95c8a;
            color: #fff;
            text-align: center;
            font-size: 1.75rem;
            font-weight: bold;
            padding: 1rem;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        .input-group-text {
            background-color: #f9f9f9;
            border: none;
            border-radius: 5px 0 0 5px;
        }
        .form-control {
            border-radius: 5px;
            padding: 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            border-color: #b95c8a;
            box-shadow: 0 0 5px rgba(185, 92, 138, 0.5);
        }
        .btn-primary {
            background-color: #b95c8a;
            border: none;
            border-radius: 5px;
            padding: 15px;
            font-size: 1.1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #a04a6e;
            transform: scale(1.03);
        }
        .btn-block {
            width: 100%;
        }
        .card-body {
            padding: 2rem;
        }
        .input-group {
            margin-bottom: 1rem;
        }
        .input-group-text i {
            color: #b95c8a;
        }
        #accountType {
            font-size: 1.1rem;
            padding: 15px;
            height: calc(2.5rem + 2px); /* Increase height for better visibility */
        }
        .back-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            Customer Registration
        </div>
        <div class="card-body">
            <form action="AddCustomerController" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                    </div>
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                    </div>
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-envelope-open-text"></i></span>
                    </div>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                </div>

                <!-- Account Type Dropdown -->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-university"></i></span>
                    </div>
                    <select class="form-control" id="accountType" name="accountType" required>
                        <option value="Savings">Savings</option>
                        <option value="Current">Current</option>
                        <option value="Credit">Credit</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form>

            <!-- Back Button -->
            <div class="back-button">
                <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>
