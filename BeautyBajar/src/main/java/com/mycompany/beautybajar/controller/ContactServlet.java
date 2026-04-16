/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.beautybajar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Suzu♡
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    // ── GET: Show contact form ──
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/contact.jsp")
                .forward(request, response);
    }

    // ── POST: Handle contact form submission ──
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Server-side validation
        String error = null;

        if (name == null || name.trim().isEmpty()) {
            error = "Name is required.";
        } else if (email == null || email.trim().isEmpty()) {
            error = "Email is required.";
        } else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            error = "Please enter a valid email address.";
        } else if (subject == null || subject.trim().isEmpty()) {
            error = "Subject is required.";
        } else if (message == null || message.trim().isEmpty()) {
            error = "Message is required.";
        } else if (message.trim().length() < 10) {
            error = "Message must be at least 10 characters.";
        }

        if (error != null) {
            // Validation failed — send back to form with error + keep values
            request.setAttribute("error", error);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("subject", subject);
            request.setAttribute("message", message);
            request.getRequestDispatcher("/views/contact.jsp")
                    .forward(request, response);
        } else {
            // Success — in real app you would save to DB or send email
            // For now just show success message
            request.setAttribute("success",
                    "Thank you, " + name.trim() + "! Your message has been sent. "
                    + "We will get back to you within 24 hours.");
            request.getRequestDispatcher("/views/contact.jsp")
                    .forward(request, response);
        }
    }
}
