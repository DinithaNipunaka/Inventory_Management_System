package models;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ims";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    // Static method to get a database connection
    public static Connection dbConn() throws ClassNotFoundException, Exception {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish and return the connection
        Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        return connection;
    }
}
