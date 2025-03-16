<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.RoomDTO, dao.RoomDAO"%>
<%@page import="java.util.List"%>

<%
    String roomIdParam = request.getParameter("roomId");
    RoomDAO roomDAO = new RoomDAO();
    RoomDTO room = null;

    if (roomIdParam != null && !roomIdParam.trim().isEmpty()) {
        int roomId = Integer.parseInt(roomIdParam);
        room = roomDAO.getRoomById(roomId);
    }

    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt phòng - Homestay</title>
        <link rel="stylesheet" href="assets/css/booking.css"
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="header-container">
            <%@include file="header.jsp" %>
        </div>

        <div class="main-content">
            <%
                if (room == null) {
            %>
            <div style="text-align: center; margin-top: 50px;">
                <h2 style="font-size: 28px; color: #2c3e50;">Không tìm thấy thông tin phòng!</h2>
                <a href="home.jsp" class="btn-back">Quay lại trang chủ</a>
            </div>
            <%
            } else {
            %>
            <div class="booking-container">
                <div class="room-slideshow">
                    <%
                        List<String> detailImages = room.getDetailImages();
                        if (detailImages == null || detailImages.isEmpty()) {
                            detailImages = new java.util.ArrayList<>();
                            detailImages.add(room.getImageUrl());
                        } else if (!detailImages.contains(room.getImageUrl())) {
                            detailImages.add(0, room.getImageUrl());
                        }
                        for (int i = 0; i < detailImages.size(); i++) {
                            String imageUrl = detailImages.get(i);
                            String activeClass = (i == 0) ? "active" : "";
                    %>
                    <img src="<%= imageUrl%>" alt="<%= room.getName()%>" class="<%= activeClass%>">
                    <%
                        }
                    %>
                    <button class="prev" onclick="changeImage(-1)">❮</button>
                    <button class="next" onclick="changeImage(1)">❯</button>
                </div>

                <div class="booking-details">
                    <h2>Đặt phòng: <%= room.getName()%></h2>
                    <p><strong>Mô tả:</strong> <%= room.getDescription()%></p>
                    <p><strong>Giá:</strong> <span id="room-price"><%= room.getPrice()%></span> đ / đêm</p>
                    <p><strong>Tiện nghi:</strong> <%= room.getAmenities()%></p>
                    <p><strong>Đánh giá:</strong> <%= room.getRatings()%> ⭐</p>

                    <% if (errorMessage != null) {%>
                    <div class="message error"><%= errorMessage%></div>
                    <% } %>
                    <% if (successMessage != null) {%>
                    <div class="message success"><%= successMessage%></div>
                    <% }%>
                    <div id="availability-message" class="availability-message" style="display: none;"></div>

                    <form action="bookRoom" method="post" onsubmit="return validateForm()" class="booking-form">
                        <input type="hidden" name="roomId" value="<%= room.getId()%>">

                        <label for="checkInDate">Ngày nhận phòng:</label>
                        <input type="date" id="checkInDate" name="checkInDate" required onchange="checkAvailability()">

                        <label for="checkOutDate">Ngày trả phòng:</label>
                        <input type="date" id="checkOutDate" name="checkOutDate" required onchange="checkAvailability()">

                        <p class="total-price"><strong>Tổng tiền:</strong> <span id="total-price">0</span> đ</p>
                        <button type="submit" id="bookButton" class="btn-book" disabled>Xác nhận đặt phòng</button>
                    </form>
                </div>
            </div>
            <%
                }
            %>
        </div>

        <div class="footer-container">
            <%@include file="footer.jsp" %>
        </div>

        <script src="assets/js/booking.js"/>
    </body>
</html>