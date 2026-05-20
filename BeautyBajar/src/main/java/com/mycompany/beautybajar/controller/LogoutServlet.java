package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.util.SessionUtil;
import com.mycompany.beautybajar.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * LogoutServlet — invalidates the session and redirects to login page.
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        SessionUtil.logout(req.getSession(false));
        res.sendRedirect(req.getContextPath() + "/login");
    }
}
