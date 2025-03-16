
$(document).ready(function () {
    const minPriceSlider = document.getElementById("minPrice");
    const maxPriceSlider = document.getElementById("maxPrice");
    const minPriceValue = document.getElementById("minPriceValue");
    const maxPriceValue = document.getElementById("maxPriceValue");
    const priceRange = document.getElementById("priceRange");

    const minPrice = 1000000; // 1 triệu
    const maxPrice = 10000000; // 10 triệu

    function formatPrice(price) {
        return price.toLocaleString("vi-VN") + "đ";
    }

    function updatePriceRange() {
        const minVal = parseInt(minPriceSlider.value);
        const maxVal = parseInt(maxPriceSlider.value);

        // Đảm bảo min không lớn hơn max
        if (minVal > maxVal) {
            minPriceSlider.value = maxVal;
            return;
        }
        if (maxVal < minVal) {
            maxPriceSlider.value = minVal;
            return;
        }

        // Cập nhật giá trị hiển thị
        minPriceValue.textContent = formatPrice(minVal);
        maxPriceValue.textContent = formatPrice(maxVal);

        // Cập nhật thanh range
        const minPercent = ((minVal - minPrice) / (maxPrice - minPrice)) * 100;
        const maxPercent = ((maxVal - minPrice) / (maxPrice - minPrice)) * 100;
        priceRange.style.left = minPercent + "%";
        priceRange.style.width = (maxPercent - minPercent) + "%";
    }

    minPriceSlider.addEventListener("input", updatePriceRange);
    maxPriceSlider.addEventListener("input", updatePriceRange);

    // Khởi tạo giá trị ban đầu
    updatePriceRange();

    $("#filterBtn").click(function () {
        var searchName = $("#searchName").val();
        var minPrice = $("#minPrice").val();
        var maxPrice = $("#maxPrice").val();
        var amenities = $("#amenities").val();

        $.ajax({
            url: "RoomFilterServlet",
            type: "GET",
            data: {
                searchName: searchName,
                minPrice: minPrice,
                maxPrice: maxPrice,
                amenities: amenities
            },
            success: function (response) {
                $("#roomList").html(response);
            }
        });
    });
});

function roomDetails(roomId) {
    window.location.href = "room-details?roomId=" + roomId;
}

