<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="productListURL" value="/san-pham"/>
<html>
<head>
    <title>${building.name}</title>
</head>
<body>
<div class="detail-est">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-lg-8">
                <div class="detail-est__main">
                    <div class="detail-est__image">
                        <img src="data:image/jpeg;base64,${building.imageBase64}" alt="Building Image"/>
                    </div>
                    <div class="detail-est__content">
                        <h2 class="detail-est__content--title">
                            ${building.name}
                        </h2>
                        <p class="detail-est__content--desc">
                            <strong>Địa chỉ:</strong>
                            <span>${building.address}</span>
                        </p>
                    </div>
                    <div class="detail-est__short-info">
                        <div class="detail-est__short-info--price">
                            <span class="title">Mức giá</span>
                            <span class="value">${building.rentPrice} tỷ</span>
                            <span class="ext">~44,3 triệu/m2</span>
                        </div>
                        <div class="detail-est__short-info--area">
                            <span class="title">Diện tích</span>
                            <span class="value">${building.floorArea} m2</span>
                        </div>
                        <div class="detail-est__short-info--bed">
                            <span class="title">Hướng</span>
                            <span class="value">Đông Nam</span>
                        </div>
                    </div>
                    <div class="inner-title">Thông tin mô tả</div>
                    <div class="detail-est__desc">
                        <div class="detail-est__desc--item">
                            <span>Số tầng hầm :</span>
                            <span>${building.numberOfBasement}</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Diện tích sàn :</span>
                            <span>4</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Hướng :</span>
                            <span>Đông Nam</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Hạng :</span>
                            <span>A</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Diện tích thuê :</span>
                            <span>100 m2</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Giá thuê :</span>
                            <!-- mô tả giá -->
                            <span>5 triệu</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Phí dịch vụ :</span>
                            <span>5 triệu</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Phí ô tô :</span>
                            <span>5 triệu</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Phí xe máy :</span>
                            <span>5 triệu</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Tiền điện :</span>
                            <span>5 triệu</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Phí ngoài giờ :</span>
                            <span>5 triệu</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Số phòng tắm :</span>
                            <span>1</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Số phòng ngủ :</span>
                            <span>2</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Phí môi giới :</span>
                            <span>2%</span>
                        </div>
                        <div class="detail-est__desc--item">
                            <span>Loại toà nhà :</span>
                            <span>${building.typeCode}</span>
                        </div>
                        <div class="detail-est__contact">
                            <span style="color: #6F6F6F;">Liên hệ ngay để biết thêm thông tin chi tiết: </span>
                            <span>${building.managerName}</span>
                            <span> - </span>
                            <span style="padding: 5px 10px; background: #80FE56; border-radius: 10px; margin-top: 10px;">${building.managerPhone}</span>
                        </div>
                    </div>
                    <div class="inner-title">Xem trên bản đồ</div>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.29227642012!2d105.78483621115538!3d20.980917989338753!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdd8a1ad71%3A0xa2f9b16036648187!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCxrB1IGNow61uaCB2aeG7hW4gdGjDtG5n!5e0!3m2!1svi!2s!4v1740410444988!5m2!1svi!2s" width="100%" height="300px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                </div>
            </div>
            <div class="col-xl-4 col-lg-4">
                <div class="pn-sidebar">
                    <div class="pn-sidebar__title">
                        Tìm kiếm BĐS
                    </div>
                    <form:form modelAttribute="modelSearch" id="listForm" action="${productListURL}" method="GET"
                               class="pn-sidebar__form">
                        <form:input path="name" placeholder="Nhập tên BĐS"/>
                        <form:select path="district">
                            <form:option value="">---Chọn tỉnh---</form:option>
                            <form:options items="${districts}"></form:options>
                        </form:select>
                        <form:input path="ward" placeholder="--Quận/Huyện--"/>
                        <form:input path="street" placeholder="--Đường/Phố--"/>
                        <form:input path="" placeholder="--Phường/Xã--"/>
                        <form:input type="number" path="areaFrom" placeholder="Diện tích..."/>
                        <form:input type="number" path="rentPriceFrom" placeholder="Mức giá..."/>
                        <div class="pn-sidebar__form--button">
                            <button class="button button-one" id="btnSearchBuilding">Tìm kiếm</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>