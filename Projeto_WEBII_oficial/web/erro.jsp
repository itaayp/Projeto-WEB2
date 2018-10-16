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
        
        <%String mensagem = (String) request.getAttribute("msg");%>
        <%String pagina = (String) request.getAttribute("page");%>
        
        <% out.println("Erro: " + mensagem); %>
        
        <a href="<% out.println(pagina); %>">link</a>
    </body>
    
    <footer>
        <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
        Em caso de problemas contactar o administrador: <c:out value="${configuracao.email}"/>
    </footer>
 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.buttflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>
