/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import Connection.ConnectionFactory;
import com.ufpr.tads.web2.beans.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Itay
 */
public class ClienteDAO {

    private Connection con;

    public ClienteDAO() throws SQLException, ClassNotFoundException {
        this.con = ConnectionFactory.getConnection();

    }

    public List<Cliente> selectClientes() throws SQLException {
        
        List<Cliente> resultados = new ArrayList<>();
        
        String sql = "SELECT * FROM tb_cliente";
        PreparedStatement st = con.prepareStatement(sql);
        
        ResultSet rs = st.executeQuery();
        
        while (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setId_cliente(rs.getInt("id_cliente"));
            cliente.setCpf_cliente(rs.getString("cpf_cliente"));
            cliente.setNome_cliente(rs.getString("nome_cliente"));
            cliente.setEmail_cliente(rs.getString("email_cliente"));
            cliente.setData_cliente(rs.getString("data_cliente"));
            cliente.setRua_cliente(rs.getString("rua_cliente"));
            cliente.setNr_cliente(rs.getInt("nr_cliente"));
            cliente.setCep_cliente(rs.getString("cep_cliente"));
            cliente.setCidade_cliente(rs.getString("cidade_cliente"));
            cliente.setUf_cliente(rs.getString("uf_cliente"));
            
            resultados.add(cliente);
        }
        
        return resultados;
    }

    public Cliente selectClienteEspecifico(int id) throws SQLException {

        String sql = "SELECT * FROM tb_cliente WHERE id_cliente = (?) LIMIT 1;";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);

        ResultSet rs = st.executeQuery();
        Cliente cliente = new Cliente();

        while (rs.next()) {
            cliente.setId_cliente(rs.getInt("id_cliente"));
            cliente.setCpf_cliente(rs.getString("cpf_cliente"));
            cliente.setNome_cliente(rs.getString("nome_cliente"));
            cliente.setEmail_cliente(rs.getString("email_cliente"));
            cliente.setData_cliente(rs.getString("data_cliente"));
            cliente.setRua_cliente(rs.getString("rua_cliente"));
            cliente.setNr_cliente(rs.getInt("nr_cliente"));
            cliente.setCep_cliente(rs.getString("cep_cliente"));
            cliente.setCidade_cliente(rs.getString("cidade_cliente"));
            cliente.setUf_cliente(rs.getString("uf_cliente"));
            return cliente;
        }
        return null;
    }
    
    public void removeCliente(int id) throws SQLException {
        try{
            String sql = "DELETE FROM tb_cliente WHERE id_cliente = (?) LIMIT 1;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);

            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }

    public void alterarCliente(String cpf, String nome, String email, String data, String rua, int numero, String cep, String cidade, String uf, int id) throws SQLException {
        try{
            String sql = "UPDATE tb_cliente SET cpf_cliente = ? , nome_cliente = ?, " +
                        "email_cliente = ?, data_cliente = ?, rua_cliente = ?, nr_cliente = ?, " + 
                        "cep_cliente = ?, cidade_cliente = ?, uf_cliente = ?" + 
                        " WHERE id_cliente = ?";
            
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1, cpf);
            st.setString(2, nome);
            st.setString(3, email);
            st.setString(4, data);
            st.setString(5, rua);
            st.setInt(6, numero);
            st.setString(7, cep);
            st.setString(8, cidade);
            st.setString(9, uf);
            st.setInt(10, id);

            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertCliente(String cpf, String nome, String email, String data, String rua, int numero, String cep, String cidade, String uf) throws SQLException {
        
        String sql = "INSERT INTO tb_cliente (cpf_cliente, nome_cliente, email_cliente, data_cliente, rua_cliente," +
                    " nr_cliente, cep_cliente, cidade_cliente, uf_cliente)" + 
                    " VALUES ((?), (?), (?), (?), (?), (?), (?), (?), (?))";
        PreparedStatement st = con.prepareStatement(sql);
        
        st.setString(1, cpf);
        st.setString(2, nome);
        st.setString(3, email);
        st.setString(4, data);
        st.setString(5, rua);
        st.setInt(6, numero);
        st.setString(7, cep);
        st.setString(8, cidade);
        st.setString(9, uf);
        
        st.executeUpdate();
    }

}
