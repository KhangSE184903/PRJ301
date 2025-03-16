<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập & Đăng ký</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="assets/css/login-regis.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %> 

        <div class="login-container">
            <!-- Form đăng nhập -->
            <div class="form-wrapper" id="loginForm">
                <h2 class="form-title">Đăng nhập</h2>
                <form action="login" method="post">
                    <input type="hidden" name="action" value="login" />
                    <div class="form-group">
                        <label for="userId">Tên đăng nhập</label>
                        <input type="text" id="userId" name="txtUsername" required />
                        <i class="fas fa-user"></i>
                        <% if (request.getAttribute("errorUsername") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorUsername")%></p>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="txtPassword" required />
                        <i class="fas fa-lock"></i>
                        <% if (request.getAttribute("errorPassword") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorPassword")%></p>
                        <% } %>
                    </div>
                    <button type="submit" class="submit-btn">Đăng nhập</button>
                    <% if (request.getAttribute("errorMessage") != null) {%>
                    <p class="error-message"><%= request.getAttribute("errorMessage")%></p>
                    <% }%>
                </form>
                <p class="switch-form">Chưa có tài khoản? <a href="#" onclick="showRegister()">Đăng ký ngay</a></p>
            </div>

            <!-- Form đăng ký -->
            <div class="form-wrapper <%= request.getAttribute("showRegisterForm") != null && (boolean) request.getAttribute("showRegisterForm") ? "" : "hidden"%>" id="registerForm">
                <h2 class="form-title">Đăng ký</h2>
                <form action="register" method="post">
                    <div class="form-group">
                        <label for="newUsername">Tên đăng nhập</label>
                        <input type="text" id="newUsername" name="txtNewUsername" value="<%= request.getParameter("txtNewUsername") != null ? request.getParameter("txtNewUsername") : ""%>" required />
                        <i class="fas fa-user"></i>
                        <% if (request.getAttribute("errorNewUsername") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorNewUsername")%></p>
                        <% }%>
                    </div>
                    <div class="form-group">
                        <label for="fullName">Họ và tên</label>
                        <input type="text" id="fullName" name="txtFullName" value="<%= request.getParameter("txtFullName") != null ? request.getParameter("txtFullName") : ""%>" required />
                        <i class="fas fa-id-card"></i>
                        <% if (request.getAttribute("errorFullName") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorFullName")%></p>
                        <% }%>
                    </div>
                    <div class="form-group">
                        <label for="gmail">Gmail</label>
                        <input type="email" id="gmail" name="txtGmail" value="<%= request.getParameter("txtGmail") != null ? request.getParameter("txtGmail") : ""%>" />
                        <i class="fas fa-envelope"></i>
                        <% if (request.getAttribute("errorGmail") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorGmail")%></p>
                        <% }%>
                    </div>
                    <div class="form-group">
                        <label for="sdt">Số điện thoại</label>
                        <input type="text" id="sdt" name="txtSdt" value="<%= request.getParameter("txtSdt") != null ? request.getParameter("txtSdt") : ""%>" />
                        <i class="fas fa-phone"></i>
                        <% if (request.getAttribute("errorSdt") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorSdt")%></p>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Mật khẩu</label>
                        <input type="password" id="newPassword" name="txtNewPassword" required />
                        <i class="fas fa-lock"></i>
                        <% if (request.getAttribute("errorNewPassword") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorNewPassword")%></p>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Nhập lại mật khẩu</label>
                        <input type="password" id="confirmPassword" name="txtConfirmPassword" required />
                        <i class="fas fa-lock"></i>
                        <% if (request.getAttribute("errorConfirmPassword") != null) {%>
                        <p class="error-message"><%= request.getAttribute("errorConfirmPassword")%></p>
                        <% } %>
                    </div>
                    <button type="submit" class="submit-btn">Đăng ký</button>
                    <% if (request.getAttribute("errorMessage") != null) {%>
                    <p class="error-message"><%= request.getAttribute("errorMessage")%></p>
                    <% } %>
                    <% if (request.getAttribute("successMessage") != null) {%>
                    <p class="success-message"><%= request.getAttribute("successMessage")%></p>
                    <% }%>
                </form>
                <p class="switch-form">Đã có tài khoản? <a href="#" onclick="showLogin()">Đăng nhập</a></p>
            </div>
        </div>

        <%@include file="footer.jsp" %> 

        <script src="assets/js/login-regis.js"/>

    </body>
</html>