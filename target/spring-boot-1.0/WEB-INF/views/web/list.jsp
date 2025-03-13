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
<style>
    .pagination {
        margin-top: 20px;
        text-align: center;
    }
    .pagination a, .pagination span {
        display: inline-block;
        padding: 5px 10px;
        margin: 0 5px;
        border: 1px solid #ccc;
        text-decoration: none;
        color: #007bff;
    }
    .pagination a:hover {
        background-color: #007bff;
        color: white;
    }
    .pagination .current-page {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
    }
    .pagination .ellipsis {
        padding: 5px 10px;
        margin: 0 5px;
    }
</style>
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
                    <div class="product__list-box" id="building-list">
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
                    <c:set var="queryParams" value=""/>
                    <c:forEach var="entry" items="${param}">
                    <c:if test="${entry.key != 'page' && entry.key != 'maxPageItems'}">
                        <c:set var="queryParams" value="${queryParams}&${entry.key}=${entry.value}"/>
                    </c:if>
                    </c:forEach>
                    <!-- Phần tử phân trang -->
                    <div class="pagination">
                        <!-- Nút "Đầu" và "Trước" -->
                        <c:if test="${currentPage > 1}">
                            <a href="<c:url value="/san-pham?page=1&maxPageItems=${pageSize}${queryParams}"/>">Đầu</a>
                            <a href="<c:url value="/san-pham?page=${currentPage - 1}&maxPageItems=${pageSize}${queryParams}"/>">Trước</a>

                        </c:if>

                        <!-- Hiển thị các trang xung quanh trang hiện tại -->
                        <c:set var="startPage" value="${currentPage - 2}"/>
                        <c:set var="endPage" value="${currentPage + 2}"/>

                        <c:if test="${startPage < 1}">
                            <c:set var="startPage" value="1"/>
                            <c:set var="endPage" value="5"/>
                        </c:if>

                        <c:if test="${endPage > totalPages}">
                            <c:set var="endPage" value="${totalPages}"/>
                            <c:set var="startPage" value="${totalPages - 4}"/>
                            <c:if test="${startPage < 1}">
                                <c:set var="startPage" value="1"/>
                            </c:if>
                        </c:if>

                        <!-- Hiển thị trang đầu tiên và dấu "..." nếu cần -->
                        <c:if test="${startPage > 1}">
                            <a href="<c:url value="/san-pham?page=1&maxPageItems=${pageSize}${queryParams}"/>">1</a>
                            <c:if test="${startPage > 2}">
                                <span class="ellipsis">...</span>
                            </c:if>
                        </c:if>

                        <!-- Hiển thị các trang xung quanh trang hiện tại -->
                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <span class="current-page">${i}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="/san-pham?page=${i}&maxPageItems=${pageSize}${queryParams}"/>">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- Hiển thị dấu "..." và trang cuối cùng nếu cần -->
                        <c:if test="${endPage < totalPages}">
                            <c:if test="${endPage < totalPages - 1}">
                                <span class="ellipsis">...</span>
                            </c:if>
                            <a href="<c:url value="/san-pham?page=${totalPages}&maxPageItems=${pageSize}${queryParams}"/>">${totalPages}</a>
                        </c:if>

                        <!-- Nút "Sau" và "Cuối" -->
                        <c:if test="${currentPage < totalPages}">
                            <a href="<c:url value="/san-pham?page=${currentPage + 1}&maxPageItems=${pageSize}${queryParams}"/>">Sau</a>
                            <a href="<c:url value="/san-pham?page=${totalPages}&maxPageItems=${pageSize}${queryParams}"/>">Cuối</a>
                        </c:if>
                    </div>
                </div>
                <p>Tổng số trang: ${totalPages}</p>
                <p>Trang hiện tại: ${currentPage}</p>

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
<script>
    $(document).ready(function () {
        var queryParams = window.location.search.replace(/[\?&]page=\d+/g, ''); // Xóa page cũ
        $('#pagination').twbsPagination({
            totalPages: ${totalPages},
            visiblePages: 5,
            startPage: ${currentPage},
            onPageClick: function (event, page) {
                window.location.href = "/san-pham?page=" + page + queryParams;
            }
        });
    });
</script>
</body>

</html>