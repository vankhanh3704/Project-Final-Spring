<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>

<header class="header">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="header__main">
					<div class="header__logo">
						<a href="<c:url value='/trang-chu'/>">
							<img src="${pageContext.request.contextPath}/web/assets/images/logo.png" alt="">
						</a>
					</div>
					<div class="header__menu">
						<ul>
							<li>
								<a href="<c:url value='/trang-chu'/>">
									Trang chủ
								</a>
							<li>
								<a href="<c:url value='/san-pham'/>">
									Sản phẩm
								</a>
							</li>
							<li>
								<a href="<c:url value='/gioi-thieu'/>">
									Giới thiệu
								</a>
							</li>
							<li>
								<a href="<c:url value='/lien-he'/>">
									Liên hệ
								</a>
							</li>
						</ul>
					</div>
					<security:authorize access = "isAnonymous()">
					<div class="header__login">
						<a href="<c:url value='/login'/>">
							<i class="fa-regular fa-circle-user"></i>
							Đăng nhập
						</a>
					</div>
					</security:authorize>
					<security:authorize access = "isAuthenticated()">
					<div class="header__login">
						<div class="nav-item"><a class="nav-link" href="#"> Xin chào, <%=SecurityUtils.getPrincipal().getUsername()%></a></div>
						<div class="nav-item"><a class="nav-link" href="<c:url value='/logout'/>">Thoát</a></div>
					</div>
					</security:authorize>
					<div class="header__bar">
						<i class="fa-solid fa-bars"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</header>
