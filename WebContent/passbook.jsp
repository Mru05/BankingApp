<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passbook</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f3f3f3, #e6e6e6);
            font-family: 'Arial', sans-serif;
            transition: background 0.5s ease;
        }
        .container {
            max-width: 800px;
            margin-top: 50px;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 30px;
            font-size: 2.5rem;
            color: #343a40;
            transition: color 0.3s ease;
        }
        h2 {
            margin-top: 30px;
            font-size: 2rem;
            color: #495057;
            border-bottom: 2px solid #e83e8c;
            padding-bottom: 10px;
            transition: border-color 0.3s ease;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 25px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            border-color: #e83e8c;
            box-shadow: 0 0 0 0.2rem rgba(232, 62, 140, 0.25);
        }
        .btn-primary {
            background-color: #e83e8c;
            border: none;
            border-radius: 25px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #d63384;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        table {
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            transition: box-shadow 0.3s ease;
        }
        table thead {
            background-color: #e83e8c;
            color: #fff;
        }
        table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        table tbody tr:hover {
            background-color: #f1f1f1;
            transition: background-color 0.3s ease;
        }
        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }
         .back-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Passbook</h1>
        
        <!-- Form for account number input -->
        <form action="PassbookController" method="post">
            <div class="form-group">
                <label for="accountNumber">Enter Account Number:</label>
                <input type="text" id="accountNumber" name="accountNumber" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <!-- Table for displaying transactions -->
        <c:if test="${not empty transactions}">
            <h2 class="text-center mt-5">Transaction Details</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Sender Account</th>
                        <th>Receiver Account</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td>${transaction.date}</td>
                            <td>${transaction.type}</td>
                            <td>${transaction.senderAccount}</td>
                            <td>${transaction.receiverAccount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
     <div class="back-button">
                <a href="userDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
