
let slideIndex = 0;
const slides = document.querySelectorAll('.slide');

function showSlide(index) {
    slides.forEach(slide => slide.classList.remove('active'));
    slides[index].classList.add('active');
}

function nextSlide() {
    slideIndex = (slideIndex + 1) % slides.length;
    showSlide(slideIndex);
}

// Tự động chuyển slide mỗi 5 giây (5000ms)
setInterval(nextSlide, 5000);

// Hiển thị slide đầu tiên khi tải trang
showSlide(slideIndex);
        