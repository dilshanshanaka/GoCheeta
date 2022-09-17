package com.gocheeta.web.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Dilshan
 */
public class DBUtil {

    private static Connection conn = null;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/gocheeta";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    public static Connection getInstance() {
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        } catch (SQLException ex) {
        }
        return conn;
    }
}
