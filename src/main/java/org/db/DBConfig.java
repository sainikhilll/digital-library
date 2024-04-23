package org.db;



import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
    static Connection connection;
    public static Connection getCon() {
        try {
            if(connection==null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "11716042");
                System.out.println("Connection made with DB");
            }
        } catch (Exception e) {
            System.out.println("Couldn't Connect With DB");
            e.printStackTrace();
        }
        return connection;
    }
}
