<%-- 
    Document   : clientesNovo
    Created on : 17/09/2018, 23:35:57
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
    </head>
    <body>
        <%
            LoginBean loginBean = (LoginBean) session.getAttribute("login");
            if(loginBean == null){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
                rd.forward(request, response);
            }
        %>
        <h1>Dados do cliente</h1>
        
        <form action="NovoClienteServlet" method="POST">
            Nome: <input type="text" name="nome" > <br/>
            CPF: <input type="text" name="cpf" ><br/>
            Email: <input type="text" name="email" ><br/>
            Data: <input type="text" name="data" ><br/>
            Rua: <input type="text" name="rua" ><br/>
            Número: <input type="text" name="numero" ><br/>
            CEP: <input type="text" name="cep" ><br/>
            Cidade: <input type="text" name="cidade" ><br/>
            UF: <input type="text" name="uf" ><br/><br/>
            <input type="submit" value="Salvar"> <input type="submit" value="Cancelar" formaction="ClientesServlet">
        </form>
        
    </body>
</html>
