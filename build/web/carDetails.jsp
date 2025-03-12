<%-- 
    Document   : carDetails
    Created on : 25 feb. 2025, 19:33:41
    Author     : Samuel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="app.helper.pckg.miscHelper"%>
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

            ResultSet rsFuelType = database.getTable("fuelType");
            ResultSet rsCar = database.getCar(car_id);

            miscHelper misc = new miscHelper();
            ArrayList<Integer> anios = misc.getAnios();

            if (!(rsCar.next())) { // will work as resultSet == 0
                RequestDispatcher rd = request.getRequestDispatcher("carsServlet");
                rd.forward(request, response);
            }            
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
                                        <i class="fas fa-car"></i> <%=rsCar.getString("brand")%> <%=rsCar.getString("model")%> <%=rsCar.getString("man_year")%>
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
                                    <% if (rsCar.getString("email").equals(email)) { %>
                                    <a class="btn btn-info mt-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Edit your car info</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="updateCarLogic.jsp">        
                            <div class="mb-3">
                                <label for="txtId" class="form-label"> Car Id</label>
                                <input type="number" class="form-control" name="txtId" value="<%=rsCar.getInt("id")%>" readonly>
                            </div>  
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-calendar-alt"></i> Manufacture Year</label>
                                <select name="selYear" class="form-select" aria-label="Select your manufacture year">
                                    <option selected><%=rsCar.getString("man_year")%></option>
                                    <%for (Integer anio : anios) {%> 
                                    <option value="<%=anio%>"><%=anio%></option>
                                    <% }%>
                                </select> 
                            </div>   
                            <div class="mb-3">
                                <label for="txtColor" class="form-label"><i class="fas fa-palette"></i> Color</label>
                                <input type="text" class="form-control" name="txtColor" placeholder="Enter car color" value="<%=rsCar.getString("color")%>">
                            </div>     
                            <div class="mb-3">
                                <label for="txtEngine" class="form-label"><i class="fas fa-cogs"></i> CC Engine</label>
                                <input type="number" class="form-control" name="txtEngine" placeholder="Enter engine capacity" value="<%=rsCar.getString("cc_engine")%>">
                            </div>  
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-gas-pump"></i> Fuel Type</label>
                                <select name="selFuelType" class="form-select" aria-label="Select your fuel type">
                                    <option selected><%=rsCar.getString("fuelType")%></option>
                                    <% while (rsFuelType.next()) {%>                                
                                    <option value="<%=rsFuelType.getString("name")%>"><%=rsFuelType.getString("name")%></option>
                                    <% }%>                                
                                </select> 
                            </div>   
                            <div class="mb-3">
                                <label for="txtMileage" class="form-label"><i class="fas fa-tachometer-alt"></i> Mileage</label>
                                <input type="number" class="form-control" name="txtMileage" placeholder="Enter mileage" value="<%=rsCar.getString("mileage")%>">
                            </div>  
                            <div class="row">
                                <div class="col">
                                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Update</button>
                                </div>    
                                <div class="col">
                                    <a class="btn btn-danger w-100" data-bs-toggle="modal" data-bs-target="#modalConfirm"> Delete</a>
                                </div>                                 
                            </div>    
                        </form>
                    </div>
                    <br>        
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>                       
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalConfirm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Delete your car info</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        This action can not be reversed, do you reall y want to delete?                       
                    </div>
                    <br>     
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col">
                                <a href="deleteCar.jsp?txtId=<%=rsCar.getInt("id")%>" class="btn btn-danger">Delete</a>                       
                            </div>    
                            <div class="col">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>                                                   
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
