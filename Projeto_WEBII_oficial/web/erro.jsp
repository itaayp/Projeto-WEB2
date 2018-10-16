<%-- 
    Document   : erro
    Created on : 28/08/2018, 20:31:45
    Author     : tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p style="color: red;">
            ${pageContext.exception.message}
            ${pageContext.out.flush()}
            ${pageContext.exception.printStackTrace(pageContext.response.writer)}
        </p>
    </body>
    
    <footer>
        <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
        Em caso de problemas contactar o administrador: <c:out value="${configuracao.email}"/>
    </footer>
</html>
