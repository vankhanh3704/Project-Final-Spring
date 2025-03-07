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
					<div class="header__login">

						<a href="<c:url value='/login'/>">
							<i class="fa-regular fa-circle-user"></i>
							Đăng nhập
						</a>
					</div>
					<div class="header__bar">
						<i class="fa-solid fa-bars"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</header>

<%--<nav class="navbar-expand-lg navbar-dark fixed-top">--%>
<%--		<div class="row navbar">--%>
<%--			<div class="col-12 col-md-3">--%>
<%--				<div class="logo">--%>
<%--					<a href="">--%>
<%--						<img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo.png?1676257083798"--%>
<%--							 alt="">--%>
<%--					</a>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div class="col-12 col-md-6">--%>
<%--				<div class="item-menu">--%>
<%--					<div class="nav nav1">--%>
<%--						<div class="nav-item p-2">--%>
<%--							<a class="nav-item-link" href="/trang-chu">--%>
<%--								<span style="color: var(--primary-color);">Trang chủ</span>--%>
<%--							</a>--%>
<%--						</div>--%>
<%--						<div class="nav-item p-2">--%>
<%--							<a href='<c:url value='/gioi-thieu'/>'>--%>
<%--								&lt;%&ndash;<span>Giới thiệu</span>&ndash;%&gt;--%>
<%--								<span style="color: var(--primary-color);">Giới thiệu</span>--%>
<%--							</a>--%>
<%--						</div>--%>
<%--						<div class="nav-item p-2">--%>
<%--							&lt;%&ndash;<a class="nav-item-link" href="./Duan.html">&ndash;%&gt;--%>
<%--							<a href='<c:url value='/san-pham'/>'>--%>
<%--								&lt;%&ndash;<span>Sản phẩm</span>&ndash;%&gt;--%>
<%--								<span style="color: var(--primary-color);">Sản phẩm</span>--%>
<%--							</a>--%>
<%--						</div>--%>
<%--						<div class="nav-item p-2">--%>
<%--							<a href='<c:url value='/tin-tuc'/>'>--%>
<%--								&lt;%&ndash;<span>Tin tức</span>&ndash;%&gt;--%>
<%--								<span style="color: var(--primary-color);">Tin tức</span>--%>
<%--							</a>--%>
<%--						</div>--%>
<%--						<div class="nav-item p-2">--%>
<%--							<a href='<c:url value='/lien-he'/>'>--%>
<%--								&lt;%&ndash;<span>Liên hệ</span>&ndash;%&gt;--%>
<%--									<span style="color: var(--primary-color);">Liên hệ</span>--%>
<%--							</a>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div class="collapse navbar-collapse" id="navbarResponsive">--%>
<%--				<ul class="navbar-nav ml-auto">--%>
<%--					&lt;%&ndash;<li class="nav-item active"><a class="nav-link" href="/trang-chu#">Trang chủ&ndash;%&gt;--%>
<%--						&lt;%&ndash;<span class="sr-only">(current)</span>&ndash;%&gt;--%>
<%--					&lt;%&ndash;</a></li>&ndash;%&gt;--%>
<%--					<security:authorize access = "isAnonymous()">--%>
<%--						<li class><a class="nav-link" href="<c:url value='/login'/>">Đăng nhập</a></li>--%>
<%--						<li class="nav-item"><a class="nav-link" href="#">Đăng ký</a></li>--%>
<%--					</security:authorize>--%>
<%--					<security:authorize access = "isAuthenticated()">--%>
<%--						<li class="nav-item"><a class="nav-link" href="#"> Xin chào <%=SecurityUtils.getPrincipal().getUsername()%></a></li>--%>
<%--						<li class="nav-item"><a class="nav-link" href="<c:url value='/logout'/>">Thoát</a></li>--%>
<%--					</security:authorize>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--</nav>--%>