
function markAsRead(notificationId) {
    $.ajax({
        url: '<%= request.getContextPath()%>/markNotificationAsRead',
        type: 'POST',
        data: {notificationId: notificationId},
        success: function (response) {
            location.reload(); // Làm mới trang để cập nhật giao diện
        },
        error: function () {
            alert('Có lỗi xảy ra khi đánh dấu đã đọc.');
        }
    });
}
        