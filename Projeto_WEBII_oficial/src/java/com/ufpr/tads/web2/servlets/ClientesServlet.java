/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.dao.ClienteDAO;
import com.ufpr.tads.web2.facade.ClientesFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Itay
 */
@WebServlet(name = "ClientesServlet", urlPatterns = {"/ClientesServlet"})
public class ClientesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            LoginBean loginBean = (LoginBean) session.getAttribute("login");
           
            if(loginBean != null) {
                int id;
                Cliente cliente;
                List<Cliente> clientes;
                RequestDispatcher rd;
                String action = request.getParameter("action");                

                if (action != null) {
                    switch (action) {
                        case "show":
                            id = Integer.parseInt(request.getParameter("id"));
                            cliente = ClientesFacade.buscar(id);
                            request.setAttribute("visualizar", cliente);
                            rd = getServletContext().getRequestDispatcher("/clientesVisualizar.jsp");
                            rd.forward(request, response);
                            break;
                        case "formUpdate":
                            id = Integer.parseInt(request.getParameter("id"));
                            cliente = ClientesFacade.buscar(id);
                            request.setAttribute("alterar", cliente);
                            rd = getServletContext().getRequestDispatcher("/clientesAlterar.jsp");
                            rd.forward(request, response);
                            break;
                        case "remove":
                            id = Integer.parseInt(request.getParameter("id"));
                            ClientesFacade.excluir(id);
                            //rd = getServletContext().getRequestDispatcher("/ClientesServlet");
                            //rd.forward(request, response);
                            response.sendRedirect(request.getContextPath() + "/ClientesServlet");
                            break;
                        case "update":
                            cliente = new Cliente();
                            id = Integer.parseInt(request.getParameter("id"));
                            cliente.setId_cliente(id);
                            cliente.setCpf_cliente(request.getParameter("cpf"));
                            cliente.setNome_cliente(request.getParameter("nome"));
                            cliente.setEmail_cliente(request.getParameter("email"));
                            String dataString = request.getParameter("data");

                            cliente.setData_cliente(dataString);
                            cliente.setCep_cliente(request.getParameter("cep"));
                            cliente.setRua_cliente(request.getParameter("rua"));
                            int numero = Integer.parseInt(request.getParameter("nr"));
                            cliente.setNr_cliente(numero);
                            cliente.setCidade_cliente(request.getParameter("cidade"));
                            cliente.setUf_cliente(request.getParameter("uf"));
                            ClientesFacade.alterar(cliente);
                            response.sendRedirect(request.getContextPath() + "/ClientesServlet");
                            break;
                        case "formNew":
                            response.sendRedirect(request.getContextPath() + "/clientesNovo.jsp");
                            break;
                        case "new":
                            cliente = new Cliente();
                            cliente.setNome_cliente(request.getParameter("nome"));
                            cliente.setCpf_cliente(request.getParameter("cpf"));
                            cliente.setEmail_cliente(request.getParameter("email"));
                            String dataS = request.getParameter("data");

                            cliente.setData_cliente(dataS);
                            cliente.setCep_cliente(request.getParameter("cep"));
                            cliente.setRua_cliente(request.getParameter("rua"));
                            int nr = Integer.parseInt(request.getParameter("numero"));
                            cliente.setNr_cliente(nr);
                            cliente.setCidade_cliente(request.getParameter("cidade"));
                            cliente.setUf_cliente(request.getParameter("uf"));
                            ClientesFacade.inserir(cliente);
                            response.sendRedirect(request.getContextPath() + "/ClientesServlet");
                            break;
                        default:
                            clientes = ClientesFacade.buscarTodos();
                            request.setAttribute("listar", clientes);
                            rd = getServletContext().getRequestDispatcher("/clientesListar.jsp");
                            rd.forward(request, response);
                    }
                } else {
                    clientes = ClientesFacade.buscarTodos();
                    request.setAttribute("listar", clientes);
                    rd = getServletContext().getRequestDispatcher("/clientesListar.jsp");
                    rd.forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
