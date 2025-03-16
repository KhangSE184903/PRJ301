<%-- 
    Document   : payment-result
    Created on : Mar 14, 2025, 10:38:41 PM
    Author     : cbao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Kết quả thanh toán</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="assets/css/payment-result.css"/>
</head>
<body>
    <div class="message <%= "0".equals(request.getParameter("resultCode")) ? "success" : "error"%>">
        <%= request.getAttribute("message")%>
    </div>
    <a href="<%= request.getContextPath()%>/viewBookings"><i class="fas fa-arrow-left"></i> Quay lại danh sách đặt phòng</a>
</body>
</html>
