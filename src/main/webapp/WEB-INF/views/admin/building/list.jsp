<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"></c:url>


<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Danh sách tòa nhà
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
                        <button type="button" id="toggleFormButton" class="btn btn-xs btn-info">
                            <i class="las la-eye"></i>
                        </button>
                    </div>
                    <div class="widget-box__body">

                        <div class="widget-box__main" id="searchFormContainer">
                            <form:form modelAttribute="modelSearch" id="listForm" action="${buildingListURL}"
                                       method="GET">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <div class="col-xl-6">
                                            <label class="name">Tên tòa nhà</label>
                                            <form:input class="form-control" path="name"/>
                                        </div>
                                        <div class="col-xl-6">
                                             <label class="name">Diện tích sàn</label>
                                            <form:input class="form-control" path="floorArea"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <div class="col-xl-4">
                                            <label class="name">Chọn Quận/Huyện</label>
                                            <form:select class="form-control" path="district">
                                                <form:option value="">---Chọn quận---</form:option>
                                                <form:options items="${districts}"></form:options>
                                            </form:select>
                                        </div>
                                        <div class="col-xl-4">
                                            <label class="name">Phường/Xã</label>
                                            <form:input class="form-control" path="ward"/>
                                        </div>
                                        <div class="col-xl-4">
                                            <label class="name">Đường/Phố</label>
                                            <form:input class="form-control" path="street"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <div class="col-xl-4">
                                            <label class="name">Số tầng hầm</label>
                                            <form:input class="form-control" path="numberOfBasement"/>
                                        </div>
                                        <div class="col-xl-4">
                                            <label class="name">Hướng</label>
                                            <form:input class="form-control" path="direction"/>
                                        </div>
                                        <div class="col-xl-4">
                                            <label class="name">Hạng</label>
                                            <form:input class="form-control" path="level"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <div class="col-xl-3">
                                            <label class="name">Diện tích từ</label>
                                            <form:input type="number" class="form-control" path="areaFrom"/>
                                        </div>
                                        <div class="col-xl-3">
                                            <label class="name">Diện tích đến</label>
                                            <form:input type="number" class="form-control" path="areaTo"/>
                                        </div>
                                        <div class="col-xl-3">
                                            <label class="name">Giá thuê từ</label>
                                            <form:input type="number" class="form-control" path="rentPriceFrom"/>
                                        </div>
                                        <div class="col-xl-3">
                                            <label class="name">Giá thuê đến</label>
                                            <form:input type="number" class="form-control" path="rentPriceTo"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <div class="col-xl-4">
                                            <label class="name">Tên quản lý</label>
                                            <form:input type="text" class="form-control" path="managerName"/>
                                        </div>
                                        <div class="col-xl-4">
                                            <label class="name">SĐT quản lý</label>
                                            <form:input type="text" class="form-control" path="managerPhone"/>
                                        </div>
                                        <div class="col-xl-4">
                                            <security:authorize access="hasRole('MANAGER')">
                                                <div>
                                                    <label class="name">Nhân viên</label>
                                                    <form:select class="form-control" path="staffId">
                                                        <form:option value="">---Chọn Nhân viên---</form:option>
                                                        <form:options items="${listStaffs}"></form:options>
                                                    </form:select>
                                                </div>
                                            </security:authorize>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <div class="col-xl-6">
                                            <label class="name pad-20px">Loại toà nhà</label>
                                            <form:checkboxes path="typeCode" items="${typeCodes}"></form:checkboxes>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12 flex-end">
                                    <button type="button" class="btn btn-xs btn-info"
                                            id="btnSearchBuilding">
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
            <a href="/admin/building-edit">
                <button class="btn btn-add" title="Thêm tòa nhà">
                    <i class="las la-plus"></i>
                    Thêm toà nhà
                </button>
            </a>
            <button class="btn btn-rev" title="Xóa tòa nhà" id="btnDeleteCustomers" data-toggle="tooltip" onclick="warningBeforeDelete()">
                <i class="las la-trash-alt"></i>
                Xoá toà nhà
            </button>
        </div>
    </security:authorize>
    <div class="page-content">
        <div class="row" style="font-family: 'Times New Roman', Times, serif;">
            <div class="col-xl-12">
                <table id="tableList" style="margin: 3em 0 1.5em;"
                       class="table table-striped table-bordered table-hover">
                    <thead>
                    </thead>

                    <tbody>
                    <form:form modelAttribute="buildingList">
                        <display:table name="buildingList.listResult" cellspacing="0" cellpadding="0"
                                       requestURI="${buildingListURL}" partialList="true" sort="external"
                                       size="${buildingList.totalItems}" defaultsort="2" defaultorder="ascending"
                                       id="tableList" pagesize="${buildingList.maxPageItems}"
                                       export="false"
                                       class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                       style="margin: 3em 0 1.5em;">
                            <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                            headerClass="center select-cell">
                                <fieldset>
                                    <input type="checkbox" name="checkList" value="${tableList.id}"
                                           id="checkbox_${tableList.id}" class="ace"/>
                                </fieldset>
                            </display:column>
                            <display:column  property="name" title="Tên tòa nhà"/>
                            <display:column  property="address" title="Địa chỉ"/>
                            <display:column  property="numberOfBasement" title="Số tầng hầm"/>
                            <display:column  property="managerName" title="Tên quản lí"/>
                            <display:column  property="managerPhone" title="SĐT quản lí"/>
                            <display:column property="floorArea" title="D.tích sàn"/>
                            <display:column  property="emptyArea" title="D.tích trống"/>
                            <display:column property="rentArea" title="D.tích thuê"/>
                            <display:column  property="brokerageFee" title="Phí môi giới"/>

                            <display:column title="Thao tác">
                                <security:authorize access="hasRole('MANAGER')">
                                    <a title="Giao tòa nhà" class="assignment"
                                       onclick="assignmentBuilding(${tableList.id});">
                                         <i class="las la-plus-circle"></i>
                                    </a>
                                </security:authorize>

                                <a class="fix" title="Sửa tòa nhà"
                                   href='<c:url value="/admin/building-edit-${tableList.id}"/>'>
                                     <i class="las la-pen"></i>
                                </a>
                                <security:authorize access="hasRole('MANAGER')">
                                    <a class="delete" title="Xóa tòa nhà"
                                       onclick="deleteBuilding(${tableList.id})">
                                        <i class="las la-times-circle"></i>
                                    </a>
                                </security:authorize>
                            </display:column>
                        </display:table>
                    </form:form>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
