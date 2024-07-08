<%-- 
    Document   : UpdateUser
    Created on : Jul 1, 2024, 2:30:35 AM
    Author     : 84777
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="CheckAdminRole.jsp" %>
    <body>
        <div class="d-flex justify-content-center">
            <div>
                <h1>Update person</h1>
                <form action="UpdateUser" method="post" class="form-min-width">
                    <input type="hidden" name="user_id" value="${user_id}">


                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="username" value="${userUpdate.userName}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" name="email" class="form-control" id="email" placeholder="email" value="${userUpdate.email}" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="password"  required>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" id="address" value="${userUpdate.address}" required>
                    </div>

                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender: </label><br>
                        <input type="radio" id="male" name="gender" value="Male" ${userUpdate.gender == "Male" ? "checked" : ""}>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="Female" ${userUpdate.gender == "Female" ? "checked" : ""}>
                        <label for="female">Female</label>
                    </div>

                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select name="role" class="form-select">
                            <c:forEach var="role" items="${roleList}">
                                <option value="${role.roleId}" ${userUpdate.roles.roleId == role.roleId ? "selected" : ""}>
                                    ${role.roleName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>





                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="phone" value="${userUpdate.phone}"  required>
                    </div>


                    <input type="submit" class="btn btn-primary" value="Update" />
                </form>
            </div>
        </div>
    </body>
</html>
