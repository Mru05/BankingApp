package com.techlabs.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ViewTransactionsServlet")
public class ViewTransactionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String URL = "jdbc:mysql://localhost:3306/bankingmvp";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("customerId") != null) {
            int customerId = (Integer) session.getAttribute("customerId");

            // Database connection setup
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM transactions WHERE customer_id = ? ORDER BY transaction_date DESC")) {

                stmt.setInt(1, customerId);
                ResultSet rs = stmt.executeQuery();

                List<Transactions> transactions = new ArrayList<>();
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy"); // Define your date format

                while (rs.next()) {
                    Transactions transaction = new Transactions(
                        rs.getInt("id"),
                        rs.getInt("customer_id"),
                        rs.getDate("transaction_date"),
                        rs.getBigDecimal("amount"),
                        rs.getString("description")
                    );
                    transaction.setFormattedDate(sdf.format(transaction.getTransactionDate())); // Format date
                    transactions.add(transaction);
                }

                request.setAttribute("transactions", transactions);
                request.getRequestDispatcher("passbook.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                // Handle SQL exception
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
            }
        } else {
            // Redirect to login if session is not valid
            response.sendRedirect("Login.jsp");
        }
    }
}
