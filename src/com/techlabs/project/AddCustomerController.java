package com.techlabs.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCustomerController")
public class AddCustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String URL = "jdbc:mysql://localhost:3306/bankingmvp";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email_id = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            
            String sql = "INSERT INTO customers (first_name, last_name, email_id, password) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setString(3, email_id);
                pstmt.setString(4, password);  

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("addCustomer.jsp?success=true");
                } else {
                    response.sendRedirect("addCustomer.jsp?error=Failed to add customer.");
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("addCustomer.jsp?error=Driver class not found: " + e.getMessage());
        } catch (SQLException se) {
            se.printStackTrace();
            response.sendRedirect("addCustomer.jsp?error=SQL Error: " + se.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addCustomer.jsp?error=Error: " + e.getMessage());
        }
    }
}
