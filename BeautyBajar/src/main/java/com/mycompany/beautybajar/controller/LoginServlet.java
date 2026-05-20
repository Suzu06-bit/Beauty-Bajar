package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.model.User;
import com.mycompany.beautybajar.dao.UserDAO;
import com.mycompany.beautybajar.util.PasswordUtil;
import com.mycompany.beautybajar.util.SessionUtil;
import com.mycompany.beautybajar.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * LoginServlet — handles GET (show form) and POST (process login).
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // If already logged in, redirect appropriately
        HttpSession session = req.getSession(false);
        if (SessionUtil.isLoggedIn(session)) {
            if (SessionUtil.isAdmin(session)) {
                res.sendRedirect(req.getContextPath() + "/admin/dashboard");
            } else {
                res.sendRedirect(req.getContextPath() + "/home");
            }
            return;
        }
        req.getRequestDispatcher("/views/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Basic validation
        if (ValidationUtil.isEmpty(username) || ValidationUtil.isEmpty(password)) {
            req.setAttribute("error", "Username and password are required.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, res);
            return;
        }

        User user;
        user = userDAO.getUserByUsername(username.trim());
        if (user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
        } else {
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, res);
            return;
        }

        // Success — create session
        HttpSession session = req.getSession(true);
        SessionUtil.setUser(session, user);

        if (SessionUtil.isAdmin(session)) {
            res.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else {
            res.sendRedirect(req.getContextPath() + "/home");
        }
    }
}
