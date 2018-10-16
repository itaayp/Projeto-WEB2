<%-- 
    Document   : clientesNovo
    Created on : 17/09/2018, 23:35:57
    Author     : Itay
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="/erro.jsp"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="java.util.List"%>
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
        <jsp:useBean id="login" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>

        <c:if test="${empty sessionScope.login}">
            <jsp:forward page="/index.jsp">
                <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema"/>
            </jsp:forward>
        </c:if>
        
        <h1>Dados do cliente</h1>
        
        <form action="ClientesServlet?action=new" method="POST">
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
