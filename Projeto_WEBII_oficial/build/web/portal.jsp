<%-- 
    Document   : portal
    Created on : 28/08/2018, 21:25:16
    Author     : tiago
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.ufpr.tads.web2.beans.Usuario"%>
<%@page import="com.ufpr.tads.web2.servlets.UsuarioDAO"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal</title>
        <style>
            td, th{
                border: 1px solid black;
            }            
        </style>
    </head>
    <style>
        .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
        .w3-half img:hover{opacity:1}
    </style>
    <body>
        <jsp:useBean id="login" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>
        
        <%
            LoginBean loginBean = (LoginBean) session.getAttribute("login");
            
            if(loginBean.getNome_usuario() == null){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema.");
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

        <div class="w3-right" style="padding-right: 150px;">
            <p>
                ${login.nome_usuario}
            </p>
            <br>

            <form action='CadastrarUsuarioServlet' method='POST'>
                Nome: <input type='text' name='nome' value=''/>
                Login: <input type='text' name='login' value=''/>
                Senha: <input type='password' name='senha' value=''/>
                <input type='submit' name='btnEnviar' value='Enviar'>
            </form>

            <%   
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
            %>
            <br>

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
