<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Form</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #282c34, #4568DC); /* Navy Blue to Purple Gradient */
            font-family: 'Arial', sans-serif;
            padding: 20px;
            transition: background 0.5s ease;
        }

        h1 {
            color: #fff; /* White text for contrast */
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: auto;
            transition: box-shadow 0.3s ease;
            animation: slideInUp 0.5s ease-in-out;
        }

        .form-group label {
            font-weight: bold;
            color: #fff; /* White for contrast */
        }

        .form-control {
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #4568DC; /* Purple Color for focus */
            box-shadow: 0 0 0 0.2rem rgba(69, 104, 220, 0.25);
        }

        .btn-primary {
            background: linear-gradient(135deg, #282c34, #4568DC); /* Navy Blue to Purple Gradient */
            border: none;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
            color: #fff; /* White text for contrast */
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4568DC, #282c34); /* Reverse Gradient on hover */
            transform: scale(1.05);
        }

        .alert {
            display: none;
        }

        .back-button {
            margin-top: 20px;
            text-align: center;
        }

        .back-button a {
            color: #fff;
            background: linear-gradient(135deg, #282c34, #4568DC); /* Navy Blue to Purple Gradient */
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            font-size: 1rem;
            display: inline-block;
        }

        .back-button a:hover {
            background: linear-gradient(135deg, #4568DC, #282c34); /* Reverse Gradient on hover */
        }

        /* Slide-in Animation */
        @keyframes slideInUp {
            0% {
                transform: translateY(100%);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
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