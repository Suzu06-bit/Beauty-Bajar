package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.model.User;
import com.mycompany.beautybajar.dao.UserDAO;
import com.mycompany.beautybajar.util.PasswordUtil;
import com.mycompany.beautybajar.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // 1. Read form fields
        String fullName = req.getParameter("fullname");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // 2. Re-populate form fields on error (so user doesn't retype)
        req.setAttribute("fullname", fullName);
        req.setAttribute("username", username);
        req.setAttribute("email", email);
        req.setAttribute("phone", phone);
        req.setAttribute("address", address);

        // 3. Run all validation from ValidationUtil in one call
        String validationError = ValidationUtil.validateRegistration(
                fullName, username, email, phone, password, confirmPassword);

        if (validationError != null) {
            req.setAttribute("error", validationError);
            req.getRequestDispatcher("/views/register.jsp").forward(req, res);
            return;
        }

        // 4. Check uniqueness against database
        try {
            if (userDAO.getUserByUsername(username) != null) {
                req.setAttribute("error", "Username already taken. Please choose another.");
                req.getRequestDispatcher("/views/register.jsp").forward(req, res);
                return;
            }
            if (userDAO.getUserByEmail(email) != null) {
                req.setAttribute("error", "An account with this email already exists.");
                req.getRequestDispatcher("/views/register.jsp").forward(req, res);
                return;
            }
            if (userDAO.getUserByPhone(phone) != null) {
                req.setAttribute("error", "An account with this phone number already exists.");
                req.getRequestDispatcher("/views/register.jsp").forward(req, res);
                return;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            req.setAttribute("error", "Registration failed. Please try again.");
            req.getRequestDispatcher("/views/register.jsp").forward(req, res);
            return;
        }

        // 5. Build User object and save to database
        User user = new User();
        user.setFullName(fullName.trim());
        user.setUsername(username.trim());
        user.setEmail(email.trim());
        user.setPhone(phone.trim());
        user.setAddress(address != null ? address.trim() : "");
        user.setPassword(PasswordUtil.hashPassword(password));
        user.setRole("user");

        try {
            if (userDAO.insertUser(user)) {
                res.sendRedirect(req.getContextPath() + "/login?registered=true");
            } else {
                req.setAttribute("error", "Registration failed. Please try again.");
                req.getRequestDispatcher("/views/register.jsp").forward(req, res);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            req.setAttribute("error", "Registration failed. Please try again.");
            req.getRequestDispatcher("/views/register.jsp").forward(req, res);
        }
    }
}
