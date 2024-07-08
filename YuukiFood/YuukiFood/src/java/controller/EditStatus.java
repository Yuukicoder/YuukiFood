/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.OrderDetailsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class EditStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newStatus = request.getParameter("newStatus");
        String editStatusOrderId = request.getParameter("editStatusOrderId");
        String editStatusUserId = request.getParameter("editStatusUserId");
        int details_id = 0;
        if (editStatusOrderId != null && !editStatusOrderId.isEmpty()) {
            details_id = Integer.parseInt(editStatusOrderId);
        }
        OrderDetailsDAO oDao = new OrderDetailsDAO();
        if (newStatus.equalsIgnoreCase("Preparing")) {
            oDao.updateStatusOrder(1, details_id);
        } else if (newStatus.equalsIgnoreCase("Done")) {
            oDao.updateStatusOrder(2, details_id);
        } else if (newStatus.equalsIgnoreCase("Cancelled")) {
            oDao.updateStatusOrder(3, details_id);
        }
        request.getRequestDispatcher("./ManagerOrder?uid=" + editStatusUserId).forward(request, response);
    }

}
