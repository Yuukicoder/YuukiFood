/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Roles;
import model.User;

/**
 *
 * @author Admin
 */
public class Profile extends HttpServlet {
   
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
         HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("login");
        } else {
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
        
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
        processRequest(request, response);
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
//        String pass = request.getParameter("pass");
        String id = request.getParameter("id");
        UserDAO udao = new UserDAO();
        HttpSession session = request.getSession();
        try {
            udao.UpdateUser(name, email, phone, address, Integer.valueOf(gender), Integer.valueOf(id));
            User u = new User(name, email, "", address, phone, new Roles(1));
            u.setUserId(Integer.valueOf(id));
            session.removeAttribute("account");
            session.setAttribute("account", u);
            request.setAttribute("mess", "UpdateSuccess");
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);

        } catch (Exception e) {
            response.getWriter().println(e);
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
