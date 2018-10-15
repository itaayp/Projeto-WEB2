<%-- 
    Document   : index
    Created on : 16/09/2018, 16:46:01
    Author     : Itay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginServlet" method="POST">
            Usuário: <input type="text" name="login" value=""><br>
            Senha: <input type="password" name="password" value=""><br/>
            <br><br>
            <input type="submit" value="Logar">
        </form>
        <%
            if(request.getAttribute("msg") != null) {
                out.println("<br/><p style=\"color: red\">"+ request.getAttribute("msg") +"</p>");
            }
        %>
    </body>
    <footer>
        <br/>
        <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
        Em caso de problemas contactar o administrador: <jsp:getProperty name="configuracao" property="email" />
    </footer>
</html>
