/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc.fornecedor;

import br.com.fatecpg.jdbc.Db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class Fornecedor {

    private int id;
    private String nome;
    private static ArrayList<Fornecedor> lista;

    

    public Fornecedor(int id,String nome) {
        
        this.id = id;
        this.nome = nome;

    }
    
    public Fornecedor (){
        
    }
    
        
    public ArrayList<Fornecedor> getList() throws Exception{
        Connection con = Db.getConnection();
        String SQL = "select * from fornecedores";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
         
        ArrayList<Fornecedor> lista = new ArrayList<>();
        while(rs.next()){
            Fornecedor c = new Fornecedor(
                    rs.getInt("ID"), 
                    rs.getString("NAME"));
            
            lista.add(c);
        }
        rs.close();
        st.close();
        con.close();
        
        return lista;
    }
    
    public static void removerFornecedor(int id)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "delete from fornecedores where id = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void alterarFornecedor(int id,String nome)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "update fornecedores "
                + "set name=? "
                + "where id=?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setInt(2, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void incluirFornecedor(String nome)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "insert into fornecedores values(default,?)";
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
