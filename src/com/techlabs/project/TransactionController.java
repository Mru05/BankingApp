package com.techlabs.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC driver not found.", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String transactionType = request.getParameter("transactionType");
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String amountStr = request.getParameter("amount");
        String receiverAccountNumber = request.getParameter("receiverAccountNumber");

        double amount = 0;
        try {
            amount = Double.parseDouble(amountStr);
            if (amount <= 0) {
                throw new NumberFormatException("Amount must be positive.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid amount: " + e.getMessage());
            request.getRequestDispatcher("TransactionPage.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmvp", "root", "root")) {
            // Verify password
            if (!verifyPassword(conn, accountNumber, password)) {
                request.setAttribute("error", "Invalid password.");
                request.getRequestDispatcher("TransactionPage.jsp").forward(request, response);
                return;
            }

            conn.setAutoCommit(false);

            if ("transfer".equals(transactionType)) {
                if (receiverAccountNumber.equals(accountNumber)) {
                    request.setAttribute("error", "Self-transfer is not allowed.");
                    request.getRequestDispatcher("TransactionPage.jsp").forward(request, response);
                    return;
                }
                if (!performDebit(conn, accountNumber, amount)) {
                    conn.rollback();
                    request.setAttribute("error", "Insufficient balance for transfer.");
                    request.getRequestDispatcher("transaction.jsp").forward(request, response);
                    return;
                }
                performCredit(conn, receiverAccountNumber, amount);
                logTransfer(conn, accountNumber, receiverAccountNumber, amount);
            } else if ("credit".equals(transactionType)) {
                performCredit(conn, accountNumber, amount);
                logCreditDebitTransaction(conn, accountNumber, "credit", amount);
            } else if ("debit".equals(transactionType)) {
                if (!performDebit(conn, accountNumber, amount)) {
                    conn.rollback();
                    request.setAttribute("error", "Insufficient balance.");
                    request.getRequestDispatcher("TransactionPage.jsp").forward(request, response);
                    return;
                }
                logCreditDebitTransaction(conn, accountNumber, "debit", amount);
            } else {
                request.setAttribute("error", "Invalid transaction type.");
                request.getRequestDispatcher("TransactionPage.jsp").forward(request, response);
                return;
            }

            conn.commit();
            request.setAttribute("message", "Transaction successful.");
            request.getRequestDispatcher("TransactionPage.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                response.getWriter().println("Database error: " + e.getMessage());
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        }
    }

    private boolean verifyPassword(Connection conn, String accountNumber, String password) throws SQLException {
        String query = "SELECT password FROM customers JOIN bank_accounts ON customers.customer_id = bank_accounts.customer_id WHERE bank_accounts.account_number = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, accountNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return password.equals(rs.getString("password"));
                }
                return false;
            }
        }
    }

    private boolean performDebit(Connection conn, String accountNumber, double amount) throws SQLException {
        String query = "UPDATE bank_accounts SET balance = balance - ? WHERE account_number = ? AND balance >= ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setDouble(1, amount);
            stmt.setString(2, accountNumber);
            stmt.setDouble(3, amount);
            return stmt.executeUpdate() > 0;
        }
    }

    private void performCredit(Connection conn, String accountNumber, double amount) throws SQLException {
        String query = "UPDATE bank_accounts SET balance = balance + ? WHERE account_number = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setDouble(1, amount);
            stmt.setString(2, accountNumber);
            stmt.executeUpdate();
        }
    }

    private void logTransfer(Connection conn, String senderAccountNumber, String receiverAccountNumber, double amount) throws SQLException {
        String query = "INSERT INTO transactions (sender_account_number, receiver_account_number, amount, type_of_transfer) VALUES (?, ?, ?, 'transfer')";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, senderAccountNumber);
            stmt.setString(2, receiverAccountNumber);
            stmt.setDouble(3, amount);
            stmt.executeUpdate();
        }
    }

    private void logCreditDebitTransaction(Connection conn, String accountNumber, String type, double amount) throws SQLException {
        String query = "INSERT INTO transaction (account_number, transaction_type, amount) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, accountNumber);
            stmt.setString(2, type);
            stmt.setDouble(3, amount);
            stmt.executeUpdate();
        }
    }
}
