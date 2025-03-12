<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm</title>
</head>

<body>
<div class="product">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-lg-8">
                <div class="product__main">
                    <div class="product__content">
                        <div class="product__content--title" style="margin-top: 0;">Danh sách sản phẩm</div>
                        <select name="" id="filter" class="product__content--sort">
                            <option value="mac-dinh">-- Mặc định --</option>
                            <option value="thap-cao">Giá từ thấp tới cao</option>
                            <option value="cao-thap">Giá từ cao tới thấp</option>
                            <option value="dien-tich-tang">Diện tích tăng dần</option>
                            <option value="dien-tich-giam">Diện tích giảm dần</option>
                        </select>
                    </div>
                    <div class="product__list-box">
                        <c:forEach var="item" items="${buildingList}">
                            <div class="product__item">
                                <a href="">
                                    <div class="product__item--image">
                                        <img src="data:image/jpeg;base64,${item.imageBase64}" alt="Building Image"/>
                                    </div>
                                </a>
                                <div class="product__item--list">
                                    <a href="">
                                        <div class="product__item--title">
                                                ${item.name}
                                        </div>
                                    </a>

                                    <div class="product__item--content">
                                        <div class="product__item--price">
                                            <i class="las la-tags"></i>
                                            <span class="price">${item.rentPrice}</span>
                                            <span> tỷ</span>
                                        </div>
                                        <div class="product__item--area">
                                            <i class="las la-warehouse"></i>
                                            <span class="area">${item.floorArea} </span>
                                            <span>m²</span>
                                        </div>
                                    </div>
                                    <div class="product__item--address">
                                        <i class="las la-map-marked"></i>
                                        <strong>Địa chỉ: </strong>
                                        <span>${item.address}</span>
                                    </div>
                                    <div class="product__item--desc">
                                        <p>${item.note}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="pagination-container">
                        <div class="pagination" id="pagination">
                            <button class="page-nav" id="prevPage">←</button>
                            <div class="page-numbers" id="pageNumbers"></div>
                            <button class="page-nav" id="nextPage">→</button>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-xl-4 col-lg-4">
                <div class="pn-sidebar">
                    <div class="pn-sidebar__title">
                        Tìm kiếm BĐS
                    </div>
                    <form:form modelAttribute="modelSearch" id="listForm" action="${productListURL}" method="GET"
                               class="pn-sidebar__form">
                        <form:input path="name" placeholder="Nhập tên BĐS"
                        />
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

<script src="web/assets/js/Sort-Product.js">
</script>
</body>

</html>