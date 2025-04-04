/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package app.login.pckg;

import app.helper.pckg.databaseHelper;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samuel
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        response.setContentType("text/html;charset=UTF-8");

        String txtEmail = request.getParameter("txtEmail");
        String txtPwd = request.getParameter("txtPwd");

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        databaseHelper database = new databaseHelper();

        ResultSet rs = database.validateLogin(txtEmail, txtPwd);

        if (rs.next()) {
            session = request.getSession();
            session.setAttribute("email", txtEmail);
            session.setAttribute("owner_id", rs.getInt("id"));
            session.setAttribute("user_status", rs.getInt("user_status"));
           
            String path = "";
            if (rs.getInt("user_status") == 1) {
                path = "menu.jsp";
            }
            if (rs.getInt("user_status") == 0) {
                path = "adminPage.jsp";
            }
            
            database.close();
            RequestDispatcher rd = request.getRequestDispatcher(path);
            rd.forward(request, response);

            return;
        }

        RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=Incorrect Credentials");
        rd.forward(request, response);
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
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
