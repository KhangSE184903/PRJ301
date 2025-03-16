<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.NotificationDTO"%>
<%@page import="dao.NotificationDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông báo</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="assets/css/notifications.css"/>
    </head>
    <body>
        <div class="header-container">
            <%@include file="header.jsp" %>
        </div>

        <div class="main-content">
            <div class="notifications-container">
                <h2>Thông báo</h2>
                <a href="<%= request.getContextPath()%>/home.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Quay lại trang chủ</a>

                <%
                    if (user == null) {
                %>
                <p class="no-notifications">Vui lòng đăng nhập để xem thông báo!</p>
                <%
                } else {
                    NotificationDAO notificationDAO = new NotificationDAO();
                    List<NotificationDTO> notifications = notificationDAO.getNotificationsByUserId(user.getUserID());
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    if (notifications.isEmpty()) {
                %>
                <p class="no-notifications">Bạn chưa có thông báo nào.</p>
                <%
                } else {
                %>
                <div class="notification-list">
                    <% for (NotificationDTO notification : notifications) {%>
                    <div class="notification-item <%= notification.isIsRead() ? "" : "unread"%>">
                        <p class="message"><%= notification.getMessage()%></p>
                        <p class="timestamp"><small><%= dateFormat.format(notification.getCreatedAt())%></small></p>
                                <% if (!notification.isIsRead()) {%>
                        <button class="btn-mark-read" onclick="markAsRead(<%= notification.getNotificationId()%>)">Đánh dấu đã đọc</button>
                        <% } %>
                    </div>
                    <% } %>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>

        <div class="footer-container">
            <%@include file="footer.jsp" %>
        </div>

        <script src="assets/js/notifications.js"/>

    </body>
</html>