<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Form</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #fbe8eb, #f9e5f0);
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h1 {
            color: #b95c8a;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #b95c8a;
            border: none;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #a04a6e;
            transform: scale(1.05);
        }
        .alert {
            display: none;
        }
         .back-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Transaction Form</h1>
        <form action="TransactionController" method="post">
            <div class="form-group">
                <label for="transactionType">Transaction Type:</label>
                <select id="transactionType" name="transactionType" class="form-control" required>
                    <option value="">Select Type</option>
                    <option value="credit">Credit</option>
                    <option value="debit">Debit</option>
                    <option value="transfer">Transfer</option>
                </select>
            </div>

            <div class="form-group">
                <label for="accountNumber">Account Number:</label>
                <input type="text" id="accountNumber" name="accountNumber" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" class="form-control" step="0.01" min="0" required>
            </div>

            <div id="transferFields" class="form-group" style="display:none;">
                <label for="receiverAccountNumber">Receiver Account Number:</label>
                <input type="text" id="receiverAccountNumber" name="receiverAccountNumber" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>

        <div id="messageContainer">
            <div class="alert alert-danger" id="errorMessage"></div>
            <div class="alert alert-success" id="successMessage"></div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById('transactionType').addEventListener('change', function() {
            var value = this.value;
            var transferFields = document.getElementById('transferFields');
            if (value === 'transfer') {
                transferFields.style.display = 'block';
            } else {
                transferFields.style.display = 'none';
            }
        });

        // Display messages if available
        <% 
            String error = (String) request.getAttribute("error");
            String message = (String) request.getAttribute("message");
            if (error != null) { 
        %>
            document.getElementById('errorMessage').innerText = "<%= error %>";
            document.getElementById('errorMessage').style.display = 'block';
        <% } 
            if (message != null) { 
        %>
            document.getElementById('successMessage').innerText = "<%= message %>";
            document.getElementById('successMessage').style.display = 'block';
        <% } %>
    </script>
      <div class="back-button">
                <a href="userDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
</body>
</html>
