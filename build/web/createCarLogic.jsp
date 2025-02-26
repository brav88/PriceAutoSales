<%-- 
    Document   : createCarLogic
    Created on : 18 feb. 2025, 19:31:23
    Author     : Samuel
--%>

<%@page import="app.model.pckg.Car"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String selBrand = request.getParameter("selBrand");
    String selModel = request.getParameter("selModel");
    int selYear = Integer.parseInt(request.getParameter("selYear"));
    String txtColor = request.getParameter("txtColor");
    String txtEngine = request.getParameter("txtEngine");
    String selFuelType = request.getParameter("selFuelType");
    int txtMileage = Integer.parseInt(request.getParameter("txtMileage"));
    int owner_id = (int) session.getAttribute("owner_id");

    databaseHelper database = new databaseHelper();

    if (database.saveCar(new Car(0,
            selBrand,
            selModel,
            selYear,
            txtColor,
            txtEngine,
            selFuelType,
            txtMileage,
            "Images/0.jpg"), owner_id)) {
        RequestDispatcher rd = request.getRequestDispatcher("carsServlet");
        rd.forward(request, response);
    } else {
        RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=Cars was not saved due an unhandled error");
        rd.forward(request, response);
    }
%>