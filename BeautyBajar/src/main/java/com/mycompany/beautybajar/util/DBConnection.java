package com.mycompany.beautybajar.util;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
/**
 * DBConnection — provides a single static method to obtain a MySQL connection.
 * Update DB_URL, DB_USER, DB_PASS to match your XAMPP / MySQL setup.
 */
public class DBConnection {
 
    private static final String DB_URL  = "jdbc:mysql://localhost:3306/beauty_bajar?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";   // default XAMPP has no password
 
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }
 
    /**
     * Returns a new Connection. Caller is responsible for closing it.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }
}