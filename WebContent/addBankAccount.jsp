<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Bank Account</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #fbe8eb, #f9e5f0);
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
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
        .btn-custom {
            background-color: #b95c8a;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-custom:hover {
            background-color: #a04a6e;
            transform: scale(1.05);
        }
        .form-control:focus {
            border-color: #b95c8a;
            box-shadow: 0 0 5px rgba(185, 92, 138, 0.5);
        }
         .back-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Add Bank Account
            </div>
            <div class="card-body">
                <form action="AddBankAccountController" method="post">
                    <div class="form-group">
                        <label for="customerId">Customer ID:</label>
                        <input type="text" class="form-control" id="customerId" name="customerId" required>
                    </div>

                    <div class="form-group">
                        <label for="accountType">Account Type:</label>
                        <select class="form-control" id="accountType" name="accountType" required>
                            <option value="Savings">Savings</option>
                            <option value="Current">Current</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="accountNumber">Account Number:</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="accountNumber" name="accountNumber" readonly>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-custom" onclick="generateAccountNumber()">Generate</button>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="balance">Initial Balance:</label>
                        <input type="number" class="form-control" id="balance" name="balance" required>
                    </div>

                    <button type="submit" class="btn btn-custom btn-block">Create Account</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Account created successfully!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Error Modal -->
    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="errorModalLabel">Error</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="errorMessage">
                    <!-- Error message will be injected here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function generateAccountNumber() {
            var accountNumber = '';
            for (var i = 0; i < 12; i++) {
                accountNumber += Math.floor(Math.random() * 10);
            }
            document.getElementById("accountNumber").value = accountNumber;
        }

        document.addEventListener('DOMContentLoaded', function() {
            // Get URL parameters
            const urlParams = new URLSearchParams(window.location.search);

            // Check for success or error message
            if (urlParams.has('success')) {
                $('#successModal').modal('show');
            } else if (urlParams.has('error')) {
                document.getElementById('errorMessage').innerText = urlParams.get('error');
                $('#errorModal').modal('show');
            }
        });
    </script>
      <div class="back-button">
                <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
</body>
</html>
