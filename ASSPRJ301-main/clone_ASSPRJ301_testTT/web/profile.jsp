<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.UserDTO"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Cập nhật thông tin cá nhân</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="assets/css/profile.css"/>
    </head>
    <body>
        <div class="header-container">
            <%@include file="header.jsp" %>
        </div>

        <div class="main-content">
            <%
                // Lấy user từ session
                if (user == null) {
                    response.sendRedirect("login-regis.jsp"); // Chuyển hướng tới login-regis.jsp theo Servlet
                    return;
                }
                String section = request.getParameter("section") != null ? request.getParameter("section") : "profile";
            %>
            <div class="sidebar">
                <h3>Tài khoản: <%= user.getUserID()%></h3>
                <a href="<%= request.getContextPath()%>/profile?section=profile" class="<%= section.equals("profile") ? "active" : ""%>">
                    <i class="fas fa-user"></i> Thông tin cá nhân
                </a>
                <a href="<%= request.getContextPath()%>/profile?section=security" class="<%= section.equals("security") ? "active" : ""%>">
                    <i class="fas fa-shield-alt"></i> Bảo mật
                </a>
            </div>

            <div class="content-area">
                <% if (section.equals("profile")) { %>
                <div class="form-container">
                    <h2>Cập nhật thông tin cá nhân</h2>
                    <%
                        String successMessage = (String) request.getAttribute("successMessage");
                        String errorMessage = (String) request.getAttribute("errorMessage");
                    %>
                    <% if (successMessage != null) {%>
                    <div class="message success"><%= successMessage%></div>
                    <% } %>
                    <% if (errorMessage != null) {%>
                    <div class="message error"><%= errorMessage%></div>
                    <% }%>
                    <form action="<%= request.getContextPath()%>/updateProfile" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="userId" value="<%= user.getUserID()%>">
                        <div class="form-group">
                            <label for="fullName">Họ và tên:</label>
                            <input type="text" id="fullName" name="fullName" value="<%= user.getFullName() != null ? user.getFullName() : ""%>">
                            <i class="fas fa-id-card"></i>
                            <% if (request.getAttribute("errorFullName") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorFullName")%></div>
                            <% }%>
                        </div>
                        <div class="form-group">
                            <label for="gmail">Gmail:</label>
                            <input type="email" id="gmail" name="gmail" value="<%= user.getGmail() != null ? user.getGmail() : ""%>">
                            <i class="fas fa-envelope"></i>
                            <% if (request.getAttribute("errorGmail") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorGmail")%></div>
                            <% }%>
                        </div>
                        <div class="form-group">
                            <label for="sdt">Số điện thoại:</label>
                            <input type="text" id="sdt" name="sdt" value="<%= user.getSdt() != null ? user.getSdt() : ""%>">
                            <i class="fas fa-phone"></i>
                            <% if (request.getAttribute("errorSdt") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorSdt")%></div>
                            <% } %>
                        </div>
                        <div class="form-group">
                            <label for="avatar">Avatar:</label>
                            <input type="file" id="avatar" name="avatar" accept="image/*">
                            <% if (request.getAttribute("errorAvatar") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorAvatar")%></div>
                            <% } %>
                            <% if (user.getAvatarUrl() != null && !user.getAvatarUrl().isEmpty()) {%>
                            <div class="current-avatar">
                                <img src="<%= user.getAvatarUrl()%>" alt="Avatar hiện tại">
                                <span>Avatar hiện tại</span>
                            </div>
                            <% } else { %>
                            <div class="current-avatar">
                                <span>Không có avatar</span>
                            </div>
                            <% } %>
                        </div>
                        <button type="submit">Cập nhật</button>
                    </form>
                </div>
                <% } else if (section.equals("security")) { %>
                <div class="form-container">
                    <h2>Đổi mật khẩu</h2>
                    <%
                        String changePassSuccess = (String) request.getAttribute("changePassSuccess");
                        String changePassError = (String) request.getAttribute("changePassError");
                    %>
                    <% if (changePassSuccess != null) {%>
                    <div class="message success"><%= changePassSuccess%></div>
                    <% } %>
                    <% if (changePassError != null) {%>
                    <div class="message error"><%= changePassError%></div>
                    <% }%>
                    <form action="<%= request.getContextPath()%>/changePassword" method="post">
                        <input type="hidden" name="userId" value="<%= user.getUserID()%>">
                        <div class="form-group">
                            <label for="currentPassword">Mật khẩu hiện tại:</label>
                            <input type="password" id="currentPassword" name="currentPassword" required>
                            <i class="fas fa-lock"></i>
                            <% if (request.getAttribute("errorCurrentPassword") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorCurrentPassword")%></div>
                            <% } %>
                        </div>
                        <div class="form-group">
                            <label for="newPassword">Mật khẩu mới:</label>
                            <input type="password" id="newPassword" name="newPassword" required>
                            <i class="fas fa-lock"></i>
                            <% if (request.getAttribute("errorNewPassword") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorNewPassword")%></div>
                            <% } %>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                            <i class="fas fa-lock"></i>
                            <% if (request.getAttribute("errorConfirmPassword") != null) {%>
                            <div class="message error"><%= request.getAttribute("errorConfirmPassword")%></div>
                            <% } %>
                        </div>
                        <button type="submit">Đổi mật khẩu</button>
                    </form>
                </div>
                <% }%>
            </div>
        </div>

        <div class="footer-container">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>