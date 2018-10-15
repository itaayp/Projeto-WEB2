/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.dao.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
                String action = request.getParameter("action");
                if(action.equals("list") || action == null) {
                
                } else if (action.equals("show")) {
                
                } else if(action.equals("formUpdate")){
                
                } else if (action.equals("remove")){
                    
                } else if (action.equals("update")){
                    
                } else if (action.equals("formNew")){
                    
                } else if (action.equals("new")){
                    
                } else if (action.equals("")) {
                    // insere
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/mensagem.jsp");

                    rd.forward(request, response);
                } else if (action.equals("pesquisar")) {
                    // pesquisa
                    RequestDispatcher rd = getServletContext().

                    getRequestDispatcher("/mostrar.jsp");

                    rd.forward(request, response);
                }
                else {
                    RequestDispatcher rd = getServletContext().

                    getRequestDispatcher("/erro.jsp");

                    rd.forward(request, response);
                }
                
                
                ClienteDAO dao = new ClienteDAO();
                List<Cliente> clientes = new ArrayList<>();
                
                clientes = dao.selectClientes();
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/clientesListar.jsp");
                request.setAttribute("clientes", clientes);
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
                rd.forward(request, response);
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
