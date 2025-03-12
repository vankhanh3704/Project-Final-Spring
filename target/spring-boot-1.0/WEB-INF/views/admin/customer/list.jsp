<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"></c:url>


<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Danh sách khách hàng
    </title>
</head>

<body>
<main class="main-content-inner">
    <div class="page-content">
        <div class="row">
            <div class="col-xl-12">
                <div class="widget-box">
                    <div class="widget-box__title">
                        <h5>
                            <i class="las la-search"></i>
                            Tìm kiếm
                        </h5>
                    </div>
                    <div class="widget-box__body">
                        <div class="widget-box__main">
                            <form:form modelAttribute="modelSearch" id="listForm" action="${customerListURL}"
                                       method="GET">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="form-group">
                                            <div class="col-xl-6">
                                                <label class="name">Tên khách hàng</label>
                                                <form:input class="form-control" path="fullName"/>
                                            </div>
                                            <div class="col-xl-6">
                                                <label class="name">Số điện thoại</label>
                                                <form:input type="number" class="form-control" path="phone"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="form-group">
                                            <div class="col-xl-6">
                                                <label class="name">Email</label>
                                                <form:input class="form-control" path="email"/>
                                            </div>
                                            <div class="col-xl-6">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label class="name">Nhân viên</label>
                                                    <form:select class="form-control" path="staffId">
                                                        <form:option value="">---Chọn Nhân viên---</form:option>
                                                        <form:options items="${listStaffs}"></form:options>
                                                    </form:select>
                                                </security:authorize>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-xl-12 flex-end">
                                        <button type="button" class="btn btn-xs btn-info"
                                                id="btnSearchCustomer">
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

    <security:authorize access="hasRole('MANAGER')">
        <div class="pull-right">
            <a href="/admin/customer-edit">
                <button class="btn btn-add" title="Thêm khách hàng">
                    <i class="las la-plus"></i>
                    Thêm khách hàng
                </button>
            </a>
            <button class="btn btn-rev" title="Xóa khách hàng" id="" onclick="warningBeforeDelete()">
                <i class="las la-trash-alt"></i>
                Xoá khách hàng
            </button>
        </div>
    </security:authorize>
    <div class="page-content">
        <div class="row" style="font-family: 'Times New Roman', Times, serif;">
            <div class="col-xl-12">
                <form:form modelAttribute="customerList">
                    <display:table name="customerList.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="${customerListURL}" partialList="true" sort="external"
                                   size="${customerList.totalItems}" defaultsort="2" defaultorder="ascending"
                                   id="tableList" pagesize="${customerList.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset >
                                                            <input type='checkbox' id='checkAll' class='check-box-element'>
                                                            </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column property="fullName" title="Tên khách hàng"/>
                        <display:column property="phone" title="SĐT"/>
                        <display:column property="email" title="Email"/>
                        <display:column property="note" title="Nhu cầu"/>
                        <display:column property="createdBy" title="Người thêm"/>
                        <display:column property="createdDate" title="Ngày thêm"/>
                        <display:column property="status" title="Tình trạng"/>

                        <display:column headerClass="col-actions" title="Thao tác">
                            <security:authorize access="hasRole('MANAGER')">
                                <a title="Giao khách hàng" class="assignment"
                                   onclick="assignmentCustomer(${tableList.id});">
                                    <i class="las la-plus-circle"></i>
                                </a>
                            </security:authorize>

                            <a class="fix" title="Sửa khách hàng"
                               href='<c:url value="/admin/customer-edit-${tableList.id}"/>'>
                                <i class="las la-pen"></i>
                            </a>
                            <security:authorize access="hasRole('MANAGER')">
                                <a class="delete" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
                                    <i class="las la-times-circle"></i>
                                </a>
                            </security:authorize>

                        </display:column>
                    </display:table>
                </form:form>
                <!-- Thêm phân trang dưới bảng -->

            </div>
        </div>
    </div>

</main>
<!-- /.main-container -->
<div class="modal fade" id="assignmentCustomerModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Danh sách nhân viên</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <div class="modal-body">
                <table style="margin: 3em 0 1.5em;" class="table table-striped table-bordered table-hover"
                       id="staffList">
                    <thead>
                    <tr>
                        <th class="center">
                            Chọn
                        </th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" name="customerId" id="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" id="btnAssignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<script>


    function warningBeforeDelete() {
        showAlertBeforeDelete(function () {
            event.preventDefault();
            var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteCustomers(dataArray);
        });
    }
    function assignmentCustomer(customerId) {
        $('#assignmentCustomerModal').modal();
        loadStaff(customerId);
        $('#customerId').val(customerId);
    }

    function loadStaff(customerId) {
        $.ajax({
            type: "GET",
            url: "${customerAPI}/" + customerId + '/staffs',
            dataType: "JSON",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element"' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("Success");
            },

            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value = "/admin/customer-list?message=error"/>";
                console.log(response);
            }
        })
    }

    $('#btnAssignmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        data['staffs'] = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if (data['staffs'] !== '') {
            assignment(data);
            console.log("ok");
        } else {
            window.location.href = "<c:url value = "/admin/customer-list?message=staff_required"/>";
        }
    })

    function assignment(data) {
        $.ajax({
            type: "PUT",
            url: "${customerAPI}" + "/customer-assignment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.info("Success");
                window.location.href = "<c:url value = "/admin/customer-list?message=success"/>";
            },

            error: function (response) {
                window.location.href = "<c:url value = "/admin/customer-list?message=error"/>";
            }
        })
    }

    $('#btnSearchCustomer').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    })

    function deleteCustomer(id) {
        var customerId = [id];
        deleteCustomers(customerId);
    }

    function deleteCustomers(data) {
        $.ajax({
            type: "DELETE",
            url: "${customerAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function () {
                location.reload();
            },

            error: function () {
                window.location.href = "<c:url value = "/admin/customer-list?message=error"/>";
            }

        })
    }
</script>
</body>

</html>