document.addEventListener('DOMContentLoaded', () => {
    const expandBtn = document.getElementById('expandBtn');
    const iconLoadMore = document.querySelector("#loadMoreBtn i")
    const loadMoreBtn = document.getElementById('loadMoreBtn');
    const content = document.getElementById('content');
    let data = []; // Khai báo mảng để lưu dữ liệu từ API
    let itemsToShow = 8;
    let currentIndex = 0;

    async function fetchData() {
        try {
            const response = await fetch('/api/home'); // Thay bằng API thực tế
            if (!response.ok) {
                throw new Error('Lỗi khi lấy dữ liệu từ API');
            }
            data = await response.json(); // Chuyển đổi dữ liệu JSON
            renderBoxes(); // Gọi hàm để hiển thị dữ liệu
        } catch (error) {
            console.error('Lỗi:', error);
        }
    }
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
                        <img src="data:image/jpeg;base64,${boxData.imageBase64}" alt="" style="min-height: 170px">
                        <div class="mua-ban-bds__image--label">${boxData.level}</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            ${boxData.name}
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">${boxData.rentPrice}</span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area">${boxData.rentArea}</span>
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

    fetchData();

    expandBtn.addEventListener('click', () => {
        renderBoxes();
    });
});
