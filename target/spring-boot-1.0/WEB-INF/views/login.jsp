<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
<div class="wrapper">
    <h2>Đăng nhập</h2>
    <form action="j_spring_security_check" method="post">
            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger">
                    Tên đăng nhập hoặc mật khẩu không đúng
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">
                    Bạn không có quyền truy cập
                </div>
            </c:if>
            <c:if test="${param.sessionTimeout != null}">
                <div class="alert alert-danger">
                    Phiên làm việc đã hết hạn
                </div>
            </c:if>
        <div class="input-box">
           <input type="text" name="j_username" placeholder="Tên đăng nhập" required />
        </div>
        <div class="input-box">
            <input type="password" name="j_password" placeholder="Mật khẩu" required />
        </div>
        <div class="input-box button">
            <input type="Submit" value="Đăng nhập">
        </div>
        <div class="text">
            <h3>Chưa có tài khoản? <a href="<c:url value="/register"/>">Đăng ký</a></h3>
        </div>
    </form>
</div>
    <!-- Form đăng nhập -->

</div>
</body>
</html>