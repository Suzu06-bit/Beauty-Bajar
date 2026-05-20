package com.mycompany.beautybajar.util;
 
/**
 * ValidationUtil — Utility class providing reusable input validation methods.
 * Used across multiple servlets to validate form fields before processing.
 * All methods are static and stateless — no instantiation required.
 *
 */
public class ValidationUtil {
 /**
     * Checks whether a string value is null or blank (empty after trimming).
     * Used as a quick guard check before processing any form field.
     *
     * @param value the string to check
     * @return {@code true} if the string is null or blank; {@code false} otherwise
     */
    public static boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
 
    /**
     * Validates whether a string is a properly formatted email address.
     * Uses a regex pattern to check for the standard user@domain.tld format.
     * Prevents malformed email addresses from being saved to the database.
     *
     * @param email the email address string to validate
     * @return {@code true} if the email matches the valid format; {@code false} otherwise
     */
    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[\\w._%+\\-]+@[\\w.\\-]+\\.[a-zA-Z]{2,}$");
    }
 
     /**
     * Validates whether a full name contains only letters and spaces.
     * Rejects names containing numbers, symbols, or special characters.
     *
     * @param name the full name string to validate
     * @return {@code true} if the name contains only letters and spaces;
     *         {@code false} otherwise
     */
    public static boolean isValidName(String name) {
        return name != null && name.matches("^[a-zA-Z\\s]+$");
    }
 
    /**
     * Validates whether a phone number is exactly 10 digits (Nepal format).
     * Rejects phone numbers with letters, symbols, spaces, or incorrect length.
     *
     * @param phone the phone number string to validate
     * @return {@code true} if the phone number is exactly 10 digits;
     *         {@code false} otherwise
     */
    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("^[0-9]{10}$");
    }
 
    /**
     * Validates whether a password meets the minimum length requirement.
     * The minimum accepted password length is 6 characters.
     *
     * @param password the plain-text password string to validate
     * @return {@code true} if the password is at least 6 characters;
     *         {@code false} otherwise
     */
    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }
 
    /**
     * Validates whether a price string represents a valid positive number.
     * Attempts to parse the string as a double and checks it is greater than zero.
     *
     * @param price the price string to validate (e.g. "1450.00")
     * @return {@code true} if the string is a valid positive number;
     *         {@code false} if it is not a number or is zero/negative
     */
    public static boolean isValidPrice(String price) {
        try {
            return Double.parseDouble(price) > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }
 
    /**
     * Validates all registration form fields in sequence and returns
     * the first error message found, or {@code null} if all fields are valid.
     * Used in RegisterServlet to validate the entire form in a single call
     * before attempting to insert the user into the database.
     *
     * @param fullName        the user's full name from the registration form
     * @param username        the chosen username
     * @param email           the user's email address
     * @param phone           the user's 10-digit phone number
     * @param password        the chosen password
     * @param confirmPassword the repeated password for confirmation
     * @return an error message string describing the first validation failure;
     *         {@code null} if all fields pass validation
     */
    public static String validateRegistration(String fullName, String username,
            String email, String phone, String password, String confirmPassword) {
 
        // 1. Check required fields are not empty
        if (isEmpty(fullName) || isEmpty(username) || isEmpty(email)
                || isEmpty(phone) || isEmpty(password)) {
            return "All required fields must be filled in.";
        }
 
        // 2. Full name — letters and spaces only
        if (!isValidName(fullName)) {
            return "Full name must contain only letters and spaces.";
        }
 
        // 3. Username — 3 to 20 characters, letters/numbers/underscores only
        if (!isValidUsername(username)) {
            return "Username must be 3–20 characters (letters, numbers, underscores only).";
        }
 
        // 4. Email format
        if (!isValidEmail(email)) {
            return "Please enter a valid email address.";
        }
 
        // 5. Phone — 10 digits
        if (!isValidPhone(phone)) {
            return "Phone number must be exactly 10 digits.";
        }
 
        // 6. Password — minimum 6 characters
        if (!isValidPassword(password)) {
            return "Password must be at least 6 characters.";
        }
 
        // 7. Confirm password matches
        if (!password.equals(confirmPassword)) {
            return "Passwords do not match.";
        }
 
        // All checks passed
        return null;
    }
 
      /**
     * Validates whether a username meets the required format rules.
     * Username must be between 3 and 20 characters and contain only
     * letters, numbers, and underscores (no spaces or special characters).
     *
     * @param username the username string to validate
     * @return {@code true} if the username matches the required format;
     *         {@code false} otherwise
     */
    public static boolean isValidUsername(String username) {
        return username != null && username.matches("^[a-zA-Z0-9_]{3,20}$");
    }
}