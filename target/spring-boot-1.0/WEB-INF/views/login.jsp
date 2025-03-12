<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
<%--	<div class="container">--%>
<%--		<!-- <h1 class="form-heading">login Form</h1> -->--%>
<%--		<div class="login-form">--%>
<%--			<div class="main-div">--%>
<%--				<c:if test="${param.incorrectAccount != null}">--%>
<%--					<div class="alert alert-danger">	--%>
<%--							Username or password incorrect--%>
<%--					</div>--%>
<%--				</c:if>--%>
<%--				<c:if test="${param.accessDenied != null}">--%>
<%--					<div class="alert alert-danger">	--%>
<%--							You Not authorize--%>
<%--					</div>--%>
<%--				</c:if>--%>
<%--				<c:if test="${param.sessionTimeout != null}">--%>
<%--					<div class="alert alert-danger">--%>
<%--							Session Timeout--%>
<%--					</div>--%>
<%--				</c:if>--%>
<%--				<div class="container-fluid" >--%>
<%--					<section class="gradient-custom">--%>
<%--						<div class="page-wrapper">--%>
<%--							<div class="row d-flex justify-content-center align-items-center">--%>
<%--								<div class="col-12 col-md-8 col-lg-6 col-xl-5">--%>
<%--									<div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">--%>
<%--										<div class="card-body p-5">--%>
<%--											<div class="mb-md-5 mt-md-4 pb-5 text-center">--%>
<%--												<h2 class="fw-bold mb-2 text-uppercase">Login</h2>--%>
<%--												<p class="text-white-50 mb-5">Please enter your login and password!</p>--%>
<%--												<form action="j_spring_security_check" id="formLogin" method="post">--%>
<%--												<div class="form-outline form-white mb-4">--%>
<%--													<label class="form-label" for="userName">Email</label>--%>
<%--													<input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập">--%>
<%--												</div>--%>

<%--												<div class="form-outline form-white mb-4">--%>
<%--													<label class="form-label" for="password">Password</label>--%>
<%--													<input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu">--%>
<%--												</div>--%>
<%--												<button type="submit" class="btn btn-primary" >Đăng nhập</button>--%>
<%--												</form>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</section>--%>
<%--				</div>--%>
<%--				&lt;%&ndash;<script src="./assets/dist/js/boostrap-v5/bootstrap.js"></script>&ndash;%&gt;--%>
<%--				&lt;%&ndash;<script src="./assets/dist/js/fontawsome-v5/all.js"></script>&ndash;%&gt;--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<div class="container" id="container">
	<!-- Form đăng ký -->
	<div class="form-container sign-up-container">
		<form action="#" method="post">
			<h1>Tạo tài khoản</h1>
			<input type="text" name="username" placeholder="Tên tài khoản" required />
			<input type="password" name="password" placeholder="Mật khẩu" required />
			<input type="password" name="re_password" placeholder="Nhập lại mật khẩu" required />
			<button type="submit">Đăng ký</button>
		</form>
	</div>

	<!-- Form đăng nhập -->
	<div class="form-container sign-in-container">
		<form action="j_spring_security_check" method="post">
			<h1>Đăng nhập</h1>
			<!-- Hiển thị thông báo lỗi -->
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
			<input type="text" name="j_username" placeholder="Tên đăng nhập" required />
			<input type="password" name="j_password" placeholder="Mật khẩu" required />
			<button type="submit">Đăng nhập</button>
		</form>
	</div>

	<!-- Overlay chuyển đổi giữa đăng nhập và đăng ký -->
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Chào mừng trở lại!</h1>
				<p>Đăng nhập để tiếp tục trải nghiệm</p>
				<button class="ghost" id="signIn">Đăng nhập</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Xin chào!</h1>
				<p>Đăng ký tài khoản để bắt đầu</p>
				<button class="ghost" id="signUp">Đăng ký</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>