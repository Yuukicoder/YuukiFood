/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.BillDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class Dashboard extends HttpServlet {
   
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Object object = session.getAttribute("account");
            User u = (User) object;
            if (u.getRoles().getRoleId() == 2) {
                ProductDAO pdao = new ProductDAO();
                OrderDAO odao = new OrderDAO();
                BillDAO bdao = new BillDAO();
                UserDAO udao = new UserDAO();
                int numo = odao.getNumberOrder();
                int nump = pdao.getNumberProduct("", "");
                int numu = udao.getNumberUser();
                double profit = bdao.getTotalProfit();
                request.setAttribute("numo", numo);
                request.setAttribute("nump", nump);
                request.setAttribute("numu", numu);
                request.setAttribute("profit", profit);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);

            }
            else if(u.getRoles().getRoleId() == 3){
                ProductDAO pdao = new ProductDAO();
                OrderDAO odao = new OrderDAO();
                 int numo = odao.getNumberOrder();
                int nump = pdao.getNumberProduct("", "");
                BillDAO bdao = new BillDAO();
                
                double profit = bdao.getTotalProfit();
                request.setAttribute("numo", numo);
                request.setAttribute("nump", nump);
                request.setAttribute("profit", profit);
                request.getRequestDispatcher("StaffDashboard.jsp").forward(request, response);

            }
            else {
                response.sendRedirect("404.html");
            }
        } catch (Exception e) {
            response.sendRedirect("login");

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
        processRequest(request, response);
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
