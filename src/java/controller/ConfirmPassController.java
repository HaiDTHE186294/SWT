/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.PasswordUtil;

/**
 *
 * @author trant
 */
public class ConfirmPassController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmPassController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmPassController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        request.getRequestDispatcher("newpassword.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String newpass = request.getParameter("password");
    String cfnewpass = request.getParameter("cfpassword");
    String username = request.getParameter("userName");
    UserDAO dao = new UserDAO();
    
    // Check if the user exists
//    if (dao.getUserByUserName(username) == null) {
//       request.setAttribute("error", "User not found.");
//        request.getRequestDispatcher("newpassword.jsp").forward(request, response);
//        return;
//    }

    // Compare passwords
    if (cfnewpass.equals(newpass)) {
        String hashedPassword = PasswordUtil.hashPasswordBCrypt(newpass);
        dao.updatePassByUserName(hashedPassword, username);
        request.setAttribute("successfully", "Change password successfully!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        request.setAttribute("error", "Passwords do not match.");
        request.getRequestDispatcher("newpassword.jsp").forward(request, response);
    }
}

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
