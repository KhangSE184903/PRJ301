<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liên hệ - Homestay</title>
        <link rel="stylesheet" href="assets/css/contact.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="contact-container">
            <h2>Liên hệ với chúng tôi</h2>

            <div class="contact-info">
                <h3>Thông tin liên hệ</h3>
                <p><strong>Địa chỉ:</strong> 123 Đường ABC, Quận XYZ, TP. Hồ Chí Minh</p>
                <p><strong>Điện thoại:</strong> 0901 234 567</p>
                <p><strong>Email:</strong> contact@homestay.com</p>
                <p><strong>Giờ làm việc:</strong> 08:00 - 22:00 (Hằng ngày)</p>
            </div>

            <div class="map">
                <h3>Bản đồ</h3>
                <iframe src="https://maps.google.com/maps?width=100%25&height=600&hl=en&q=S702%20Vinhomes%20GrandPark,%20Qu%E1%BA%ADn%209+(HomeStay)&t=&z=14&ie=UTF8&iwloc=B&output=embed" allowfullscreen></iframe>
            </div>

            <div class="contact-form">
                <h3>Gửi tin nhắn cho chúng tôi</h3>
                <form id="contactForm">
                    <input type="text" name="name" placeholder="Họ và tên" required>
                    <input type="email" name="email" placeholder="Email" required>
                    <input type="tel" name="phone" placeholder="Số điện thoại">
                    <textarea name="message" placeholder="Nội dung tin nhắn" rows="5" required></textarea>
                    <button type="submit">Gửi</button>
                </form>
            </div>

            <div class="social-links">
                <h3>Kết nối với chúng tôi</h3>
                <a href="https://www.facebook.com/mamchildrendreamfoundation" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png" alt="Facebook">
                </a>
                <a href="https://www.instagram.com/" target="_blank">
                    <img src="https://cdn.pixabay.com/photo/2016/08/09/17/52/instagram-1581266_640.jpg" alt="Instagram">
                </a>
                <a href="https://zalo.me/" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Icon_of_Zalo.svg/1024px-Icon_of_Zalo.svg.png" alt="Zalo">
                </a>
            </div>

            <div class="faq">
                <h3>Câu hỏi thường gặp</h3>
                <p><strong>1. Tôi có thể đặt phòng qua điện thoại không?</strong> - Có, bạn có thể gọi hotline để đặt phòng nhanh chóng.</p>
                <p><strong>2. Chính sách hoàn hủy như thế nào?</strong> - Vui lòng liên hệ chúng tôi để biết thêm chi tiết.</p>
            </div>
        </div>

        <%@include file="footer.jsp" %>

        <button class="back-to-top" onclick="scrollToTop()">↑</button>

        <script src="assets/js/contact.js"/>

    </body>
</html>