</main>
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
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
                <input type="hidden" name="buildingId" id="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light " id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-light" data-dismiss="modal" id="">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>

   $(document).ready(function() {
        $('#toggleFormButton').click(function() {
            $('#searchFormContainer').toggle(); // Ẩn/hiện form
        });
    });

   function warningBeforeDelete() {
        showAlertBeforeDelete(function () {
            event.preventDefault();
            var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteBuildings(dataArray);
        });
    }

    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    $('#btnDeleteCustomers').click(function (e) {
        var customerIds = [];
        $('input[name="checkList"]:checked').each(function () {
            customerIds.push($(this).val());
        });
        deleteBuildings(customerIds);
    })

    function loadStaff(buildingId) {
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + '/staffs',
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
                window.location.href = "<c:url value = "/admin/building-list?message=error"/>";
                console.log(response);
            }
        })
    }

    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assignment(data);
            console.log("ok");
        } else {
            window.location.href = "<c:url value = "/admin/building-list?message=staff_required"/>";
        }
    })

    function assignment(data) {
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/" + "assignment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.info("Success");
                window.location.href = "<c:url value = "/admin/building-list?message=success"/>";
            },

            error: function (response) {
                console.info("Giao không thành công!");
                window.location.href = "<c:url value = "/admin/building-list?message=error"/>";
                console.log(response);
            }
        })
    }

    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    })

    function deleteBuilding(id) {
        var buildingId = [id];
        deleteBuildings(buildingId);
    }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        var buildingIds = $('#buildingList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    })

    function deleteBuildings(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
                window.location.href = "<c:url value = "/admin/building-list?message=success"/>";
            },

            error: function (respond) {
                console.log("failed");
                console.log(respond);
            }

        })
    }
</script>
</body>

</html>