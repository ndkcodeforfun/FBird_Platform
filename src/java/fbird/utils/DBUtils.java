/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author louis
 */
public class DBUtils {
    private static final String userName="bridtradingfood1_SQLLogin_1";
    private static final String password="gj6u9lboq5";
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = ("jdbc:sqlserver://BirdFood.mssql.somee.com:1433;databaseName=BirdFood");
        conn = DriverManager.getConnection(url,userName,password);
        return conn;
    }
}
