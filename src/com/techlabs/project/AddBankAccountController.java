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

@WebServlet("/AddBankAccountController")
public class AddBankAccountController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankingmvp";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        String accountType = request.getParameter("accountType");
        String accountNumber = request.getParameter("accountNumber");
        String balance = request.getParameter("balance");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "INSERT INTO bank_accounts (customer_id, account_type, account_number, balance) VALUES (?, ?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, customerId);
                    pstmt.setString(2, accountType);
                    pstmt.setString(3, accountNumber);
                    pstmt.setString(4, balance);

                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("addBankAccount.jsp?success=true");
                    } else {
                        response.sendRedirect("addBankAccount.jsp?error=Failed to create account. Please try again.");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addBankAccount.jsp?error=An error occurred: " + e.getMessage());
        }
    }
}
