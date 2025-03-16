<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.RoomDTO"%>
<%@page import="dao.RoomDAO"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Tìm kiếm Homestay</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="assets/css/search.css"/>
    </head>
    <body>

        <div class="main-content">
            <!-- Phần lọc bên trái -->
            <div class="search-container">
                <h2>Tìm kiếm Homestay</h2>
                <a href="<%= request.getContextPath()%>/home.jsp" class="back-link">← Quay lại trang chủ</a>

                <div class="filter-section">
                    <div class="filter-group">
                        <label>Tên Homestay:</label>
                        <input type="text" id="searchName" placeholder="Nhập tên homestay">
                    </div>

                    <div class="price-filter">
                        <label>Giá:</label>
                        <div class="slider-container">
                            <div class="range" id="priceRange"></div>
                            <input type="range" id="minPrice" min="1000000" max="10000000" value="1000000">
                            <input type="range" id="maxPrice" min="1000000" max="10000000" value="10000000">
                        </div>
                        <div class="price-values">
                            <span id="minPriceValue">1.000.000đ</span>
                            <span id="maxPriceValue">10.000.000đ</span>
                        </div>
                    </div>

                    <div class="filter-group">
                        <label>Tiện ích:</label>
                        <select id="amenities">
                            <option value="">Tất cả</option>
                            <option value="WiFi">WiFi</option>
                            <option value="Bể bơi">Bể bơi</option>
                            <option value="Gym">Gym</option>
                        </select>
                    </div>

                    <button id="filterBtn">Lọc ngay</button>
                </div>
            </div>

            <!-- Phần danh sách phòng bên phải -->
            <div class="room-list-container">
                <div id="roomList" class="room-list">
                    <%
                        RoomDAO roomDAO = new RoomDAO();
                        List<RoomDTO> rooms = roomDAO.getAllRooms();
                        for (RoomDTO room : rooms) {
                    %>
                    <div class="room-item">
                        <img src="<%= room.getImageUrl()%>" alt="Hình ảnh phòng">
                        <h3><%= room.getName()%></h3>
                        <p><%= room.getDescription() != null ? room.getDescription() : "Chưa có mô tả"%></p>
                        <p>Giá: <%= String.format("%,.0f", room.getPrice())%> VND</p>
                        <p>Tiện ích: <%= room.getAmenities() != null ? room.getAmenities() : "Chưa có tiện ích"%></p>
                        <p>Đánh giá: <%= room.getRatings()%>/5</p>
                        <button onclick="roomDetails(<%= room.getId()%>)">Xem chi tiết</button>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>

        <script src="assets/js/search.js"/>

    </body>
</html>