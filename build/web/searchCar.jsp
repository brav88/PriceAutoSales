<%-- 
    Document   : createCar
    Created on : 18 feb. 2025, 19:13:22
    Author     : Samuel
--%>

<%@page import="app.helper.pckg.miscHelper"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="app.model.pckg.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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

            databaseHelper database = new databaseHelper();
            ResultSet rsBrands = database.getTable("brands");
            ResultSet rsModels = database.getTable("models");
            ResultSet rsFuelType = database.getTable("fuelType");

            miscHelper misc = new miscHelper();
            ArrayList<Integer> anios = misc.getAnios();

            String selectedBrand = request.getParameter("selBrand");
            String selectedModel = request.getParameter("selModel");
            String selBegin = request.getParameter("selBegin");
            String selEnd = request.getParameter("selEnd");

            ArrayList<Car> cars = new ArrayList<>();

            String whereClause = "";

            if (selectedBrand != "") {
                whereClause = "brand = '" + selectedBrand + "'";
            }

            if (selectedModel != "") {
                if (whereClause == "") {
                    whereClause = "model = '" + selectedModel + "'";
                } else {
                    whereClause += " AND " + "model = '" + selectedModel + "'";
                }
            }
            
            if (selBegin != "" && selEnd != "") {
                if (whereClause == "") {
                    whereClause = "man_year between " + selBegin + " AND " + selEnd;
                } else {
                    whereClause += " AND " + "man_year between " + selBegin + " AND " + selEnd;
                }
            }

            if (whereClause != "") {

                whereClause = " WHERE " + whereClause;

                ResultSet resultset = database.getTableWithCriteria("cars", whereClause);

                while (resultset.next()) {
                    Car car = new Car(resultset.getInt("id"),
                            resultset.getString("brand"),
                            resultset.getString("model"),
                            resultset.getInt("man_year"),
                            resultset.getString("color"),
                            resultset.getString("cc_engine"),
                            resultset.getString("fuelType"),
                            resultset.getInt("mileage"),
                            resultset.getString("photo"));

                    cars.add(car);
                }
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

        <!-- Contenido de prueba -->
        <div class="d-flex justify-content-center align-items-center">
            <div class="card shadow-lg p-4 rounded" style="width: 90%;">
                <h4 class="text-center text-primary mb-3"><i class="fas fa-car"></i> Search Car</h4>
                <form action="searchCar.jsp">
                    <div class='row justify-content-center'>
                        <div class='col'>
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-warehouse"></i> Brand</label>
                                <select name="selBrand" class="form-select" aria-label="Select your brand">     
                                    <option selected></option>
                                    <% while (rsBrands.next()) {%>                                
                                    <option value="<%=rsBrands.getString("name")%>"><%=rsBrands.getString("name")%></option>
                                    <% }%>
                                </select>                            
                            </div>
                        </div>
                        <div class='col'>
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-car-side"></i> Model</label>
                                <select name="selModel" class="form-select" aria-label="Select your model">
                                    <option selected></option>
                                    <% while (rsModels.next()) {%>                                
                                    <option value="<%=rsModels.getString("name")%>"><%=rsModels.getString("name")%></option>
                                    <% }%>
                                </select>  
                            </div>     
                        </div> 
                        <div class='col'>
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-calendar-alt"></i>Year range</label>
                                <select name="selBegin" class="form-select">
                                    <option selected></option>
                                    <%for (Integer anio : anios) {%> 
                                    <option value="<%=anio%>"><%=anio%></option>
                                    <% }%>
                                </select> 
                                <select name="selEnd" class="form-select">
                                    <option selected></option>
                                    <%for (Integer anio : anios) {%> 
                                    <option value="<%=anio%>"><%=anio%></option>
                                    <% }%>
                                </select>
                            </div>                             
                        </div> 
                    </div>
                    <div class='row justify-content-center'>
                        <div class='col'>      
                            <div class="mb-3">
                                <label for="txtColor" class="form-label"><i class="fas fa-palette"></i> Color</label>
                                <input type="text" class="form-control" name="txtColor" placeholder="Enter car color">
                            </div>
                        </div> 
                        <div class='col'> 
                            <div class="mb-3">
                                <label for="txtEngine" class="form-label"><i class="fas fa-cogs"></i> CC Engine</label>
                                <input type="number" class="form-control" name="txtEngine" placeholder="Enter engine capacity">
                            </div>  
                        </div> 
                        <div class='col'>    
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-gas-pump"></i> Fuel Type</label>
                                <select name="selFuelType" class="form-select" aria-label="Select your fuel type">
                                    <option selected>Select your fuel type</option>
                                    <% while (rsFuelType.next()) {%>                                
                                    <option value="<%=rsFuelType.getString("name")%>"><%=rsFuelType.getString("name")%></option>
                                    <% }%>                                
                                </select> 
                            </div>   
                        </div> 
                    </div>
                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>Search</button>
                </form>
            </div>
        </div>

        <div class="d-flex justify-content-center align-items-center">
            <div class="card shadow-lg p-4 rounded" style="width: 90%;">
                <div class='row'>
                    <% for (Car car : cars) {%>
                    <div class='col'>
                        <div class='card shadow-sm' style='width:18rem;height:25rem'>
                            <img src='<%=car.Photo%>' />
                            <div class='card-body'>
                                <h5 class='card-title'>Brand: <%=car.Brand%></h5>
                                <p class='card-text'>Engine: <%=car.Engine%></p>
                                <a href='carDetails.jsp?id=<%=car.Id%>' class='btn btn-primary'>See details</a>
                            </div>
                        </div>
                    </div>        
                    <% }%> 
                </div>
            </div>
        </div>

        <!-- Agregar FontAwesome para iconos -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    </body>
</html>
