<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<%@include file="CheckAdminRole.jsp" %>

<body style="background-color: #f5f6fa;">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <!-- CARD -->
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-header text-center bg-primary text-white rounded-top-4">
                    <h3 class="mb-0">Update User</h3>
                </div>

                <div class="card-body p-4">

                    <form action="UpdateUser" method="post">
                        <input type="hidden" name="user_id" value="${user_id}">

                        <!-- Username -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Username</label>
                            <input type="text" name="username" class="form-control" 
                                   value="${userUpdate.userName}" required>
                        </div>

                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" class="form-control" 
                                   value="${userUpdate.email}" required>
                        </div>



                        <!-- Address -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Address</label>
                            <input type="text" name="address" class="form-control" 
                                   value="${userUpdate.address}" required>
                        </div>

                        <!-- Gender -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold d-block">Gender</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" value="Male"
                                       ${userUpdate.gender == "Male" ? "checked" : ""}>
                                <label class="form-check-label">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" value="Female"
                                       ${userUpdate.gender == "Female" ? "checked" : ""}>
                                <label class="form-check-label">Female</label>
                            </div>
                        </div>

                        <!-- Role -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Role</label>
                            <select name="role" class="form-select">
                                <c:forEach var="role" items="${roleList}">
                                    <option value="${role.roleId}" 
                                        ${userUpdate.roles.roleId == role.roleId ? "selected" : ""}>
                                        ${role.roleName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Phone -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Phone</label>
                            <input type="text" name="phone" class="form-control" 
                                   value="${userUpdate.phone}" required>
                        </div>

                        <!-- BUTTON -->
                        <div class="d-grid mt-4">
                            <button type="submit" class="btn btn-primary btn-lg rounded-3">
                                Update User
                            </button>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>