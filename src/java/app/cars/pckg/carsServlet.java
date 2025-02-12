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

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Lista de Vehículos</title>");
            out.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
            out.println("</head>");
            out.println("<body class='bg-light'>");

            out.println("<div class='text-center'>");
            out.println("   <div class='container mt-5'>");
            out.println("       <h1 class='text-center mb-4'>Lista de Vehículos</h1>");
            out.println("           <div class='row justify-content-center'>");

            for (Car car : cars) {
                out.println("<div class='col-md-4 mb-3'>"); 
                out.println("  <div class='card shadow-sm' style='width:18rem;height:25rem'>");
                out.println("         <img src='" + car.Photo + "' />");
                out.println("       <div class='card-body'>");                
                out.println("           <h5 class='card-title'>" + car.Brand + "</h5>");
                out.println("           <p class='card-text'>" + car.Model + "</p>");
                out.println("           <p class='card-text'>" + car.Engine + "</p>");
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
