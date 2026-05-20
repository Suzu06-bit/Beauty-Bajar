package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.UserDAO;
import com.mycompany.beautybajar.model.User;
import com.mycompany.beautybajar.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (!SessionUtil.isLoggedIn(session)) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int userId = SessionUtil.getUserId(session);
        User user = userDAO.getUserById(userId);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/profile.jsp").forward(req, res);
    }
}