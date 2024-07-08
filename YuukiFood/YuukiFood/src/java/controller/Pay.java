package controller;

import DAO.BillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Bills;

public class Pay extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Pay</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Pay at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int user_id = Integer.parseInt(request.getParameter("pid"));
            out.print("User ID: " + user_id + "<br>");

            BillDAO billDAO = new BillDAO();
            ArrayList<Bills> listBill = billDAO.getBillByUserId(user_id, "1990-01-01", "2990-01-01");
            out.print("List of Bills: " + listBill + "<br><br>");
            out.print("orderId " + listBill.get(1).getOrder_id());

            int order_id;
            for (int i = 0; i < listBill.size(); i++) {

                order_id = listBill.get(i).getOrder_id();
                out.print("order_id: " + order_id);
                String product = listBill.get(i).getProduct_name();
                
                float price = (float) listBill.get(i).getPrice();
                int quantity = listBill.get(i).getQuantity();
                billDAO.addStatistics(order_id, product, price, quantity);
//                billDAO.deleteOrder(order_id);
                
            }
            billDAO.deleteOrderDetail(listBill.get(0).getOrder_id());

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }
        request.getRequestDispatcher("ManagerOrder").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
