<%-- 
    Document   : CheckAdminOrStaffRole
    Created on : Jul 2, 2024, 2:40:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%
    if (session.getAttribute("account") == null) {
        request.setAttribute("mess", "Please login first");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        User checkUser = (User) session.getAttribute("account");
        if (checkUser.getRoles().getRoleId() == 1) {
            request.setAttribute("mess", "Your account do not have permission to access");
            session.removeAttribute("account");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } 
    }
%>