<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="vi">
<head>
<style>
#header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
	background-color: #fff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

body {
	padding-top: 120px;
}
</style>
</head>

<body>
	<header id="header" class="site-header">

		<div class="top-info border-bottom d-none d-md-block">
			<div class="container-fluid">
				<div class="row g-0">
					<div class="col-md-4">
						<p class="fs-6 my-2 text-center">
							CẦN HỖ TRỢ? GỌI CHÚNG TÔI: <a>0356146325</a> hoặc <a
								href="https://zalo.me/g/ufqosa391" target="_blank">Zalo</a>
						</p>
					</div>
					<div class="col-md-4 border-start border-end">
						<p class="fs-6 my-2 text-center">
							Kỷ niệm ngày thành lập Quân Đội Nhân Dân Việt Nam (22/12/2024),
							giảm sốc 30%! <a class="text-decoration-underline"
								href="shop.jsp">Mua ngay</a>
						</p>
					</div>
					<div class="col-md-4">
						<p class="fs-6 my-2 text-center">2-3 ngày vận chuyển và đổi
							trả chậm nhất 15 ngày</p>
					</div>
				</div>
			</div>
		</div>

		<nav id="header-nav" class="navbar navbar-expand-lg py-3">
			<div class="container">
				<a class="navbar-brand" href="index.jsp"> <img
					src="${pageContext.request.contextPath}/bootstrap5/images/main-logo-1.png" class="logo">
				</a>
				<button class="navbar-toggler d-flex d-lg-none order-3 p-2"
					type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar"
					aria-controls="bdNavbar" aria-expanded="false"
					aria-label="Toggle navigation">
					<svg class="navbar-icon">
              <use xlink:href="#navbar-icon"></use>
            </svg>
				</button>
				<div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar"
					aria-labelledby="bdNavbarOffcanvasLabel">
					<div class="offcanvas-header px-4 pb-0">
						<a class="navbar-brand" href="index.jsp"> <img
							src="${pageContext.request.contextPath}/bootstrap5/images/main-logo-1.png" class="logo">
						</a>
						<button type="button" class="btn-close btn-close-black"
							data-bs-dismiss="offcanvas" aria-label="Close"
							data-bs-target="#bdNavbar"></button>
					</div>
					<div class="offcanvas-body">
						<ul id="navbar"
							class="navbar-nav text-uppercase justify-content-start justify-content-lg-center align-items-start align-items-lg-center flex-grow-1">
							<li class="nav-item"><a class="nav-link me-4"
								href="${pageContext.request.contextPath}/User/Home">TRANG CHỦ</a></li>
							<li class="nav-item"><a class="nav-link me-4"
								href="${pageContext.request.contextPath}/bootstrap5/about.jsp">GIỚI THIỆU</a></li>
							<li class="nav-item"><a class="nav-link me-4"
								href="${pageContext.request.contextPath}/User/Books">KỆ SÁCH</a></li>
							<li class="nav-item"><a class="nav-link me-4"
								href="${pageContext.request.contextPath}/bootstrap5/blog.jsp">BẢN TIN</a></li>
							<li class="nav-item"><a class="nav-link me-4"
								href="${pageContext.request.contextPath}/bootstrap5/contact.jsp">LIÊN HỆ</a></li>
						</ul>
						<div class="user-items d-flex">
							<ul class="d-flex justify-content-end list-unstyled mb-0">
								<li class="search-item pe-3"><a href="#"
									class="search-button"> <svg class="search">
                        <use xlink:href="#search"></use>
                      </svg>
								</a></li>
								<li class="pe-3"><a href="/PROJECT/User/Login"> <svg
											class="user">
					      <use xlink:href="#user"></use>
					    </svg>
								</a></li>
								<li class="cart-dropdown dropdown"><a href="cart.jsp"
									class="dropdown-toggle" data-bs-toggle="dropdown" role="button"
									aria-expanded="false"> <svg class="cart">
                        <use xlink:href="#cart"></use>
                      </svg><span class="fs-6 fw-light">(02)</span>
								</a>
									<div
										class="dropdown-menu animate slide dropdown-menu-start dropdown-menu-lg-end p-3">
										<h4
											class="d-flex justify-content-between align-items-center mb-3">
											<span class="text-primary">Giỏ hàng</span> <span
												class="badge bg-primary rounded-pill">3</span>
										</h4>
										<ul class="list-group mb-3">
											<li
												class="list-group-item bg-transparent d-flex justify-content-between lh-sm">
												<div>
													<h5>
														<a href="single-product.jsp">Secrets of the Alchemist</a>
													</h5>
													<small>High quality in good price.</small>
												</div> <span class="text-primary">$870</span>
											</li>
											<li
												class="list-group-item bg-transparent d-flex justify-content-between lh-sm">
												<div>
													<h5>
														<a href="single-product.jsp">Quest for the Lost City</a>
													</h5>
													<small>Professional Quest for the Lost City.</small>
												</div> <span class="text-primary">$600</span>
											</li>
											<li
												class="list-group-item bg-transparent d-flex justify-content-between">
												<span class="text-capitalize"><b>Total (USD)</b></span> <strong>$1470</strong>
											</li>
										</ul>
										<div class="d-flex flex-wrap justify-content-center">
											<a href="cart.jsp" class="w-100 btn btn-dark mb-1"
												type="submit">Xem giỏ hàng</a> <a href="checkout.jsp"
												class="w-100 btn btn-primary" type="submit">Thanh toán</a>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>