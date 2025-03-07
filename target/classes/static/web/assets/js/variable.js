document.addEventListener('DOMContentLoaded', () => {
    const expandBtn = document.getElementById('expandBtn');
    const iconLoadMore = document.querySelector("#loadMoreBtn i")
    const loadMoreBtn = document.getElementById('loadMoreBtn');
    const content = document.getElementById('content');
    console.log(loadMoreBtn);
    // Dữ liệu mẫu từ API hoặc cơ sở dữ liệu
    const data = [
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        {
            image: 'assets/images/building-1.jpg',
            label: 'VIP',
            title: 'Bán CH giá tốt view sông đẹp tại Q7',
            price: '2,97 tỷ',
            area: '67 m²',
            address: 'Quận 7, Hồ Chí Minh'
        },
        // ... Thêm các đối tượng dữ liệu khác
    ];

    let itemsToShow = 8;
    let currentIndex = 0;

    function renderBoxes() {
        const fragment = document.createDocumentFragment(); // Tạo một DocumentFragment để thêm các phần tử mới
        for (let i = currentIndex; i < currentIndex + itemsToShow && i < data.length; i++) {
            const boxData = data[i];
            const newBox = document.createElement('div');
            newBox.classList.add('col-xl-3');
            newBox.classList.add('col-lg-3');
            newBox.classList.add('col-md-6');
            newBox.classList.add('col-sm-6');
            newBox.classList.add('col-6');
            newBox.innerHTML = `
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${boxData.image}" alt="">
                        <div class="mua-ban-bds__image--label">${boxData.label}</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            ${boxData.title}
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">${boxData.price}</span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area">${boxData.area}</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> ${boxData.address}
                        </div>
                    </div>
                </a>
            `;
            fragment.appendChild(newBox); // Thêm phần tử mới vào DocumentFragment
        }
        content.appendChild(fragment); // Thêm DocumentFragment vào vùng chứa
        currentIndex += itemsToShow;
        console.log(content);
        console.log('currentIndex:', currentIndex);
        console.log('data.length:', data.length);

        // Hiển thị hoặc ẩn các nút dựa trên trạng thái hiện tại
        if (currentIndex >= data.length) {
            expandBtn.style.display = 'none';
            iconLoadMore.style.display = 'none';
            loadMoreBtn.style.display = 'block';
        } else {
            expandBtn.style.display = 'block';
            iconLoadMore.style.display = 'block';
            loadMoreBtn.style.display = 'none';
        }

        console.log('expandBtn.style.display:', expandBtn.style.display);
        console.log('loadMoreBtn.style.display:', loadMoreBtn.style.display);
    }

    renderBoxes();

    expandBtn.addEventListener('click', () => {
        renderBoxes();
    });
});
