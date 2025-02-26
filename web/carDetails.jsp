<%-- 
    Document   : carDetails
    Created on : 25 feb. 2025, 19:33:41
    Author     : Samuel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Price Auto Sales</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/site.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>        
        <%
            String email = (String) session.getAttribute("email");

            if (email == null) {
                RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=You must log in first");
                rd.forward(request, response);
            }

            int car_id = Integer.parseInt(request.getParameter("id"));
            databaseHelper database = new databaseHelper();
            ResultSet rsCar = database.getCar(car_id);
            rsCar.next();
        %>        
        <div class="top-bar d-none d-xl-block">
            <div class="container d-flex justify-content-between">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item"><a href="mailto:contact@priceautoscr.com">contact@priceautoscr.com</a></li>
                    <li class="list-inline-item">Lun - Vie: 7:30am - 5:00pm</li>
                    <li class="list-inline-item">Ok 34, Provincia De Puntarenas, Costa Rica</li>
                </ul>
                <a class="btn btn-warning btn-sm" href="/contact">📅 Book A Virtual Tour</a>
            </div>
        </div>

        <!-- Menú principal -->
        <div class="header-main">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-auto">
                        <a class="navbar-brand" href="/">

                        </a>
                    </div>
                    <div class="col-lg-auto col">
                        <div class="header-contacts d-none d-md-block">
                            <span>Welcome <%=email%></span>
                        </div>
                    </div>
                    <div class="col-lg d-none d-lg-block">
                        <nav class="navbar navbar-expand-md justify-content-end">
                            <ul class="navbar-nav">
                                <li class="nav-item active"><a class="nav-link" href="menu.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="/">Inventory</a></li>
                                <li class="nav-item"><a class="nav-link" href="/">About</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Services</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/">Schedule Appointment</a>
                                    </div>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="/">Locations</a></li>
                                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <hr>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow-lg p-3 rounded">
                        <div class="row g-0">
                            <div class="col-md-4 d-flex align-items-center">
                                <img src="<%=rsCar.getString("photo")%>" class="img-fluid rounded" alt="Car Image">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h4 class="card-title text-primary fw-bold">
                                        <i class="fas fa-car"></i> <%=rsCar.getString("brand")%> <%=rsCar.getString("model")%>
                                    </h4>
                                    <hr>
                                    <p><i class="fas fa-cogs"></i> Engine: <strong><%=rsCar.getString("cc_engine")%></strong></p>
                                    <p><i class="fas fa-tachometer-alt"></i> Mileage: <strong><%=rsCar.getString("mileage")%></strong></p>
                                    <p><i class="fas fa-gas-pump"></i> Fuel Type: <strong><%=rsCar.getString("fuelType")%></strong></p>
                                    <p><i class="fas fa-palette"></i> Color: <strong><%=rsCar.getString("color")%></strong></p>
                                    <hr>
                                    <h6 class="text-muted"><i class="fas fa-user"></i> Owner Information</h6>
                                    <p><i class="fas fa-user"></i> Name: <strong><%=rsCar.getString("user_name")%></strong></p>
                                    <p><i class="fas fa-envelope"></i> Email: <strong><%=rsCar.getString("email")%></strong></p>
                                    <p><i class="fas fa-phone"></i> Phone: <strong><%=rsCar.getString("phone")%></strong></p>
                                    <a href="carsServlet" class="btn btn-primary mt-2"><i class="fas fa-arrow-left"></i> Back</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Agregar FontAwesome para los iconos -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </div>
</body>
</html>
