/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class User {
    private long id;
    private String role;
    private String name;
    private String login;
    private String passwordHash;
    
        public static User getUser(String login, String password) throws Exception{
        Connection con = Db.getConnection();
        String SQL = "select * from USUARIOS where LOGIN=? and PASSWORD=?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, login);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();
        
        if(rs.next()){
            return new User(
                    rs.getInt("ID"),
                    rs.getString("ROLE"),
                    rs.getString("NAME"), 
                    rs.getString("LOGIN"),
                    rs.getString("PASSWORD"));
        }
        
        else{
            return null;
        }
    }

    public User(long id, String role, String name, String login, String passwordHash) {
        this.id = id;
        this.role = role;
        this.name = name;
        this.login = login;
        this.passwordHash = passwordHash;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }
}
