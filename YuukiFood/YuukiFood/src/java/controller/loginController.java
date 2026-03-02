package controller;

import DAO.MD5;
import DAO.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Roles;
import model.User;

public class loginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            String email = request.getParameter("email");
            String pass = request.getParameter("pass");

            UserDAO udao = new UserDAO();
            MD5 md5 = new MD5();

            // 🔥 Mã hoá password người dùng nhập
            String hashedPassword = md5.getMd5(pass);

            ArrayList<User> userList = udao.getAllUser();

            User foundUser = null;

            // 🔥 So sánh email + password đã mã hoá
            for (User user : userList) {
                if (user.getEmail().equals(email)
                        && user.getPassword().equals(hashedPassword)) {
                    foundUser = user;
                    break;
                }
            }

            if (foundUser != null) {

                session.setAttribute("account", foundUser);

                Roles usRole = foundUser.getRoles();

                if (usRole.getRoleId() == 2) {
                    response.sendRedirect("./AdminHomePage");
                } else if (usRole.getRoleId() == 3) {
                    response.sendRedirect("./StaffHomePage");
                } else {
                    response.sendRedirect("./HomePage");
                }

            } else {
                request.setAttribute("mess", "Email or password wrong!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mess", "System error!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Controller";
    }
}