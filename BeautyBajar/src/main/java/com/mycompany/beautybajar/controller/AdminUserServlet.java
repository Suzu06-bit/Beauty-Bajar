package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO uDao = new UserDAO();
            // Pass null to get all users
            request.setAttribute("users", uDao.getAllUsers(null));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("users", new ArrayList<>());
        }
        request.getRequestDispatcher("/views/adminUsers.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDAO uDao = new UserDAO();
            uDao.deleteUser(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
