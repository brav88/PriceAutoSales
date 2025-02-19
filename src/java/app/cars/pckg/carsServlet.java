/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package app.cars.pckg;

import app.helper.pckg.databaseHelper;
import app.model.pckg.Car;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Samuel
 */
public class carsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            ArrayList<Car> cars = new ArrayList<>();
            databaseHelper database = new databaseHelper();
            ResultSet resultset = database.getCars();

            while (resultset.next()) {
                Car car = new Car(resultset.getString("brand"),
                        resultset.getString("model"),
                        resultset.getInt("man_year"),
                        resultset.getString("color"),
                        resultset.getString("cc_engine"),
                        resultset.getString("fuelType"),
                        resultset.getInt("mileage"),
                        resultset.getString("photo"));

                cars.add(car);
            }

            database.close();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Lista de Vehículos</title>");
            out.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
            out.println("<link href='css/site.css' rel='stylesheet' type='text/css'/>");
            out.println("</head>");
            
            out.println("<body class='bg-light'>");
            out.println("<div class='top-bar d-none d-xl-block'>");
            out.println("    <div class='container d-flex justify-content-between'>");
            out.println("        <ul class='list-inline mb-0'>");
            out.println("            <li class='list-inline-item'><a href='mailto:contact@priceautoscr.com'>contact@priceautoscr.com</a></li>");
            out.println("            <li class='list-inline-item'>Lun - Vie: 7:30am - 5:00pm</li>");
            out.println("            <li class='list-inline-item'>Ok 34, Provincia De Puntarenas, Costa Rica</li>");
            out.println("        </ul>");
            out.println("        <a class='btn btn-warning btn-sm' href='/contact'>📅 Book A Virtual Tour</a>");
            out.println("    </div>");
            out.println("</div>");

            out.println("<!-- Menú principal -->");
            out.println("<div class='header-main'>");
            out.println("    <div class='container'>");
            out.println("        <div class='row align-items-center'>");
            out.println("            <div class='col-lg-2 col-auto'>");
            out.println("                <a class='navbar-brand' href='/'>");
            out.println("                    <img src='https://www.priceautoscr.com/PriceAuto/assets/media/general/logo.png' alt='Price Auto Sales'>");
            out.println("                </a>");
            out.println("            </div>");
            out.println("            <div class='col-lg-auto col'>");
            out.println("                <div class='header-contacts d-none d-md-block'>");
            out.println("                    <span>📞 Call Us Today: <a href='tel:+50627794545'>+506 2779 4545</a></span>");
            out.println("                </div>");
            out.println("            </div>");
            out.println("            <div class='col-lg d-none d-lg-block'>");
            out.println("                <nav class='navbar navbar-expand-md justify-content-end'>");
            out.println("                    <ul class='navbar-nav'>");
            out.println("                        <li class='nav-item active'><a class='nav-link' href='menu.jsp'>Home</a></li>");
            out.println("                        <li class='nav-item'><a class='nav-link' href='/inventory'>Inventory</a></li>");
            out.println("                        <li class='nav-item'><a class='nav-link' href='/about'>About</a></li>");
            out.println("                        <li class='nav-item dropdown'>");
            out.println("                            <a class='nav-link dropdown-toggle' href='#' data-toggle='dropdown'>Services</a>");
            out.println("                            <div class='dropdown-menu'>");
            out.println("                                <a class='dropdown-item' href='/contact'>Schedule Appointment</a>");
            out.println("                            </div>");
            out.println("                        </li>");
            out.println("                        <li class='nav-item'><a class='nav-link' href='/dealers'>Locations</a></li>");
            out.println("                        <li class='nav-item'><a class='nav-link' href='/contact'>Contact</a></li>");
            out.println("                    </ul>");
            out.println("                </nav>");
            out.println("            </div>");
            out.println("        </div>");
            out.println("    </div>");
            out.println("</div>");

            out.println("<hr>");

            out.println("<div class='text-center'>");
            out.println("   <div class='container mt-5'>");
            out.println("        <div class='row justify-content-center'>");

            for (Car car : cars) {
                out.println("<div class='col-md-4 mb-3'>");
                out.println("  <div class='card shadow-sm' style='width:18rem;height:25rem'>");
                out.println("         <img src='" + car.Photo + "' />");
                out.println("       <div class='card-body'>");
                out.println("           <h5 class='card-title'>" + car.Brand + " " + car.Model + "</h5>");
                out.println("           <p class='card-text'>Engine: " + car.Engine + "</p>");
                out.println("           <a href='#' class='btn btn-primary'>Ver detalles</a>");
                out.println("       </div>");
                out.println("   </div>");
                out.println("</div>");
            }

            out.println("           </div>");
            out.println("   </div>");
            out.println("</div>");

            out.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js'></script>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(carsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(carsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
