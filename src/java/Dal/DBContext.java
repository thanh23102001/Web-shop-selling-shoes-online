/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class DBContext {
     protected Connection connection;
    public DBContext()
    {
        try {
//            Nguyet PC
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShoeStore";
//            String user = "sa";
//            String pass = "12345678";

//          HuyPC
            String url = "jdbc:sqlserver://LAPTOP-O6GO6FK6\\SQLEXPRESS:1433;databaseName=ShoeStore";
            String user = "sa";
            String pass = "huy";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
