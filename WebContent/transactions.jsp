<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background: linear-gradient(135deg, #fbe8eb, #f9e5f0);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #b95c8a;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-transactions {
            text-align: center;
            color: #777;
            font-size: 1.2rem;
        }
        .search-bar, .sort-dropdown, .view-button {
            margin-bottom: 20px;
        }
         .back-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Transaction List</h2>

    <!-- Search and Sort Form -->
    <form action="ViewTransactionsController" method="get" class="search-bar">
        <div class="form-group">
            <input type="text" name="search" placeholder="Search by account number or receiver" class="form-control" value="${param.search}">
        </div>
        <div class="form-group">
            <label for="sort">Sort by:</label>
            <select name="sort" id="sort" class="form-control">
                <option value="">-- Select Sorting Option --</option>
                <option value="date_asc" ${param.sort == 'date_asc' ? 'selected' : ''}>Date Ascending</option>
                <option value="date_desc" ${param.sort == 'date_desc' ? 'selected' : ''}>Date Descending</option>
                <option value="amount_asc" ${param.sort == 'amount_asc' ? 'selected' : ''}>Amount Ascending</option>
                <option value="amount_desc" ${param.sort == 'amount_desc' ? 'selected' : ''}>Amount Descending</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary view-button">View Transactions</button>
    </form>

    <!-- Transactions Table -->
    <c:if test="${empty transactions}">
        <p class="no-transactions">No transactions found.</p>
    </c:if>

    <c:if test="${not empty transactions}">
        <table class="table">
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Transaction Type</th>
                    <th>Amount</th>
                    <th>Receiver Account Number</th>
                    <th>Transaction Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="transaction" items="${transactions}">
                    <tr>
                        <td>${transaction.accountNumber}</td>
                        <td>${transaction.transactionType}</td>
                        <td>${transaction.amount}</td>
                        <td>${transaction.receiverAccountNumber}</td>
                        <td>${transaction.transactionDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>s
</body>
</html>
