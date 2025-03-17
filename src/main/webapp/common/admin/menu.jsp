<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Menu -->
<div class="sidebar">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-brand">
        <h2>
            <a href="<c:url value="/trang-chu"/>" style="color: #fff;">
                    <span class="las la-home">
                    </span>
                <span>Trang chủ</span>
            </a>

        </h2>
    </div>
    <div class="sidebar-menu">
        <ul>
            <li>
                <a href="<c:url value='/admin/building-list'/>" class="active">
                    <span class="las la-igloo"></span>
                    <span>Quản lý toà nhà</span>
                </a>
            </li>
            <li>
                <a href="<c:url value='/admin/user-list'/>" >
                    <span class="las la-user-circle"></span>
                    <span>Quản lý tài khoản</span>
                </a>
            </li>
            <li>
                <a href="<c:url value='/admin/customer-list'/>" >
                    <span class="las la-users"></span>
                    <span>Quản lý khách hàng</span>
                </a>
            </li>
        </ul>
    </div>
</div>