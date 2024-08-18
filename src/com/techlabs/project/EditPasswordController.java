package com.techlabs.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditPasswordController")
public class EditPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String newPassword = request.getParameter("newPassword");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmvp", "root", "root");

            // Query to check if the first and last name match
            String query = "SELECT * FROM customers WHERE first_name = ? AND last_name = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // If the match is found, update the password
                String updateQuery = "UPDATE customers SET password = ? WHERE first_name = ? AND last_name = ?";
                stmt = conn.prepareStatement(updateQuery);
                stmt.setString(1, newPassword);
                stmt.setString(2, firstName);
                stmt.setString(3, lastName);
                stmt.executeUpdate();

                // Redirect to the edit page with a success message
                response.sendRedirect("edit.jsp?status=success");
            } else {
                // No match found, redirect with error message
                response.sendRedirect("edit.jsp?status=nomatch");
            }
        } catch (Exception e) {
            // Log the exception and redirect with an error status
            e.printStackTrace();
            response.sendRedirect("edit.jsp?status=error");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
