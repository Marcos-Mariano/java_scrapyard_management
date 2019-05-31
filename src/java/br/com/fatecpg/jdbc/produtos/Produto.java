/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jdbc.produtos;


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

    private int id;
    private String nome;
    private static ArrayList<Produto> lista;
    private String unidade;
    private int valor;
    private int quantidade;

    

    public Produto(int id, String nome, int valor, int quantidade, String unidade) {
        
        this.id = id;
        this.nome = nome;
        this.unidade = unidade;
        this.valor = valor;
        this.quantidade = quantidade;

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
                    rs.getString("NOME"),
                     rs.getInt("VALOR"),
                    rs.getInt("QUANTIDADE"),
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
    
    public static void alterarProduto(int id,String nome)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "update produtos "
                + "set name=? "
                + "where id=?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setInt(2, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void incluirProduto(String nome)throws Exception{
        Connection con = Db.getConnection();
        String SQL = "insert into produtos values(default,?)";
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

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    
    
}
