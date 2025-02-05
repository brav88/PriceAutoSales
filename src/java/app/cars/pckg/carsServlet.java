/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package app.cars.pckg;

import app.model.pckg.Car;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            ArrayList<Car> cars = new ArrayList<>();
                        
            Car car1 = new Car("Toyota",
                                "Corolla",
                                2024,   
                                "Black",
                                "1400 CC Turbo",
                                "Gasoline",
                                23000);
            
            Car car2 = new Car("Toyota",
                                "Rav4",
                                2023,   
                                "Grey",
                                "2300 CC",
                                "Diesel",
                                12987);
            
            cars.add(car1);
            cars.add(car2);
                                    
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Lista de Vehículos</title>");
            out.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
            out.println("</head>");
            out.println("<body class='bg-light'>");

            out.println("<div class='container mt-4'>");
            out.println("<h1 class='text-center mb-4'>Lista de Vehículos</h1>");
            out.println("<div class='row'>"); 

            for (Car car : cars) {
                out.println("<div class='col-md-4 mb-3'>"); 
                out.println("<div class='card shadow-sm'>");
                out.println("<div class='card-body'>");
                out.println("<h5 class='card-title'>" + car.Brand + "</h5>");
                out.println("<p class='card-text'>" + car.Model + "</p>");
                out.println("<p class='card-text'>" + car.Engine + "</p>");
                out.println("<a href='#' class='btn btn-primary'>Ver detalles</a>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }

            out.println("</div>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
