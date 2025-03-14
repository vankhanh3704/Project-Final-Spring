<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký</title>
</head>
<body>

<div class="wrapper">
    <h2>Đăng ký</h2>
    <form:form modelAttribute="register" id="registerForm" method="POST" action="/register" class="login-html">
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <c:if test="${param.registrationSuccess != null}">
                <div class="alert alert-success">Đăng ký thành công! Vui lòng đăng nhập.</div>
            </c:if>
        <div class="input-box">
           <form:input class="input" path="fullName" id="fullName" required="true" placeholder="Họ và tên"/>
            <form:errors path="fullName" cssClass="error" />
        </div>
        <div class="input-box">
            <form:input class="input" path="userName" id="userName" required="true" placeholder="Tài khoản"/>
                <form:errors path="userName" cssClass="error" />
        </div>
        <div class="input-box">
            <form:input class="input" path="password" id="password" type="password" required="true" placeholder="Mật khẩu"/>
            <form:errors path="password" cssClass="error" />
        </div>
        <div class="input-box button">
            <input type="Submit" value="Đăng ký">
        </div>
        <div class="text">
            <h3>Đã có tài khoản? <a href="<c:url value="/login"/>">Đăng nhập ngay</a></h3>
        </div>
    </form:form>
</div>
    <!-- Form đăng ký -->

</body>
</html>