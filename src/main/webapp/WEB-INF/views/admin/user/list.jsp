<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/admin/user-list"/>
<c:url var="formAjax" value="/api/user"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Danh sách người dùng
    </title>
</head>

<body>
<main class="main-content-inner">
    <div class="page-content">
        <div class="row">
            <div class="col-xl-12">
                <c:if test="${messageResponse!=null}">
                    <div class="alert alert-block alert-${alert}">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>
                            ${messageResponse}
                    </div>
                </c:if>
                <div class="widget-box">
                    <div class="widget-box__title">
                        <h5>
                            <i class="las la-search"></i>
                            Tìm kiếm
                        </h5>

                    </div>
                    <div class="widget-box__body">
                        <div class="widget-box__main">
                            <form:form modelAttribute="model" action="${formUrl}" id="listForm" method="GET">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="form-group">
                                            <div class="col-xl-2">
                                                <label class="name">Giá trị cần tìm</label>
                                            </div>
                                            <div class="col-xl-9">
                                                <form:input path="searchValue" cssClass="form-control input-sm"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 flex-end">
                                        <button type="button" class="btn btn-xs btn-info"
                                                id="btnSearch">
                                            <i class="las la-search"></i>
                                            Tìm kiếm
                                        </button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="pull-right">
        <a href="<c:url value="/admin/user-edit"/>" title="Thêm người dùng" data-toggle="tooltip">
            <button class="btn btn-add" title="Thêm người dùng">
                <i class="las la-plus"></i>
                Thêm người dùng
            </button>
        </a>
        <button class="btn btn-rev" title="Xóa bài viết" id="btnDelete" disabled data-toggle="tooltip"
                onclick="warningBeforeDelete()">
            <i class="las la-trash-alt"></i>
            Xoá người dùng
        </button>
    </div>
    <div class="page-content">
        <div class="row" style="font-family: 'Times New Roman', Times, serif;">
            <div class="col-xl-12">
                <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                               requestURI="${formUrl}" partialList="true" sort="external"
                               size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                               id="tableList" pagesize="${model.maxPageItems}"
                               export="false"
                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                               style="margin: 3em 0 1.5em;">
                    <display:column title="<fieldset>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                    headerClass="center select-cell"
                    >
                        <fieldset>
                            <input type="checkbox" name="checkList" value="${tableList.id}"
                                   id="checkbox_${tableList.id}" class="ace"/>
                        </fieldset>
                    </display:column>
                    <display:column property="userName" title="Tên"/>
                    <display:column property="fullName" title="full name"/>
                    <display:column title="Thao tác">
                        <c:if test="${tableList.roleCode != 'MANAGER'}">
                            <a class="fix" data-toggle="tooltip"
                               title="Cập nhật người dùng"
                               href='<c:url value="/admin/user-edit-${tableList.id}"/>'>
                                <i class="las la-pen"></i>
                            </a>
                        </c:if>
                        <c:if test="${tableList.roleCode == 'MANAGER'}">
                            <p>Không đươc thao tác</p>
                        </c:if>
                    </display:column>
                </display:table>
            </div>
        </div>
    </div>

</main>

<script type="text/javascript">
    $(document).ready(function () {
        var someJsVar = "<c:out value='${addOrEditNews}'/>";
        $('#btnSearch').click(function () {
            $('#listForm').submit();
        });
    });

    function warningBeforeDelete() {
        showAlertBeforeDelete(function () {
            event.preventDefault();
            var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteUser(dataArray);
        });
    }

    function deleteUser(data) {
        $.ajax({
            url: '${formAjax}/',
            type: 'DELETE',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value='/admin/user-list?message=delete_success'/>";
            },
            error: function (res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/user-list?message=error_system'/>";
            }
        });
    }
</script>
</body>

</html>