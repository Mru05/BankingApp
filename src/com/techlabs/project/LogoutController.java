package com.techlabs.project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the current session
        HttpSession session = request.getSession(false); // Fetch session if exists, do not create new
        if (session != null) {
            session.invalidate(); // Invalidate session
        }
        // Redirect to the login page or homepage
        response.sendRedirect("Login.jsp");
    }
}
