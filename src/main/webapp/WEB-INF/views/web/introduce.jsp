<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="productListURL" value="/san-pham"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link>
<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Giới thiệu</title>--%>
<%--</head>--%>
<body>
    <!-- CONTENT  -->
    <div class="introduce">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8" >
                    <div class="introduce__main">
                        <div class="inner-title" style="margin-top: 0;">Giới thiệu công ty</div>
                        <div class="introduce__content">
                            <div style="margin-bottom: 5px">
                                <strong>Tên công ty:</strong>
                                <span>Khánh Văn Real Estate</span>
                            </div>
                            <div style="margin-bottom: 5px">
                                <strong>Vị trí:</strong>
                                <span>Trụ sở chính tọa lạc tại số 19, Ngõ 35 Trần Thái Tông, Dịch Vọng, Cầu Giấy, Hà Nội.</span>
                            </div>
                            <div style="margin-bottom: 5px">
                                <strong>Sứ mệnh:</strong>
                                <span>FutureLand Real Estate cam kết mang đến cho khách hàng những giải pháp bất động sản toàn diện và chất lượng nhất. Chúng tôi luôn đặt khách hàng làm trọng tâm và nỗ lực không ngừng để tạo dựng những giá trị bền vững cho cộng đồng và môi trường.</span>
                            </div>
                            <strong>Dịch vụ cung cấp:</strong>
                            <ul>
                                <li>
                                    <strong>Mua bán và cho thuê bất động sản:</strong>
                                    <span>Tư vấn và hỗ trợ khách hàng tìm kiếm, mua bán, cho thuê căn hộ, biệt thự, đất nền, và các loại hình bất động sản khác.</span>
                                </li>
                                <li>
                                    <strong>Phát triển dự án:</strong>
                                    <span>Tham gia vào quá trình lập kế hoạch, thiết kế, xây dựng và quản lý các dự án bất động sản thương mại và dân cư.</span>
                                </li>
                                <li>
                                    <strong>Quản lý tài sản: </strong>
                                    <span>Cung cấp các dịch vụ quản lý và bảo trì tài sản, đảm bảo giá trị bất động sản luôn được duy trì và phát triển.</span>
                                </li>
                                <li>
                                    <strong>Tư vấn đầu tư: </strong>
                                    <span>Hỗ trợ khách hàng phân tích, đánh giá và đưa ra các quyết định đầu tư bất động sản hiệu quả và bền vững.</span>
                                </li>
                            </ul>
                            <strong>Điểm nổi bật:</strong>
                            <ul>
                                <li>
                                    <strong>Kinh nghiệm và uy tín:</strong>
                                    <span> Với hơn 10 năm hoạt động trong lĩnh vực bất động sản, FutureLand Real Estate đã xây dựng được uy tín và niềm tin vững chắc từ khách hàng.</span>
                                </li>
                                <li>
                                    <strong>Đội ngũ chuyên nghiệp:</strong>
                                    <span> Đội ngũ nhân viên của chúng tôi được đào tạo chuyên sâu, có kinh nghiệm và luôn tận tâm với công việc.</span>
                                </li>
                                <li>
                                    <strong>Mạng lưới đối tác rộng khắp: </strong>
                                    <span>Hợp tác với các chủ đầu tư, ngân hàng, và các tổ chức tài chính lớn để mang đến những giải pháp tốt nhất cho khách hàng.</span>
                                </li>
                                <li>
                                    <strong>Công nghệ tiên tiến: </strong>
                                    <span>Ứng dụng công nghệ 4.0 trong quản lý và vận hành, giúp tối ưu hóa quy trình và nâng cao hiệu quả công việc.</span>
                                </li>
                            </ul>
                            <strong>Cam kết:</strong>
                            <span>Khánh Văn Real Estate cam kết mang đến cho khách hàng sự hài lòng tối đa với những sản phẩm và dịch vụ chất lượng, đồng thời luôn lắng nghe và đáp ứng mọi nhu cầu của khách hàng.</span>

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
    <!-- End Introduce -->
<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"--%>
<%--        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"--%>
<%--        crossorigin="anonymous"></script>--%>
</body>
</html>
