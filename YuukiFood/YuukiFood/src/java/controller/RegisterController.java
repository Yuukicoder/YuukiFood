package controller;

import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String genderRaw = request.getParameter("gender");
            String pass = request.getParameter("pass");

            // ===== VALIDATE =====
            if (name == null || email == null || pass == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || pass.trim().isEmpty()) {

                request.setAttribute("messregis", "Please fill all required fields!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            int gender = 1; // default Male
            if (genderRaw != null) {
                gender = Integer.parseInt(genderRaw);
            }

            UserDAO udao = new UserDAO();

            // ===== CHECK EMAIL EXIST =====
            User checkExist = udao.getUserByEmail(email.trim());

            if (checkExist != null) {
                request.setAttribute("messregis", "Email already exists!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // ===== INSERT USER =====
            udao.insertUser(
                    name.trim(),
                    email.trim(),
                    phone,
                    address,
                    pass.trim(),
                    gender
            );

            // ===== SUCCESS =====
            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("messregis", "Register failed! Try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}