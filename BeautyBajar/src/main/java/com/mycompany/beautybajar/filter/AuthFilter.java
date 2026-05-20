package com.mycompany.beautybajar.filter;

import com.mycompany.beautybajar.util.SessionUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * AuthFilter — intercepts requests to protected URLs.
 *
 * Rules:
 *  • /admin/*  → must be logged in AND have role=admin
 *  • /cart, /order → must be logged in
 */
@WebFilter(urlPatterns = {"/admin/*", "/cart", "/order"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req = (HttpServletRequest)  request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getServletPath();

        if (path.startsWith("/admin")) {
            // Must be admin
            if (!SessionUtil.isAdmin(session)) {
                res.sendRedirect(req.getContextPath() + "/login");
                return;
            }
        } else {
            // Must be logged in
            if (!SessionUtil.isLoggedIn(session)) {
                res.sendRedirect(req.getContextPath() + "/login");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
