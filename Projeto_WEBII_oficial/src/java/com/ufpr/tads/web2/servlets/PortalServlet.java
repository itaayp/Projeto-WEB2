package com.ufpr.tads.web2.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.ufpr.tads.web2.beans.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Amanda
 */
@WebServlet(name = "PortalServlet", urlPatterns = {"/PortalServlet"})
public class PortalServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet PortalServlet</title>");
                out.println("</head>");
                out.println("<body>");
                
                out.println("<form action='CadastrarUsuarioServlet' method='POST'>");
                out.println("Nome: <input type='text' name='nome' value=''/>");
                out.println("Login: <input type='text' name='login' value=''/>");
                out.println("Senha: <input type='password' name='senha' value=''/>");
                out.println("<input type='submit' name='btnEnviar' value='Enviar'>");
                out.println("</form>");
                
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            ArrayList<Usuario> usuarios = usuarioDAO.selecionar();
            
             if (usuarios.size() > 0){
                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Nome</th>");
                out.println("<th>Login</th>");
                out.println("<th>Senha</th>");
                out.println("</tr>");
             
                for(int i = 0; i < usuarios.size(); i++){  
                    out.println("<tr>");
                    out.println("<td>" + usuarios.get(i).getNome_usuario() + "</td>");  
                    out.println("<td>" + usuarios.get(i).getLogin_usuario() + "</td>"); 
                    out.println("<td>" + usuarios.get(i).getSenha_usuario() + "</td>"); 
                    out.println("</tr>");
                }
                
                out.println("</table>");
            }
             
             out.println("<br>");
                
             out.println("<a href ='LogoutServlet'>Encerrar sessão</a>");
                
             out.println("</body>");
             out.println("</html>"); 
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
        processRequest(request, response);
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
        processRequest(request, response);
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
