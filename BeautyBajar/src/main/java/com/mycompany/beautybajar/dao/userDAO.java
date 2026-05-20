package com.mycompany.beautybajar.dao;

import com.mycompany.beautybajar.model.User;
import com.mycompany.beautybajar.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO — Data Access Object for all database operations on the users table.
 * Provides methods to insert, retrieve, update, and delete user records.
 * All database connections are obtained via {@link DBConnection#getConnection()}.
 **/
public class UserDAO {

    /**
     * Inserts a new user record into the users table.
     * The role is automatically set to "user" regardless of the User object's role field,
     * ensuring no one can register as admin through the normal registration flow.
     *
     * @param user the {@link User} object containing fullName, username, email,
     *             password , phone, and address
     * @return {@code true} if the record was inserted successfully;
     *         {@code false} if a database error occurred
     */
    public boolean insertUser(User user) {
        String sql = "INSERT INTO users (full_name, username, email, password, phone, address, role) VALUES (?,?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAddress());
            ps.setString(7, "user");  // new registrations are always "user" role
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
/**
     * Retrieves a single user record by their username.
     * Used during login to fetch the stored BCrypt hash for password verification.
     *
     * @param username the username to search for (case-sensitive)
     * @return the matching {@link User} object, or {@code null} if not found
     */
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Retrieves a single user record by their email address.
     * Used during registration to check for duplicate emails before inserting.
     *
     * @param email the email address to search for
     * @return the matching {@link User} object, or {@code null} if not found
     */
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Retrieves a single user record by their phone number.
     * Used during registration to check for duplicate phone numbers.
     *
     * @param phone the 10-digit phone number to search for
     * @return the matching {@link User} object, or {@code null} if not found
     */
    public User getUserByPhone(String phone) {
        String sql = "SELECT * FROM users WHERE phone = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Retrieves a user record by their unique user ID.
     * Used on the profile page to load full user details from the session's stored userId.
     *
     * @param userId the primary key of the user to retrieve
     * @return the matching {@link User} object, or {@code null} if not found
     */
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

   /**
     * Retrieves all users from the database, with optional search filtering.
     * If a non-empty search string is provided, filters by username or email using LIKE.
     * Used by the admin user management panel.
     *
     * @param search the search keyword to filter by username or email;
     *               pass {@code null} or empty string to return all users
     * @return a {@link List} of {@link User} objects matching the criteria;
     *         returns an empty list if no users are found
     */
    public List<User> getAllUsers(String search) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users";
        if (search != null && !search.trim().isEmpty()) {
            sql += " WHERE username LIKE ? OR email LIKE ?";
        }
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            if (search != null && !search.trim().isEmpty()) {
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Deletes a user record from the database by their user ID.
     * Due to the ON DELETE CASCADE foreign key on the orders table,
     * all orders belonging to this user are also deleted automatically.
     *
     * @param userId the primary key of the user to delete
     * @return {@code true} if the record was deleted successfully;
     *         {@code false} if no record was found or a database error occurred
     */
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Returns the total number of registered users in the database.
     * Used to display the user count stat card on the admin dashboard.
     *
     * @return the total count of users as an {@code int};
     *         returns {@code 0} if a database error occurs
     */
    public int countUsers() {
        String sql = "SELECT COUNT(*) FROM users";
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Maps a single row from a {@link ResultSet} to a {@link User} object.
     * Called internally by all retrieval methods to avoid code duplication.
     *
     * @param rs the {@link ResultSet} positioned at the row to map
     * @return a populated {@link User} object
     * @throws SQLException if any column cannot be read from the ResultSet
     */
    private User mapRow(ResultSet rs) throws SQLException {
        User u = new User();
        u.setUserId(rs.getInt("user_id"));
        u.setFullName(rs.getString("full_name"));
        u.setUsername(rs.getString("username"));
        u.setEmail(rs.getString("email"));
        u.setPassword(rs.getString("password"));
        u.setPhone(rs.getString("phone"));
        u.setAddress(rs.getString("address"));
        u.setRole(rs.getString("role"));
        return u;
    }

}
