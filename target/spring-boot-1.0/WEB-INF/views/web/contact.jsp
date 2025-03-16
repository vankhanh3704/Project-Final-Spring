<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="webContactUrl" value="/lien-he"/>
<c:url var="productListURL" value="/san-pham"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ</title>
</head>
<body>
<div class="contact">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-lg-8">
                <div class="contact__main">
                    <div class="contact__content">
                        <div class="inner-title" style="margin-top: 0;">Liên hệ</div>
                        <strong>Địa chỉ: </strong>
                        <span>Trụ sở chính tọa lạc tại số 19, Ngõ 35 Trần Thái Tông, Dịch Vọng, Cầu Giấy, Hà Nội.</span>
                        <br>
                        <strong>GPKD số: </strong>
                        <span>0314542349, Ngày cấp:30/2/2025, Sở kế hoạch đầu tư Hà Nội</span>
                        <br>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.941474262048!2d105.78499434798005!3d21.035027637753064!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc7b85b487f%3A0x8490edd3ff7e65c3!2zQ2h1bmcgY8awIG1pbmkgc-G7kSAxOSBOZ8O1IDM1IFRy4bqnbiBUaMOhaSBUw7RuZw!5e0!3m2!1svi!2ssg!4v1740457431481!5m2!1svi!2ssg"
                                width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                    <div class="contact__required">
                        <div class="inner-title">Gửi yêu cầu</div>
                        <form:form id="listForm" action="${webcontacturl}" method="POST">
                            <div class="row">
                                <div class="col-6">
                                    <input type="text" name="fullName" placeholder="Họ và tên (*)">
                                </div>
                                <div class="col-6">
                                    <input type="text" name="email" placeholder="Email">
                                </div>
                                <div class="col-6">
                                    <input type="text" name="customerPhone" placeholder="Số điện thoại (*)">
                                </div>
                                <div class="col-6">
                                    <input type="text" name="address" placeholder="Địa chỉ">
                                </div>
                                <div class="col-12">
                                    <textarea type="text" name="note" required placeholder="Nội dung (*)"></textarea>
                                </div>
                                <button type="button" class="button button-one" id="addCustomer">
                                    Gửi liên hệ
                                </button>
                            </div>
                        </form:form>
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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"
        integrity="sha512-CwHUCK55pONjDxvPZQeuwKpxos8mPyEv9gGuWC8Vr0357J2uXg1PycGDPND9EgdokSFTG6kgSApoDj9OM22ksw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript"></script>
<script type="text/javascript">
    $('#addCustomer').click(function (e) {
        e.preventDefault();
        var fullName = $('input[name="fullName"]').val();
        var email = $('input[name="email"]').val();
        var phone = $('input[name="customerPhone"]').val();
        var demand = $('textarea[name="note"]').val();
        var formData = {
            fullName: fullName,
            email: email,
            customerPhone: phone,
            note: demand
        };

        addInfo(formData);
    });

    function addInfo(formData) {
        $.ajax({
            url: "${webContactUrl}",
            type: 'POST',
            data: JSON.stringify(formData),
            contentType: "application/json",
            success: function (response) {
                location.reload();
                alert("Gửi thông tin liên hệ thành công")
            },
            error: function (xhr, status, error) {
                location.reload();
            }
        });
    }

</script>
</body>
</html>
