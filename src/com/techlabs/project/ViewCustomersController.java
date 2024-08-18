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

@WebServlet("/ViewCustomersController")
public class ViewCustomersController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        String searchTerm = request.getParameter("search");
        String sortBy = request.getParameter("sortBy");
        
        // Default query
        String query = "SELECT * FROM customers";
        List<String> conditions = new ArrayList<>();
        List<String> orderBy = new ArrayList<>();
        
        // Add search conditions
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            conditions.add("(first_name LIKE ? OR last_name LIKE ? OR email_id LIKE ?)");
        }

        // Add sorting
        if (sortBy != null && !sortBy.trim().isEmpty()) {
            orderBy.add(sortBy);
        }

        // Construct final query
        if (!conditions.isEmpty()) {
            query += " WHERE " + String.join(" AND ", conditions);
        }
        if (!orderBy.isEmpty()) {
            query += " ORDER BY " + String.join(", ", orderBy);
        }

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC Driver Loaded.");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmvp", "root", "root");
            System.out.println("Database connected successfully.");

            PreparedStatement pstmt = conn.prepareStatement(query);
            
            int index = 1;
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                String searchPattern = "%" + searchTerm + "%";
                pstmt.setString(index++, searchPattern);
                pstmt.setString(index++, searchPattern);
                pstmt.setString(index++, searchPattern);
            }

            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Customer customer = new Customer(
                    rs.getInt("customer_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email_id")
                );
                customers.add(customer);
            }

            System.out.println("Number of customers retrieved: " + customers.size());

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewCustomers.jsp");
        dispatcher.forward(request, response);
    }
}
