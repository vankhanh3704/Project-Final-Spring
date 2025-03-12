document.addEventListener('DOMContentLoaded', function () {
    const filterSelect = document.getElementById('filter');
    const productListBox = document.querySelector('.product__list-box');

    // Lấy danh sách sản phẩm ban đầu
    const products = Array.from(productListBox.querySelectorAll('.product__item'));

    // Hàm sắp xếp danh sách sản phẩm
    function sortProducts(criteria) {
        const sortedProducts = products.slice(); // Tạo bản sao của mảng sản phẩm

        sortedProducts.sort((a, b) => {
            const priceA = parseFloat(a.querySelector('.price').textContent.replace(/[^0-9.-]+/g, ''));
            const priceB = parseFloat(b.querySelector('.price').textContent.replace(/[^0-9.-]+/g, ''));
            const areaA = parseFloat(a.querySelector('.area').textContent.replace(/[^0-9.-]+/g, ''));
            const areaB = parseFloat(b.querySelector('.area').textContent.replace(/[^0-9.-]+/g, ''));

            switch (criteria) {
                case 'cao-thap': // Giá từ cao tới thấp
                    return priceB - priceA;
                case 'thap-cao': // Giá từ thấp tới cao
                    return priceA - priceB;
                case 'dien-tich-tang': // Diện tích tăng dần
                    return areaA - areaB;
                case 'dien-tich-giam': // Diện tích giảm dần
                    return areaB - areaA;
                default: // Mặc định (không sắp xếp)
                    return 0;
            }
        });

        // Xóa danh sách sản phẩm hiện tại
        productListBox.innerHTML = '';

        // Thêm lại danh sách sản phẩm đã sắp xếp
        sortedProducts.forEach(product => {
            productListBox.appendChild(product);
        });
    }

    // Thêm sự kiện change cho dropdown
    filterSelect.addEventListener('change', function () {
        const selectedValue = this.value;
        sortProducts(selectedValue);
    });
});