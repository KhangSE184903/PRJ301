<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="dto.BookingDTO"%>
<%@page import="dto.RoomDTO"%>
<%@page import="dto.UserDTO"%>
<%@page import="dao.BookingDAO"%>
<%
    List<BookingDTO> bookingList = (List<BookingDTO>) request.getAttribute("bookingList");
    String errorMessage = (String) request.getAttribute("errorMessage");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date currentDate = new Date();
    UserDTO user = (UserDTO) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Danh sách đặt phòng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="assets/css/viewBookings.css"/>
        <script>
            function confirmCancel(bookingId) {
                if (confirm("Bạn có chắc chắn muốn hủy đặt phòng này không?")) {
                    document.getElementById('cancelForm_' + bookingId).submit();
                }
            }
        </script>
    </head>
    <body>
        <div class="main-content">
            <div class="container">
                <h2>Danh sách đặt phòng của bạn</h2>
                <a href="<%= request.getContextPath()%>/home.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Quay lại trang chủ</a>

                <% if (errorMessage != null) {%>
                <p class="error-message"><%= errorMessage%></p>
                <% } %>

                <% if (bookingList == null || bookingList.isEmpty()) { %>
                <p class="no-booking">Bạn chưa có đặt phòng nào.</p>
                <% } else { %>
                <table class="booking-table">
                    <thead>
                        <tr>
                            <th>Tên phòng</th>
                            <th>Ngày nhận</th>
                            <th>Ngày trả</th>
                            <th>Giá</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (BookingDTO booking : bookingList) {
                                RoomDTO room = booking.getRoom();
                                String statusClass = "";
                                String displayStatus = "";

                                if (BookingDAO.STATUS_CANCELLED.equals(booking.getStatus())) {
                                    statusClass = "cancelled";
                                    displayStatus = "Đã hủy";
                                } else if (BookingDAO.STATUS_PAID.equals(booking.getStatus()) || BookingDAO.STATUS_CONFIRMED.equals(booking.getStatus())) {
                                    statusClass = "success";
                                    displayStatus = "Đã thanh toán"; // Gộp Paid và Confirmed thành "Đã thanh toán"
                                } else if (BookingDAO.STATUS_PENDING_PAYMENT.equals(booking.getStatus())) {
                                    statusClass = "pending";
                                    displayStatus = "Chờ thanh toán";
                                } else if (currentDate.after(booking.getCheckOutDate())) {
                                    statusClass = "completed";
                                    displayStatus = "Đã ở";
                                }
                        %>
                        <tr>
                            <td><%= room != null ? room.getName() : "Không xác định"%></td>
                            <td><%= sdf.format(booking.getCheckInDate())%></td>
                            <td><%= sdf.format(booking.getCheckOutDate())%></td>
                            <td class="price"><%= String.format("%,.0f", booking.getTotalPrice())%> VND</td>
                            <td class="status <%= statusClass%>"><%= displayStatus%></td>
                            <td class="actions">
                                <% if (BookingDAO.STATUS_PENDING_PAYMENT.equals(booking.getStatus()) && currentDate.before(booking.getCheckOutDate())) {%>
                                <!-- Nút Thanh toán -->
                                <form id="paymentForm_<%= booking.getId()%>" action="<%= request.getContextPath()%>/processPayment" method="post" style="display:inline;">
                                    <input type="hidden" name="bookingId" value="<%= booking.getId()%>">
                                    <input type="hidden" name="amount" value="<%= booking.getTotalPrice()%>">
                                    <button type="submit" class="btn pay"><i class="fas fa-credit-card"></i> Thanh toán</button>
                                </form>
                                <!-- Nút Hủy -->
                                <form id="cancelForm_<%= booking.getId()%>" action="<%= request.getContextPath()%>/cancelBooking" method="post" style="display:inline;">
                                    <input type="hidden" name="bookingId" value="<%= booking.getId()%>">
                                    <button type="button" class="btn cancel" onclick="confirmCancel('<%= booking.getId()%>')"><i class="fas fa-times"></i> Hủy</button>
                                </form>
                                <% } %>
                                <!-- Nút Xem -->
                                <% if (room != null) {%>
                                <form action="<%= request.getContextPath()%>/room-details" method="get" style="display:inline;">
                                    <input type="hidden" name="roomId" value="<%= room.getId()%>">
                                    <button type="submit" class="btn view"><i class="fas fa-eye"></i> Xem</button>
                                </form>
                                <% } %>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% }%>
            </div>
        </div>
    </body>
</html>