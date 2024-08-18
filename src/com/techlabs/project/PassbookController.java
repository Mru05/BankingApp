package com.techlabs.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PassbookController")
public class PassbookController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found.", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        List<Transaction> transactions = new ArrayList<>();
        
        String jdbcURL = "jdbc:mysql://localhost:3306/bankingmvp";
        String jdbcUsername = "root";
        String jdbcPassword = "root";
        
        String query = "SELECT t.transaction_date AS date, t.transaction_type AS type, " +
                       "'N/A' AS sender_account, 'N/A' AS receiver_account " +
                       "FROM transaction t " +
                       "WHERE t.account_number = ? " +
                       "UNION ALL " +
                       "SELECT ts.transaction_date AS date, ts.type_of_transfer AS type, " +
                       "ts.sender_account_number AS sender_account, ts.receiver_account_number AS receiver_account " +
                       "FROM transactions ts " +
                       "WHERE ts.sender_account_number = ? OR ts.receiver_account_number = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setString(1, accountNumber);
            preparedStatement.setString(2, accountNumber);
            preparedStatement.setString(3, accountNumber);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                String date = resultSet.getString("date");
                String type = resultSet.getString("type");
                String senderAccount = resultSet.getString("sender_account");
                String receiverAccount = resultSet.getString("receiver_account");

                transactions.add(new Transaction(date, type, senderAccount, receiverAccount));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database access error: " + e.getMessage(), e);
        }
        
        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("passbook.jsp").forward(request, response);
    }

    public static class Transaction {
        private String date;
        private String type;
        private String senderAccount;
        private String receiverAccount;

        public Transaction(String date, String type, String senderAccount, String receiverAccount) {
            this.date = date;
            this.type = type;
            this.senderAccount = senderAccount;
            this.receiverAccount = receiverAccount;
        }

        public String getDate() {
            return date;
        }

        public String getType() {
            return type;
        }

        public String getSenderAccount() {
            return senderAccount;
        }

        public String getReceiverAccount() {
            return receiverAccount;
        }
    }
}
