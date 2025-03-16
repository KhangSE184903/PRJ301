
// Xử lý gửi form
document.getElementById('contactForm').addEventListener('submit', function (e) {
    e.preventDefault();
    alert('Cảm ơn bạn đã gửi tin nhắn! Chúng tôi sẽ liên hệ lại sớm nhất.');
    this.reset();
});

// Hiệu ứng cuộn lên đầu trang
function scrollToTop() {
    window.scrollTo({top: 0, behavior: 'smooth'});
}

// Hiển thị nút quay lại đầu trang khi cuộn
window.onscroll = function () {
    const backToTopButton = document.querySelector('.back-to-top');
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        backToTopButton.style.display = 'block';
    } else {
        backToTopButton.style.display = 'none';
    }
};
        