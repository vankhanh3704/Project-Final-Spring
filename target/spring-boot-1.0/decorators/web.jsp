<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang chủ" /></title>
<%--	<script type='text/javascript' src="js/2.1.4/jquery.min.js"></script>--%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
		  integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
		  crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet"
		  href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

	<link href="web/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/style.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/base.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/style.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/introduce.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/product.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/contact.css" rel="stylesheet" type="text/css">
	<link href="web/assets/css/detail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/common/web/header.jsp" %>

	<dec:body/>

	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->

<%--	<script src="web/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

	<script src="web/assets/js/bootstrap.bundle.min.js"></script>
	<script src="web/assets/js/jquery.slim.min.js"></script>
	<script src="web/assets/js/variable.js"></script>
	<script src="web/assets/js/navbar.js"></script>
	<script src="web/vendor/jquery/jquery.min.js"></script>
</body>
</html>