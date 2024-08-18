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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String URL = "jdbc:mysql://localhost:3306/bankingmvp";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String loginAs = request.getParameter("loginAs");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
                if ("Admin".equals(loginAs)) {
                    String sql = "SELECT * FROM admin_credentials WHERE username = ? AND password = ?";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, username);
                        pstmt.setString(2, password);
                        try (ResultSet rs = pstmt.executeQuery()) {
                            if (rs.next()) {
                                // Successful admin login
                                response.sendRedirect("adminDashboard.jsp");
                                return; // Stop further processing
                            } else {
                                // Failed admin login
                                response.sendRedirect("login.jsp?error=true");
                                return; // Stop further processing
                            }
                        }
                    }
                } else if ("User".equals(loginAs)) {
                    String sql = "SELECT * FROM customers WHERE email_id = ? AND password = ?";
                    try (PreparedStatement statement = conn.prepareStatement(sql)) {
                        statement.setString(1, username);
                        statement.setString(2, password);
                        try (ResultSet resultSet = statement.executeQuery()) {
                            if (resultSet.next()) {
                                // Successful user login
                                HttpSession session = request.getSession();
                                session.setAttribute("username", username);
                                response.sendRedirect("userDashboard.jsp");
                                return; // Stop further processing
                            } else {
                                // Failed user login
                                response.sendRedirect("login.jsp?error=true");
                                return; // Stop further processing
                            }
                        }
                    }
                } else {
                    // Invalid login type
                    response.sendRedirect("login.jsp?error=true");
                    return; // Stop further processing
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
