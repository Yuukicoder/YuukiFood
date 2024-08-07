/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BillDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class ManagerOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet ManagerOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerOrder at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
      
            String uid = request.getParameter("uid") == null || request.getParameter("uid").isEmpty() ? "0" : request.getParameter("uid");
            String fdate = request.getParameter("fdate") == null ? "1920-05-05" : request.getParameter("fdate");
            String tdate = request.getParameter("tdate") == null ? "3020-05-05" : request.getParameter("tdate");
            BillDAO bDao = new BillDAO();
            HttpSession session = request.getSession();
            Object object = session.getAttribute("account");
            User u = (User) object;
            if (u.getRoles().getRoleId() == 2) {
                int uid_num = Integer.parseInt(uid);
                ArrayList<Bills> ol = bDao.getBillByUserId(uid_num, fdate, tdate);
                UserDAO udao = new UserDAO();
                ArrayList<User> userList = udao.getAllUser();
                request.setAttribute("pl", userList);
                int bill = 0;
                for (int i = 0; i < ol.size(); i++) {
                    bill += (ol.get(i).getPrice() * ol.get(i).getQuantity());
                }
                request.setAttribute("total_bill", bill);
                request.setAttribute("userIdOrder", uid_num);
                request.setAttribute("ol", ol);
//        response.getWriter().println(u.getId());
                request.getRequestDispatcher("managerorder.jsp").forward(request, response);
            } else if (u.getRoles().getRoleId() == 3) {
                int uid_num = Integer.parseInt(uid);
                ArrayList<Bills> ol = bDao.getBillByUserId(uid_num, fdate, tdate);
                UserDAO udao = new UserDAO();
                ArrayList<User> userList = udao.getAllUser();
                request.setAttribute("pl", userList);
                int bill = 0;
                for (int i = 0; i < ol.size(); i++) {
                    bill += (ol.get(i).getPrice() * ol.get(i).getQuantity());
                }
                request.setAttribute("total_bill", bill);
                request.setAttribute("userIdOrder", uid_num);
                request.setAttribute("ol", ol);
//        response.getWriter().println(u.getId());
                request.getRequestDispatcher("staffManagerOrder.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String uid = request.getParameter("uid") == null || request.getParameter("uid").isEmpty() ? "0" : request.getParameter("uid");
            String fdate = request.getParameter("fdate") == null ? "1920-05-05" : request.getParameter("fdate");
            String tdate = request.getParameter("tdate") == null ? "3020-05-05" : request.getParameter("tdate");
            BillDAO bDao = new BillDAO();
            HttpSession session = request.getSession();

            Object object = session.getAttribute("account");
            User u = (User) object;
            int uid_num = Integer.parseInt(uid);
            ArrayList<Bills> ol = bDao.getBillByUserId(uid_num, fdate, tdate);
            UserDAO udao = new UserDAO();
            ArrayList<User> userList = udao.getAllUser();
            request.setAttribute("pl", userList);
            request.setAttribute("userIdOrder", uid_num);
            request.setAttribute("ol", ol);
//        response.getWriter().println(u.getId());
            request.getRequestDispatcher("managerorder.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().print(e);
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
