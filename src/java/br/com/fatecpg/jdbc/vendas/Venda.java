/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc.vendas;

import br.com.fatecpg.jdbc.cliente.*;
import br.com.fatecpg.jdbc.Db;
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
public class Venda {

    private int id;
    private String nome;
    private String valor;
    private String vendedor;
    private static ArrayList<Venda> lista;

    public Venda(int id, String nome, String valor, String vendedor) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.vendedor = vendedor;
    }

    
    public Venda (){
        
    }
    
        
    public ArrayList<Venda> getList() throws Exception{
        Connection con = Db.getConnection();
        String SQL = "select * from vendas";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
         
        ArrayList<Venda> lista = new ArrayList<>();
        while(rs.next()){
            Venda c = new Venda(
                    rs.getInt("ID"), 
                    rs.getString("NOMEPRODUTO"),
                    rs.getString("VALOR"),
                    rs.getString("VENDEDOR"));
            
            lista.add(c);
        }
        rs.close();
        st.close();
        con.close();
        
        return lista;
    }
    
    public static void removerVenda(int id)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "delete from vendas where id = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void alterarVenda(int id,String nome,String valor,String vendedor)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "update vendas "
                + "set name=?,valor=?,vendedor=? "
                + "where id=?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setString(2, valor);
        st.setString(3, vendedor);
        st.setInt(4, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void incluirVenda(String nome,String valor,String vendedor)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "insert into vendas values(default,?,?,?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setString(2, valor);
        st.setString(3, vendedor);
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

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getVendedor() {
        return vendedor;
    }

    public void setVendedor(String vendedor) {
        this.vendedor = vendedor;
    }

    public static ArrayList<Venda> getLista() {
        return lista;
    }

    public static void setLista(ArrayList<Venda> lista) {
        Venda.lista = lista;
    }

    
    
}
