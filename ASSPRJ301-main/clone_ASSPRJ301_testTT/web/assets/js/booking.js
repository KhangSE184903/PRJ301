
let currentIndex = 0;
        const images = document.querySelectorAll('.room-slideshow img');
        function showImage(index) {
        images.forEach((img, i) => {
        img.classList.remove('active');
                if (i === index) {
        img.classList.add('active');
        }
        });
        }

function changeImage(direction) {
currentIndex += direction;
        if (currentIndex < 0) {
currentIndex = images.length - 1;
} else if (currentIndex >= images.length) {
currentIndex = 0;
}
showImage(currentIndex);
}

showImage(currentIndex);
        function validateForm() {
        let checkIn = new Date(document.getElementById("checkInDate").value);
                let checkOut = new Date(document.getElementById("checkOutDate").value);
                let today = new Date();
                if (checkIn < today) {
        alert("Ngày nhận phòng phải từ hôm nay trở đi.");
                return false;
        }
        if (checkOut <= checkIn) {
        alert("Ngày trả phòng phải sau ngày nhận phòng.");
                return false;
        }
        return true;
        }

function calculateTotal() {
let pricePerNight = <%= room.getPrice() %>;
let checkIn = new Date(document.getElementById("checkInDate").value);
let checkOut = new Date(document.getElementById("checkOutDate").value);

if (!isNaN(checkIn.getTime()) && !isNaN(checkOut.getTime()) && checkOut > checkIn) {
        let nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));
        let totalPrice = pricePerNight * nights;
        document.getElementById("total-price").innerText = totalPrice.toLocaleString();
} else {
        document.getElementById("total-price").innerText = "0";
}
}

function checkAvailability() {
        let roomId = <%= room != null ? room.getId() : -1 %>;
let checkInDate = document.getElementById("checkInDate").value;
let checkOutDate = document.getElementById("checkOutDate").value;
let bookButton = document.getElementById("bookButton");
let availabilityMessage = document.getElementById("availability-message");

calculateTotal(); // Tính tổng tiền khi thay đổi ngày

if (checkInDate && checkOutDate) { //Kiem tra xem con trong khong va in truc tiep len mh
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "checkAvailability?roomId=" + roomId + "&checkInDate=" + checkInDate + "&checkOutDate=" + checkOutDate, true);
        xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
        let response = JSON.parse(xhr.responseText);
                if (response.available) {
        availabilityMessage.style.display = "block";
                availabilityMessage.className = "availability-message available";
                availabilityMessage.innerText = "Phòng còn trống";
                bookButton.disabled = false;
} else {
                availabilityMessage.style.display = "block";
                availabilityMessage.className = "availability-message unavailable";
                availabilityMessage.innerText = "Phòng đã được đặt";
                bookButton.disabled = true;
}
} else if (xhr.readyState === 4) {
                availabilityMessage.style.display = "block";
                availabilityMessage.className = "availability-message error";
                availabilityMessage.innerText = "Lỗi khi kiểm tra trạng thái phòng";
                bookButton.disabled = true;
}
};
xhr.send();
} else {
                availabilityMessage.style.display = "none";
                bookButton.disabled = true;
}
}
