<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/api/user"/>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>
</head>
<body>
<main class="main-content-inner">
    <div class="widget-box">
        <div class="widget-box__title">
            <h5>
                <i class="las la-info-circle"></i>
                Thông tin tài khoản
            </h5>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                    <div id="profile">
                        <form:form id="formEdit" class="form-horizontal" modelAttribute="model">
                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                        <%--<spring:message code="label.username"/>--%>
                                    Tên đăng nhập
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="userName" id="userName" cssClass="form-control" disabled="true"/>
                                </div>
                            </div>
                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                        <%--<spring:message code="label.fullname"/>--%>
                                    Tên đầy đủ
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="fullName" id="fullName" cssClass="form-control"/>
                                </div>
                            </div>
                            <!--Btn-->
                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label no-padding-right message-info"></label>
                                <input type="button" class="btn btn-white btn-warning btn-bold"
                                       value="Cập nhật người dùng" id="btnUpdateUser"/>
                            </div>
                            <!--Btn-->
                            <form:hidden path="id" id="userId"/>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    $("#btnUpdateUser").click(function (event) {
        event.preventDefault();
        var dataArray = {};
        dataArray["fullName"] = $('#fullName').val();
        if ($('#userId').val() != "") {
            updateInfo(dataArray, $('#userName').val());
        }
    });

    function updateInfo(data, username) {
        $.ajax({
            url: '${formUrl}/profile/' + username,
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value='/admin/profile/"+res.userName+"?message=update_success'/>";
            },
            error: function (res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/profile/"+username+"?message=error_system'/>";
            }
        });
    }
</script>
</div>
</body>
</html>
