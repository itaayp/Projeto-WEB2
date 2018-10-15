<%-- 
    Document   : clientesAlterar
    Created on : 17/09/2018, 20:24:41
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
        
        <%    
            Cliente clientes = (Cliente) request.getAttribute("cliente");
        %>
        <form action="AlterarClienteServlet" method="POST">
            Nome: <input type="text" name="nome" value= <% out.println(clientes.getNome_cliente()); %> > <br/>
            Id: <input type="text" name="id" value=<% out.println(clientes.getId_cliente()); %> ><br/>
            CPF: <input type="text" name="cpf" value= <% out.println(clientes.getCpf_cliente()); %> ><br/>
            Email: <input type="text" name="email" value= <% out.println(clientes.getEmail_cliente()); %> ><br/>
            Data: <input type="text" name="data" value= <% out.println(clientes.getData_cliente()); %> ><br/>
            Rua: <input type="text" name="rua" value= <% out.println(clientes.getRua_cliente()); %> ><br/>
            Número: <input type="text" name="numero" value= <% out.println(clientes.getNr_cliente()); %> ><br/>
            CEP: <input type="text" name="cep" value= <% out.println(clientes.getCep_cliente()); %> ><br/>
            Cidade: <input type="text" name="cidade" value= <% out.println(clientes.getCidade_cliente()); %> ><br/>
            UF: <input type="text" name="uf" value= <% out.println(clientes.getUf_cliente()); %> ><br/><br/>
            <input type="submit" value="Alterar"> <input type="submit" value="Cancelar" formaction="ClientesServlet">
        </form>
        
    </body>
</html>
