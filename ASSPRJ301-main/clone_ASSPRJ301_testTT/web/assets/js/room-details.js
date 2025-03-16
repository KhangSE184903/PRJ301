
var currentIndex = 0;
var images = document.querySelectorAll('.room-gallery img');
function showImage(index) {
    images.forEach(function (img, i) {
        img.classList.remove('active');
        if (i === index)
            img.classList.add('active');
    });
}
function changeImage(direction) {
    currentIndex += direction;
    if (currentIndex < 0)
        currentIndex = images.length - 1;
    else if (currentIndex >= images.length)
        currentIndex = 0;
    showImage(currentIndex);
}
showImage(currentIndex);

// Rating Stars
var stars = document.querySelectorAll('.rating-stars .star');
var ratingInput = document.getElementById('rating-value');
stars.forEach(function (star) {
    star.addEventListener('click', function () {
        var value = star.getAttribute('data-value');
        ratingInput.value = value;
        stars.forEach(function (s) {
            s.classList.remove('active');
            if (s.getAttribute('data-value') <= value)
                s.classList.add('active');
        });
    });
});
    