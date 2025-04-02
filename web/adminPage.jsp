<%-- 
    Document   : adminPage
    Created on : 1 abr. 2025, 18:50:58
    Author     : Samuel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    int user_status = (int) session.getAttribute("user_status");

    if (user_status != 0) {
        RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=Your user does not have access to this module");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/site.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>        
        <h2>Hello World!</h2>
    </body>
</html>
