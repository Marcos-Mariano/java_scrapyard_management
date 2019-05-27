/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class Cliente {

    private int id;
    private String nome;
    private static ArrayList<Cliente> lista;

    

    public Cliente(int id,String nome) {
        
        this.id = id;
        this.nome = nome;

    }
    
        
    public static ArrayList<Cliente> getList() throws Exception{
        Connection con = Db.getConnection();
        String SQL = "select * from clientes";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
         
        while(rs.next()){
            lista = new ArrayList<>();
            Cliente c = new Cliente
                    (rs.getInt("ID"),
                    rs.getString("NAME"));
            
            lista.add(c);
        }
        rs.close();
        st.close();
        con.close();
        
        return lista;
    }
    
    public static void removerCliente(int id)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "delete * from clientes where id = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        rs.close();
        st.close();
        con.close();
    }
    
    public static void alterarCliente(int id,String nome)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "update clientes "
                + "set name=? "
                + "where id=?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setInt(2, id);
        ResultSet rs = st.executeQuery();
        rs.close();
        st.close();
        con.close();
    }
    
    public static void incluirCliente(String nome)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "insert into clientes values(default,?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    
    
}