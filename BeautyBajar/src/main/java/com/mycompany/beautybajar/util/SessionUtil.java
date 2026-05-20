package com.mycompany.beautybajar.util;

import com.mycompany.beautybajar.model.User;
import jakarta.servlet.http.HttpSession;
/**
 * SessionUtil — Utility class for managing HTTP session attributes.
 * Provides a centralised API for storing, reading, and clearing session data
 * so that session attribute keys are consistent across all servlets and JSPs.
 * All methods are static — no instantiation required.
 *
 */
public class SessionUtil {
/**
     * Stores the logged-in user's key details as individual session attributes.
     * Saves userId, username, fullName, role, and an initial cartCount of 0.
     * Called immediately after successful login in {@link LoginServlet}.
     *
     * @param session the current {@link HttpSession} to store attributes in
     * @param user    the authenticated {@link User} object whose details to store
     */
    public static void setUser(HttpSession session, User user) {
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("username", user.getUsername());
        session.setAttribute("fullName", user.getFullName());
        session.setAttribute("role", user.getRole());
        session.setAttribute("cartCount", 0);
    }

    /**
     * Checks whether a valid login session currently exists.
     * Verifies that the session is not null and contains a userId attribute.
     * Used as a guard in every servlet to redirect unauthenticated users to login.
     *
     * @param session the {@link HttpSession} to check; may be {@code null}
     * @return {@code true} if the session is valid and a userId is present;
     *         {@code false} otherwise
     */
    public static boolean isLoggedIn(HttpSession session) {
        return session != null && session.getAttribute("userId") != null;
    }
/**
     * Checks whether the currently logged-in user has the admin role.
     * Returns {@code true} only if the user is logged in AND their role is "admin".
     * Used to protect admin-only routes from regular users.
     *
     * @param session the {@link HttpSession} to check
     * @return {@code true} if the user is logged in and has the admin role;
     *         {@code false} otherwise
     */
    public static boolean isAdmin(HttpSession session) {
        return isLoggedIn(session) && "admin".equals(session.getAttribute("role"));
    }
/**
     * Safely retrieves the logged-in user's ID from the session.
     * Returns a sentinel value of {@code -1} if the session is invalid,
     * allowing callers to handle the unauthenticated case cleanly.
     *
     * @param session the {@link HttpSession} to read from
     * @return the userId as an {@code int} if logged in; {@code -1} otherwise
     */
    public static int getUserId(HttpSession session) {
        if (!isLoggedIn(session)) {
            return -1;
        }
        return (int) session.getAttribute("userId");
    }
/**
     * Invalidates the current session, logging the user out completely.
     * Destroys all stored session attributes including userId, role, and cartCount.
     * Called by {@link LogoutServlet} when the user clicks the logout button.
     *
     * @param session the {@link HttpSession} to invalidate; safely handles {@code null}
     */
    public static void logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
    }
}
