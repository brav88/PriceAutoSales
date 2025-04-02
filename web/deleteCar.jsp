<%-- 
    Document   : deleteCar
    Created on : 11 mar. 2025, 19:28:02
    Author     : Samuel
--%>

<%@page import="app.model.pckg.Car"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int owner_id = (int) session.getAttribute("owner_id");
    int txtId = Integer.parseInt(request.getParameter("txtId"));
    String email = (String) session.getAttribute("email");

    databaseHelper database = new databaseHelper();

    if (database.deleteCar(txtId, owner_id)) {

        database.saveNotification(email, "DELETE", "User deletes car " + txtId);

        RequestDispatcher rd = request.getRequestDispatcher("carsServlet");
        rd.forward(request, response);
    } else {
        RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=Cars was not update due an unhandled error");
        rd.forward(request, response);
    }
%>
