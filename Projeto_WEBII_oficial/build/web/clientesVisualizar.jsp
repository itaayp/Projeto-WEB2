<%-- 
    Document   : clientesVisualizar
    Created on : 17/09/2018, 22:01:51
    Author     : Itay
--%>

<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td, th{
                border: 1px solid black;
                padding-right: 10px;
            }
        </style>
    </head>
    <body>
        <%
            LoginBean loginBean = (LoginBean) session.getAttribute("login");
            if(loginBean == null){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg",  "Usuário deve se autenticar para acessar o sistema");
                rd.forward(request, response);
            }
        %>

            
            <%    
                Cliente clientes = (Cliente) request.getAttribute("cliente");

                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Nome</th>");
                out.println("<th>CPF</th>");
                out.println("<th>Email</th>");
                out.println("<th>Data</th>");
                out.println("<th>Rua</th>");
                out.println("<th>Numero</th>");
                out.println("<th>CEP</th>");
                out.println("<th>Cidade</th>");
                out.println("<th>UF</th>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<td>" + clientes.getNome_cliente() + "</td>");  
                out.println("<td>" + clientes.getCpf_cliente() + "</td>"); 
                out.println("<td>" + clientes.getEmail_cliente() + "</td>");
                out.println("<td>" + clientes.getData_cliente() + "</td>");
                out.println("<td>" + clientes.getRua_cliente() + "</td>");
                out.println("<td>" + clientes.getNr_cliente() + "</td>");
                out.println("<td>" + clientes.getCep_cliente() + "</td>");
                out.println("<td>" + clientes.getCidade_cliente() + "</td>");
                out.println("<td>" + clientes.getUf_cliente() + "</td>");

                out.println("</tr>");

                out.println("</table>");
            %>
            <br>
            <a href="ClientesServlet">Voltar</a>
    </body>
</html>