
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-container">

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1 style="font-family: 'Times New Roman', Times, serif;">
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class = "row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" id="form-edit" >
                                <div class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Quận</label>
                                    <div class="col-xs-2">

                                        <form:select class="form-control" path="district">
                                             <c:if test="${not empty buildingEdit.id}">
                                            <form:option value="">${buildingEdit.district}</form:option>
                                          </c:if>
                                          <c:if test="${empty buildingEdit.id}">
                                            <form:option value="">---Chọn Quận---</form:option>
                                          </c:if>

                                            <form:options items="${districts}"/>
                                        </form:select>


                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="ward"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="street"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Kết cấu</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="structure"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="numberOfBasement"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="floorArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="direction"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="level"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentPrice"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="rentpricedescription" name="rentpricedescription" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="servicefee" name="servicefee" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="carfee" name="carfee" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="motorbikefee" name="motorbikefee" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="overtimefee" name="overtimefee" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="electricityfee" name="electricityfee" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="managerName"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">SĐT quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="managerPhone"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text" id="brokeragefee" name="brokeragefee" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Loại tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:checkboxes items="${typeCodes}" path="typeCode" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="note" name="note">--%>
                                        <input class="form-control" type="text" id="note" name="note" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                    <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-9">
                                        <c:if test="${not empty buildingEdit.image}">
                                            <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.image}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-info" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                            <button type="button" class="btn btn-info" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-info" id="btnAddOrUpdateBuilding">Thêm mới</button>
                                            <button type="button" class="btn btn-info" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id="buildingId"/>
                            </form>


                        </div>
                    </form:form>

                </div>


            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

</div><!-- /.main-container -->

<!-- Modal -->
<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style=font-size:20px;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>

            </div>
            <div class="modal-body">
                Vui lòng nhập đầy đủ thông tin !!!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script>

    var imageBase64 = '';
    var imageName = '';

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $('#btnAddOrUpdateBuilding').click(function () {
        var data = {}
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name != 'typeCode') {
                data["" + v.name + ""] = v.value;
            } else {
                typeCode.push(v.value);
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        data['typeCode'] = typeCode;
         $('#loading_image').show();
        if (typeCode != "" && data["district"]!= "") {
            addOrUpdateBuilding(data);
            window.location.href = "<c:url value="/admin/building-list"/>";
        } else {
            $('#infoModal').modal('show');

        }
    });

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });
    //call api
    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "/api/building",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.log("Success");
            },
            error: function (response) {
                console.log("failed");
                console.log(response);
            }

        });
    }

    $('#btnCancel').click(function (){
        window.location.href = "/admin/building-list";
    });



</script>
</body>
</html>
