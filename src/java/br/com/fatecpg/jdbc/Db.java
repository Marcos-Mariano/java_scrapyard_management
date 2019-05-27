/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class Db {
    public static final String DRIVER = "org.apache.derby.jdbc.ClientDriver";
    public static final String URL = "jdbc:derby://localhost:1527/scrapyard";
    public static final String USER = "scrap";
    public static final String PASS = "scrap";
    
    public static Connection getConnection() throws Exception{
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL,USER,PASS);
    }
    
}
