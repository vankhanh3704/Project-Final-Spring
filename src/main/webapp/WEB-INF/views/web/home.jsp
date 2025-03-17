<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="productListURL" value="/san-pham"/>
<c:url var="buildingAPI" value="/api/home"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
</head>

<body>
<!-- Search -->
<div class="home-search">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="home-search__main">
                    <form:form modelAttribute="modelSearch" id="listForm" action="${productListURL}" method="GET">
                        <div class="home-search__title">
                            Tìm kiếm
                            <strong>NHÀ ĐẤT</strong>
                        </div>
                        <div class="home-search__list">

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <form:input path="name" placeholder="Nhập tên BĐS"
                                                cssClass="home-search__list--item"/>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <form:select path="district" cssClass="home-search__list--item">
                                        <form:option value="">---Chọn tỉnh---</form:option>
                                        <form:options items="${districts}"></form:options>
                                    </form:select>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                     <form:input class="home-search__list--item" path="ward" placeholder="--Quận/Huyện--"/>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 ">
                                    <form:input class="home-search__list--item" path="street" placeholder="--Đường/Phố--"/>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 ">
                                   <form:input class="home-search__list--item" path="" placeholder="--Phường/Xã--"/>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 ">
                                     <form:input type="number" class="home-search__list--item" path="areaFrom" placeholder="Diện tích..."/>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 ">
                                     <form:input type="number" class="home-search__list--item" path="rentPriceFrom" placeholder="Mức giá..."/>
                                </div>
                            </div>
                        </div>
                        <div class="home-search__main--button">
                            <button class="button button-one" id="btnSearchBuilding">Tìm kiếm</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Search -->

<!-- Bất động sản mới nhất -->
<div class="mua-ban-bds">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3 class="inner-title mua-ban-bds__title">Bất động sản mới nhất</h3>
            </div>
        </div>
        <div class="row" id="content">

        </div>

        <div class="row">
            <div class="col-12">
                <div id="expandBtn">Mở rộng <i class="fa-solid fa-angle-down"></i></div>
                <a href="<c:url value="/san-pham"/>" id="loadMoreBtn" style="display: none;">Xem tiếp <i
                        class="fa-solid fa-angle-down"></i></a>
            </div>
        </div>
    </div>
</div>
<!-- Kết thúc mua bán bất động sản -->

<!-- Bất động sản nổi bật-->
<div class="mua-ban-bds">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3 class="inner-title mua-ban-bds__title">Bất động sản nổi bật</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                <a class="mua-ban-bds__box" href="#">
                    <div class="mua-ban-bds__image">
                        <img src="${pageContext.request.contextPath}/web/assets/images/building-1.jpg" alt="">
                        <div class="mua-ban-bds__image--label">VIP</div>
                    </div>
                    <div class="mua-ban-bds__content">
                        <div class="mua-ban-bds__content--title">
                            Bán CH giá tốt view sông đẹp tại Q7
                        </div>
                        <div class="mua-ban-bds__content-stat">
                            <span class="mua-ban-bds__content-stat-price">2,97 tỷ </span>
                            <span class="mua-ban-bds__content-stat-dot"> · </span>
                            <span class="mua-ban-bds__content-stat-area"> 67 m²</span>
                        </div>
                        <div class="mua-ban-bds__content-address">
                            <i class="fa-solid fa-location-dot"></i> Quận 7, Hồ Chí Minh
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div id="expandBtn">Mở rộng <i class="fa-solid fa-angle-down"></i></div>
                <a href="#" id="loadMoreBtn" style="display: none;">Xem tiếp <i
                        class="fa-solid fa-angle-down"></i></a>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    })


</script>
</body>


</html>