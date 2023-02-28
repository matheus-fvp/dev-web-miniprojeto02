package database;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author vieir
 */
public class DB {
    
    private static Connection conn = null; 
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost/lanchonete";
    private static String user = "root";
    private static String password = "123456";
    
    public static Connection getConnection() {
        if(conn == null) {
            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(url, user, password);
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            } catch (ClassNotFoundException ex) {
                System.err.println(ex.getMessage());
            }
            
        }
        return conn;
    }
    
    public static void closeConnection() {
        if(conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }
    
    /*public static Properties loadProperties() {
        Properties props = null;
        try(FileInputStream fs = new FileInputStream("../db.properties")) {
            props = new Properties();
            props.load(fs);
        }catch(IOException e) {
            System.err.println(e.getMessage());
        }
        return props;
    }*/
    
}
