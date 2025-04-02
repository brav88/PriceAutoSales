<%-- 
    Document   : updateCarLogic
    Created on : 11 mar. 2025, 19:01:37
    Author     : Samuel
--%>

<%@page import="app.model.pckg.Car"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%   
    int txtId = Integer.parseInt(request.getParameter("txtId"));
    int selYear = Integer.parseInt(request.getParameter("selYear"));
    String txtColor = request.getParameter("txtColor");
    String txtEngine = request.getParameter("txtEngine");
    String selFuelType = request.getParameter("selFuelType");
    int txtMileage = Integer.parseInt(request.getParameter("txtMileage"));    
    String email = (String) session.getAttribute("email");
    
    databaseHelper database = new databaseHelper();

    if (database.updateCar(txtId, new Car(0,
            "",
            "",
            selYear,
            txtColor,
            txtEngine,
            selFuelType,
            txtMileage,
            ""))) {
            
        database.saveNotification(email, "UPDATE", "User updates car " + txtId);
            
        RequestDispatcher rd = request.getRequestDispatcher("carDetails.jsp?id="+txtId);
        rd.forward(request, response);
    } else {
        RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=Cars was not update due an unhandled error");
        rd.forward(request, response);
    }
%>
