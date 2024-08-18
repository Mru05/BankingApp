package com.techlabs.project;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewTransactionsController")
public class ViewTransactionsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Transaction> transactions = new ArrayList<>();
        
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");

        StringBuilder query = new StringBuilder(
            "SELECT account_number, transaction_type, amount, transaction_date, receiver_account_number FROM ("
            + "SELECT sender_account_number AS account_number, 'Transfer' AS transaction_type, amount, receiver_account_number, transaction_date FROM transactions"
            + " UNION ALL"
            + " SELECT account_number, transaction_type, amount, 'NA' AS receiver_account_number, transaction_date FROM transaction"
            + ") AS combined_transactions"
        );

        if (search != null && !search.trim().isEmpty()) {
            query.append(" WHERE account_number LIKE ? OR receiver_account_number LIKE ?");
        }

        if (sort != null && !sort.trim().isEmpty()) {
            switch (sort) {
                case "date_asc":
                    query.append(" ORDER BY transaction_date ASC");
                    break;
                case "date_desc":
                    query.append(" ORDER BY transaction_date DESC");
                    break;
                case "amount_asc":
                    query.append(" ORDER BY amount ASC");
                    break;
                case "amount_desc":
                    query.append(" ORDER BY amount DESC");
                    break;
                default:
                    break;
            }
        }

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC Driver Loaded.");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmvp", "root", "root");
            System.out.println("Database connected successfully.");

            PreparedStatement pstmt = conn.prepareStatement(query.toString());
            
            // Set parameters for search
            if (search != null && !search.trim().isEmpty()) {
                pstmt.setString(1, "%" + search + "%");
                pstmt.setString(2, "%" + search + "%");
            }

            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Transaction transaction = new Transaction(
                    rs.getString("account_number"),
                    rs.getString("transaction_type"),
                    rs.getDouble("amount"),
                    rs.getTimestamp("transaction_date"),
                    rs.getString("receiver_account_number")
                );
                transactions.add(transaction);
            }

            System.out.println("Number of transactions retrieved: " + transactions.size());

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("transactions", transactions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("transactions.jsp");
        dispatcher.forward(request, response);
    }
}
