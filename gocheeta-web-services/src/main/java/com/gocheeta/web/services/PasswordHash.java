package com.gocheeta.web.services;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Dilshan
 */
public class PasswordHash {

    public String convertToMD5(String password) {
        try {
            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] messageDigest = md.digest(password.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);

            // convert to hex value
            String hashPassword = no.toString(16);
            while (hashPassword.length() < 32) {
                hashPassword = "0" + hashPassword;
            }
            return hashPassword;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
