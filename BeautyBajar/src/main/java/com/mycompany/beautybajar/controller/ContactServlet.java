package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * ContactServlet — shows the contact form (GET) and processes submission (POST).
 */
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/contact.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String name    = req.getParameter("name");
        String email   = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        // Re-populate fields
        req.setAttribute("name",    name);
        req.setAttribute("email",   email);
        req.setAttribute("subject", subject);
        req.setAttribute("message", message);

        // Validation
        if (ValidationUtil.isEmpty(name) || ValidationUtil.isEmpty(email)
                || ValidationUtil.isEmpty(subject) || ValidationUtil.isEmpty(message)) {
            req.setAttribute("error", "All required fields must be filled in.");
            req.getRequestDispatcher("/views/contact.jsp").forward(req, res); return;
        }
        if (!ValidationUtil.isValidEmail(email)) {
            req.setAttribute("error", "Please enter a valid email address.");
            req.getRequestDispatcher("/views/contact.jsp").forward(req, res); return;
        }
        if (message.trim().length() < 10) {
            req.setAttribute("error", "Message must be at least 10 characters.");
            req.getRequestDispatcher("/views/contact.jsp").forward(req, res); return;
        }

        // In a real system, you would send an email or save to DB here.
        req.setAttribute("success", "Thank you! Your message has been received. We will reply within 24 hours.");
        req.getRequestDispatcher("/views/contact.jsp").forward(req, res);
    }
}
