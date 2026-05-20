package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.ProductDAO;
import com.mycompany.beautybajar.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * HomeServlet — loads featured products and forwards to the home page.
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            req.setAttribute("featuredProducts", productDAO.getFeaturedProducts());
        } catch (Exception ex) {
            System.getLogger(HomeServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
        req.getRequestDispatcher("/index.jsp").forward(req, res);
    }
}
