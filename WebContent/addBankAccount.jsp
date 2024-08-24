<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Bank Account</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #4568DC, #B06AB3); /* Purple-Blue Gradient */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        .card {
            background: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            width: 100%;
            max-width: 500px;
            border: none;
            overflow: hidden;
            animation: slideInUp 0.5s ease-in-out;
        }

        .card-header {
            background: linear-gradient(135deg, #4568DC, #B06AB3); /* Matching Gradient */
            color: #fff;
            text-align: center;
            font-size: 1.8rem;
            font-weight: bold;
            padding: 1.5rem;
        }

        .card-body {
            padding: 2.5rem;
            background: #f0f2f5; /* Light background */
        }

        .form-group label {
            font-weight: bold;
            color: #333; 
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #ddd; 
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #4568DC; 
            box-shadow: 0 0 8px rgba(69, 104, 220, 0.5);
        }

        .btn-custom {
            background: linear-gradient(135deg, #4568DC, #B06AB3); 
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-size: 1.1rem;
            color: #fff;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #B06AB3, #4568DC); 
            transform: scale(1.05);
        }

        .input-group-append .btn-custom {
            width: auto;
            margin-left: -1px;
        }

        /* Modal Styling (Keep similar to your dashboard) */
        .modal-header {
            background: linear-gradient(135deg, #4568DC, #B06AB3);
            color: #fff;
        }

        .modal-footer .btn-primary {
            background: linear-gradient(135deg, #4568DC, #B06AB3);
            border: none;
        }

        .back-button {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
        }

        .back-button a {
            color: #fff;
            background: linear-gradient(135deg, #4568DC, #B06AB3);
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background: linear-gradient(135deg, #B06AB3, #4568DC);
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

    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
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
                        <span aria-hidden="true">×</span>
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
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>