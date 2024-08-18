<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Result</title>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var message = '<%= request.getAttribute("message") %>';
            var messageType = '<%= request.getAttribute("messageType") %>';

            if (messageType === "success") {
                Swal.fire({
                    title: 'Success!',
                    text: message,
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) === {
                    if (result.isConfirmed) {
                        window.location.href = "addCustomer.jsp"; // Redirect to your desired page
                    }
                });
            } else if (messageType === "error") {
                Swal.fire({
                    title: 'Error!',
                    text: message,
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    </script>
</body>
</html>
