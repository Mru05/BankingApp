<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Password</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #282c34, #4568DC); /* Navy Blue to Purple Gradient */
            font-family: 'Arial', sans-serif;
            padding: 20px;
            transition: background 0.5s ease;
        }

        h2 {
            color: #fff; /* White text for contrast */
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Add text shadow */
        }

        .container {
            margin-top: 50px;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
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

        .btn-custom {
            background: linear-gradient(135deg, #282c34, #4568DC); /* Navy Blue to Purple Gradient */
            border: none;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
            color: #fff; /* White text for contrast */
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #4568DC, #282c34); /* Reverse Gradient on hover */
            transform: scale(1.05);
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
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Password</h2>
        <form action="EditPasswordController" method="post">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <button type="submit" class="btn btn-custom btn-block">Update Password</button>
        </form>
    </div>

    <!-- Bootstrap Modal for Pop-ups -->
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">
                        <%
                            String messageType = (String) request.getAttribute("messageType");
                            if (messageType != null && messageType.equals("success")) {
                                out.print("Success");
                            } else {
                                out.print("Error");
                            }
                        %>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%= request.getAttribute("message") %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Script to Automatically Show Modal -->
    <script>
        $(document).ready(function() {
            <% if (request.getAttribute("message") != null) { %>
                $('#messageModal').modal('show');
            <% } %>
        });
    </script>
    <div class="back-button">
        <a href="userDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</body>
</html>