<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/api/user"/>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>
</head>
<body>
<main class="main-content-inner">
    <div class="page-content">
        <div class="row">
            <div class="col-xl-12">
                <div class="widget-box">
                    <div class="widget-box__title">
                        <h5>
                            <i class="las la-tools"></i>
                            Sửa thông tin người dùng
                        </h5>
                    </div>
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                    <form:form id="formEdit" class="form-horizontal" modelAttribute="model">
                    <div id="profile">
                        <div class="form-group">
                            <label class="col-xl-3 control-label no-padding-right">Vai trò</label>
                            <div class="col-xl-6">
                                <form:select path="roleCode" id="roleCode" class="form-control">
                                    <form:option value="" label="--- Chọn vai trò ---"/>
                                    <form:options items="${model.roleDTOs}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xl-3 control-label no-padding-right">
                                Tên đăng nhập
                            </label>
                            <div class="col-xl-6">
                                <c:if test="${not empty model.id}">
                                    <form:input path="userName" id="userName" cssClass="form-control"
                                                disabled="true"/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <form:input path="userName" id="userName" cssClass="form-control"/>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xl-3 control-label no-padding-right">
                                    <%--<spring:message code="label.fullname"/>--%>
                                Tên đầy đủ
                            </label>
                            <div class="col-xl-6">
                                <form:input path="fullName" id="fullName" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Mật khẩu
                            </label>
                            <div class="col-xl-6">
                                <c:if test="${not empty model.id}">
                                    <form:input path="password" id="userName" cssClass="form-control" type="password"/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <form:input path="password" id="userName" cssClass="form-control" type="password"/>
                                </c:if>
                            </div>
                        </div>
                            <img src="${pageContext.request.contextPath}/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                            <!--Btn-->
                            <div class="col-xl-12 flex-end">
                                <c:if test="${not empty model.id}">
                                    <input type="button" class="btn btn-white btn-info btn-bold"
                                           value="Cập nhật người dùng" id="btnAddOrUpdateUsers"/>
                                    <input type="button" class="btn btn-white btn-info btn-bold"
                                           value="Reset mật khẩu" id="btnResetPassword"/>
<%--                                    <img src="${pageContext.request.contextPath}/img/loading.gif" style="display: none; height: 100px" id="loading_image">--%>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold"
                                           value="Thêm mới người dùng" id="btnAddOrUpdateUsers"/>
<%--                                    <img src="${pageContext.request.contextPath}/img/loading.gif" style="display: none; height: 100px" id="loading_image">--%>
                                </c:if>
                            </div>
                            <!--Btn-->
                            <form:hidden path="id" id="userId"/>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
</main>
<script>
    $("#btnAddOrUpdateUsers").click(function (event) {
        event.preventDefault();
        var formData = $("#formEdit").serializeArray();
        var dataArray = {};
        $.each(formData, function (i, v) {
            dataArray["" + v.name + ""] = v.value;
        });
        if ($('#userId').val() != "") {
            var userId = $('#userId').val();
            var roleCode = dataArray['roleCode'];
            if (roleCode != '') {
                updateUser(dataArray, $('#userId').val());
            } else {
                window.location.href = "<c:url value='/admin/user-edit-"+userId+"?message=role_require'/>";
            }
        } else {
            var userName = dataArray['userName'];
            var roleCode = dataArray['roleCode'];
            if (userName != '' && roleCode != '') {
                $('#loading_image').show();
                addUser(dataArray);
            } else {
                window.location.href = "<c:url value='/admin/user-edit?message=username_role_require'/>";
            }
        }
    });

    $('#btnResetPassword').click(function (event) {
        event.preventDefault();
        $('#loading_image').show();
        resetPassword($('#userId').val());
    });

    function addUser(data) {
        $.ajax({
            url: '${formUrl}',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                $('#loading_image').hide();
                window.location.href = "<c:url value='/admin/user-edit-"+res.id+"?message=insert_success'/>";
            },
            error: function (res) {
                window.location.href = "<c:url value='/admin/user-edit-"+res.id+"?message=error_system'/>";
            }
        });
    }

    function updateUser(data, id) {
        $.ajax({
            url: '${formUrl}/' + id,
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value='/admin/user-edit-"+res.id+"?message=update_success'/>";
            },
            error: function (res) {
                window.location.href = "<c:url value='/admin/user-edit-"+id+"?message=error_system'/>";
            }
        });
    }

    function resetPassword(id) {
        $.ajax({
            url: '${formUrl}/password/' + id + '/reset',
            type: 'PUT',
            dataType: 'json',
            success: function (res) {
                $('#loading_image').hide();
                window.location.href = "<c:url value='/admin/user-edit-"+res.id+"?message=reset_password_success'/>";
            },
            error: function (res) {
                window.location.href = "<c:url value='/admin/user-edit-"+id+"?message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>
