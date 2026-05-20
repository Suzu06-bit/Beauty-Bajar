package com.mycompany.beautybajar.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * PasswordUtil — Utility class for hashing and verifying passwords using BCrypt.
 * Wraps the jBCrypt library to provide a clean, reusable API for password security.
 * All passwords stored in the database must be hashed using this class —
 * plain-text passwords are never stored.
 *
 */
public class PasswordUtil {

    /**
     * Hashes a plain-text password using the BCrypt algorithm.
     * BCrypt automatically generates a random salt and embeds it in the resulting hash,
     * so the same password will produce a different hash on each call.
     * The returned hash is safe to store directly in the database.
     *
     * @param plainText the plain-text password entered by the user
     * @return a BCrypt hash string (e.g. {@code $2a$10$...}) ready to be stored
     */
    public static String hashPassword(String plainText) {
        return BCrypt.hashpw(plainText, BCrypt.gensalt());
    }

    /**
     * Verifies a plain-text password against a stored BCrypt hash.
     * BCrypt extracts the embedded salt from the hash, re-hashes the plain-text
     * with that salt, and compares the result to the stored hash.
     * Used during login to authenticate the user's entered password.
     *
     * @param plainText the plain-text password entered by the user at login
     * @param hashed    the BCrypt hash retrieved from the database for this user
     * @return {@code true} if the password matches the hash;
     *         {@code false} if the password is incorrect
     */
    public static boolean checkPassword(String plainText, String hashed) {
        return BCrypt.checkpw(plainText, hashed);
    }
}
