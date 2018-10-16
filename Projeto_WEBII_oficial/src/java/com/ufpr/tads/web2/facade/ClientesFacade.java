/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.dao.ClienteDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Itay
 */
public class ClientesFacade {
    public static void inserir(Cliente cliente) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        dao.insertCliente(cliente.getCpf_cliente(), cliente.getNome_cliente(), cliente.getEmail_cliente(), cliente.getData_cliente(), cliente.getRua_cliente(), cliente.getNr_cliente(), cliente.getCep_cliente(), cliente.getCidade_cliente(), cliente.getUf_cliente());
    }

    public static void alterar(Cliente cliente) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        dao.alterarCliente(cliente.getCpf_cliente(), cliente.getNome_cliente(), cliente.getEmail_cliente(), cliente.getData_cliente(), cliente.getRua_cliente(), cliente.getNr_cliente(), cliente.getCep_cliente(), cliente.getCidade_cliente(), cliente.getUf_cliente(), cliente.getId_cliente());
    }

    public static Cliente buscar(int id) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        return dao.selectClienteEspecifico(id);
    }

    public static List<Cliente> buscarTodos() throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        return dao.selectClientes();
    }

    public static void excluir(int id) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        dao.removeCliente(id);
    }
}
