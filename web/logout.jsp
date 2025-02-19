<%-- 
    Document   : logout
    Created on : 18 feb. 2025, 19:00:21
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession(false);

    if (session != null) {
        session.invalidate();
    }

    RequestDispatcher rd = request.getRequestDispatcher("login.html");
    rd.forward(request, response);
%>
