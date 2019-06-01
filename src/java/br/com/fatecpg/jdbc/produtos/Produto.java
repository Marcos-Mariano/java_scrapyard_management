/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc.produtos;

import br.com.fatecpg.jdbc.produtos.*;
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
public class Produto {

    public static ArrayList<Produto> getLista() {
        return lista;
    }

    public static void setLista(ArrayList<Produto> aLista) {
        lista = aLista;
    }

    private int id;
    private String nome;
    private String valor;
    private String quantidade;
    private String unidade;
    
    private static ArrayList<Produto> lista;

    public Produto(int id, String nome, String valor, String quantidade, String unidade) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.quantidade = quantidade;
        this.unidade = unidade;
    }

    
    public Produto (){
        
    }
    
        
    public ArrayList<Produto> getList() throws Exception{
        Connection con = Db.getConnection();
        String SQL = "select * from produtos";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
         
        ArrayList<Produto> lista = new ArrayList<>();
        while(rs.next()){
            Produto c = new Produto(
                    rs.getInt("ID"), 
                    rs.getString("NOMEPRODUTO"),
                    rs.getString("VALOR"),
                    rs.getString("QUANTIDADE"),
                    rs.getString("UNIDADEMEDIDA"));
            
            lista.add(c);
        }
        rs.close();
        st.close();
        con.close();
        
        return lista;
    }
    
    public static void removerProduto(int id)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "delete from produtos where id = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void alterarProduto(int id,String nome,String valor, String quantidade, String unidade)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "update produtos "
                + "set nomeproduto=?,valor=?,quantidade=?, unidade=? "
                + "where id=?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setString(2, valor);
        st.setString(3, quantidade);
        st.setString(4, unidade);
        st.setInt(5, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void incluirProduto(String nome,String valor, String quantidade, String unidade)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "insert into produtos values(default,?,?,?,?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setString(2, valor);
        st.setString(3, quantidade);
        st.setString(4, unidade);
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

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

  
    
    
}
