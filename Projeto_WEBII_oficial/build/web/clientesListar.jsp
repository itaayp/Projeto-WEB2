<%-- 
    Document   : clientesListar
    Created on : 16/09/2018, 22:58:17
    Author     : Itay
--%>

<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td, th{
                border: 1px solid black;
            }            
        </style>
    </head>
    <body>
        <jsp:useBean id="login" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>
        <%
            LoginBean loginBean = (LoginBean) session.getAttribute("login");
            if(loginBean == null){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg",  "Usuário deve se autenticar para acessar o sistema");
                rd.forward(request, response);
            }
        %>

        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
          <div class="w3-container">
            <h3 class="w3-padding-64"><b>Menu</b></h3>
          </div>
          <div class="w3-bar-block">
            <a href="ClientesServlet" class="w3-bar-item w3-button w3-hover-white">Cadastro de Clientes</a>
            <a href="LogoutServlet" class="w3-bar-item w3-button w3-hover-white">Sair</a>
          </div>
        </nav>

        <div class="w3-right" style="padding-right: 250px;">
            <p>
                <jsp:getProperty name="login" property="nome_usuario" />
            </p>
            <br/>
            
            <%    
                List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");

                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Nome</th>");
                out.println("<th>CPF</th>");
                out.println("<th>Email</th>");
                out.println("<th colspan=\"3\">Ações</th>");
                out.println("</tr>");

                for(int i = 0; i < clientes.size(); i++){  
                    out.println("<tr>");
                    out.println("<td>" + clientes.get(i).getNome_cliente() + "</td>");  
                    out.println("<td>" + clientes.get(i).getCpf_cliente() + "</td>"); 
                    out.println("<td>" + clientes.get(i).getEmail_cliente() + "</td>");
                    out.println("<td> <a href=\"VisualizarClienteServlet?id="+ clientes.get(i).getId_cliente() +"\"><img src=\"Imagens/view.jpg\" height=\"25\" width=\"25px\"></a></td>");
                    out.println("<td> <a href=\"FormAlterarClienteServlet?id="+ clientes.get(i).getId_cliente() +"\"><img src=\"Imagens/update.png\" height=\"25\" width=\"25px\"></a></td>");
                    out.println("<td> <a href=\"RemoverClienteServlet?id="+ clientes.get(i).getId_cliente() +"\"><img src=\"Imagens/remove.png\" height=\"25\" width=\"25px\"></a></td>");
                    out.println("</tr>");
                }

                out.println("</table>");
            %>
            <br>
            <a href="FormNovoClienteServlet"  style="color: darkblue">Novo</a> |
            <a href ='LogoutServlet' style="color: darkblue">Encerrar sessão</a>

            <div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px">
                <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
              <footer class="w3-right">
                  Em caso de problemas contactar o administrador: <jsp:getProperty name="configuracao" property="email" />
              </footer>
            </div>
        </div>
    </body>
</html>
