<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
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
        .button {
            padding: 10px 20px;
            background-color: #b95c8a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 1rem;
            margin: 10px 0;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #a04a6e;
        }
        .search-bar, .sort-by {
            margin: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-bar input {
            width: 300px;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .search-bar button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #b95c8a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .search-bar button:hover {
            background-color: #a04a6e;
        }
        .sort-by select {
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ddd;
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
        .no-customers {
            text-align: center;
            color: #777;
            font-size: 1.2rem;
        }
         .back-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Customer List</h2>

    <div class="search-bar">
        <form action="ViewCustomersController" method="get">
            <input type="text" name="search" placeholder="Search by name or email">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="sort-by">
        <form action="ViewCustomersController" method="get">
            <select name="sortBy" onchange="this.form.submit()">
                <option value="">Sort By</option>
                <option value="customer_id">Customer ID</option>
                <option value="first_name">First Name</option>
                <option value="last_name">Last Name</option>
                <option value="email_id">Email ID</option>
            </select>
        </form>
    </div>

    <c:if test="${empty customers}">
        <p class="no-customers">No customers found.</p>
    </c:if>

    <c:if test="${not empty customers}">
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email ID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.customer_id}</td>
                        <td>${customer.first_name}</td>
                        <td>${customer.last_name}</td>
                        <td>${customer.email_id}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
      <div class="back-button">
                <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
</body>
</html>
