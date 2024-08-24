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
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 100%;
            max-width: 600px;
            background-color: #fff;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            background: linear-gradient(135deg, #6f42c1, #5936b1);
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
            border-color: #6f42c1;
            box-shadow: 0 0 5px rgba(111, 66, 193, 0.5);
        }
        .btn-primary {
            background: linear-gradient(135deg, #6f42c1, #5936b1);
            border: none;
            border-radius: 5px;
            padding: 15px;
            font-size: 1.1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #5936b1, #6f42c1);
            transform: scale(1.03);
        }
        .btn-secondary {
            background: linear-gradient(135deg, #fd7e14, #e96010);
            color: #fff;
            border-radius: 5px;
            padding: 15px;
            font-size: 1.1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-secondary:hover {
            background: linear-gradient(135deg, #e96010, #fd7e14);
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
            color: #6f42c1;
        }
        #accountType {
            font-size: 1.1rem;
            padding: 15px;
            height: calc(2.5rem + 2px);
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
                        <option value="Current">Credit</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form>

            <!-- Back Button -->
            <div class="back-button">
                <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>

            <!-- Display success or error messages -->
            <%
                String success = request.getParameter("success");
                String error = request.getParameter("error");

                if (success != null && success.equals("true")) {
            %>
                <div class="alert alert-success" role="alert">
                    Customer registered successfully!
                </div>
            <%
                } else if (error != null) {
            %>
                <div class="alert alert-danger" role="alert">
                    <%= error %>
                </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>