<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap5/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
	rel="stylesheet">

<style type="text/css">
.product-card {
	height: 100%;
	display: flex;
	flex-direction: column;
}

.product-card img {
	object-fit: cover;
}

.product-card h6 {
	flex-grow: 1; /* Đảm bảo tên sách không chiếm hết không gian */
}

.product-card .review-content {
	margin-top: auto;
	margin-bottom: 10px;
}

.card {
	display: flex;
	flex-direction: column;
	height: 100%;
}
</style>
</head>

<body>
	<%@ include file="/bootstrap5/svg.jsp" %>

	<%@ include file="/bootstrap5/header.jsp"%>

	<div class="search-popup">
		<div class="search-popup-container">

			<form role="search" method="get" class="search-form" action="">
				<input type="search" id="search-form" class="search-field"
					placeholder="Type and press enter" value="" name="s" />
				<button type="submit" class="search-submit">
					<svg class="search">
						<use xlink:href="#search"></use></svg>
				</button>
			</form>

			<h5 class="cat-list-title">TRUY CẬP DANH MỤC</h5>

			<ul class="cat-list">
				<li class="cat-list-item"><a href="#" title="BacHo">Tủ sách Bác Hồ</a></li>
				<li class="cat-list-item"><a href="#" title="Lyluanchinhtri">Tủ sách lý luận chính trị</a></li>
				<li class="cat-list-item"><a href="#" title="Luat">Tủ sách Luật</a></li>
				<li class="cat-list-item"><a href="#" title="Chibo">Tủ sách Chi bộ</a></li>
				<li class="cat-list-item"><a href="#" title="Chidao35">Tủ sách Ban chỉ đạo 35</a></li>
				<li class="cat-list-item"><a href="#" title="Giaotrinh">Tủ sách Giáo trình và Tài liệu</a></li>
				<li class="cat-list-item"><a href="#" title="Nhanvat">Tủ sách Nhân vật</a></li>
			</ul>

		</div>
	</div>

	<div class="shopify-grid padding-large">
		<div class="container">
			<div class="row flex-row-reverse g-md-5">
				<main class="col-md-9">
					<div
						class="filter-shop d-flex flex-wrap justify-content-between mb-5">
						<div class="showing-product"></div>
						<div class="sort-by">
							<select id="sorting" class="form-select" data-filter-sort=""
								data-filter-order="">
								<option value="">Mặc định</option>
								<option value="">Tên (A - Z)</option>
								<option value="">Tên (Z - A)</option>
								<option value="">Giá (Thấp - Cao)</option>
								<option value="">Giá (Cao - Thấp)</option>
								<option value="">Đánh giá (Cao nhất)</option>
								<option value="">Đánh giá (Thấp nhất)</option>
							</select>
						</div>
					</div>

					<div class="row product-content product-store">
					    <c:forEach var="book" items="${books}">
					        <div class="col-lg-3 col-md-4 mb-4">
					            <div class="card product-card position-relative p-4 border rounded-3 d-flex flex-column">
					                
					                <div class="position-absolute">
					                    <p class="bg-primary py-1 px-3 fs-6 text-white rounded-2">
					                        ${book.discountPercentage}% off
					                    </p>
					                </div>
					
					                <c:choose>
					                    <c:when test="${book.imageUrl.substring(0, 5) == 'https'}">
					                        <c:url value="${book.imageUrl}" var="imgUrl" />
					                    </c:when>
					                    <c:otherwise>
					                        <c:url value="/image?fname=${book.imageUrl}" var="imgUrl" />
					                    </c:otherwise>
					                </c:choose>
					
					                <!-- Book image -->
					                <img src="${imgUrl}" class="img-fluid shadow-sm" alt="${book.title}"
					                    style="height: 250px; width: 500px; object-fit: cover;">
					
					                <!-- Book title with link -->
					                <h6 class="mt-4 mb-0 fw-bold" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; text-align: justify;">
					                    <a href="${pageContext.request.contextPath}/User/Details-Book?id=${book.id}">
					                        ${book.title}
					                    </a>
					                </h6>
					
					                <!-- Author and rating -->
					                <div class="review-content d-flex mt-auto">
					                    <p class="my-2 me-2 fs-6 text-black-50">${book.author}</p>
					                    <div class="rating text-warning d-flex align-items-center">
					                        <!-- Display stars based on rating -->
					                        <c:forEach var="i" begin="1" end="${book.rating}">
					                            <svg class="star star-fill">
					                                <use xlink:href="#star-fill"></use>
					                            </svg>
					                        </c:forEach>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </c:forEach>
					</div>


					<nav class="py-5" aria-label="Page navigation">
						<ul class="pagination justify-content-center gap-4">
							<li class="page-item disabled"><a class="page-link">Prev</a>
							</li>
							<li class="page-item active" aria-current="page"><span
								class="page-link">1</span></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</main>
				<aside class="col-md-3">
					<div class="sidebar ps-lg-5">
						<div class="widget-menu">
							<div class="widget-search-bar">
								<form class="d-flex border rounded-3 p-2" role="search">
									<input class="form-control border-0 me-2 py-2" type="search"
										placeholder="Tìm kiếm" aria-label="search">
									<button class="btn rounded-3 p-3 d-flex align-items-center"
										type="submit">
										<svg class="search text-light" width="18" height="18">
                        <use xlink:href="#search"></use>
                      </svg>
									</button>
								</form>
							</div>
						</div>
						<div class="widget-product-categories pt-5">
							<div class="section-title overflow-hidden mb-2">
								<h3 class="d-flex flex-column mb-0">Danh mục</h3>
							</div>
							<ul class="product-categories mb-0 sidebar-list list-unstyled">
								<li class="cat-item"><a href="/collections/categories">Tất
										cả</a></li>
								<li class="cat-item"><a href="#">Tủ sách Bác Hồ</a></li>
								<li class="cat-item"><a href="#">Tủ sách lý luận chính
										trị</a></li>
								<li class="cat-item"><a href="#">Tủ sách Luật</a></li>
								<li class="cat-item"><a href="#">Tủ sách Chi bộ</a></li>
								<li class="cat-item"><a href="#">Tủ sách Ban chỉ đạo 35</a>
								</li>
								<li class="cat-item"><a href="#">Tủ sách Giáo trình và
										tài liệu</a></li>
								<li class="cat-item"><a href="#">Tủ sách nhân vật</a></li>
							</ul>
						</div>
						<div class="widget-product-authur pt-5">
							<div class="section-title overflow-hidden mb-2">
								<h3 class="d-flex flex-column mb-0">Tác giả</h3>
							</div>
							<ul class="product-tags mb-0 sidebar-list list-unstyled">
								<li class="tags-item"><a href="#">Chủ tịch Hồ Chí Minh</a>
								</li>
								<li class="tags-item"><a href="#">Cố TBT Nguyễn Phú
										Trọng</a></li>
								<li class="tags-item"><a href="#">Cố TBT Lê Duẩn</a></li>
							</ul>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>

	<%@ include file="/bootstrap5/footer.jsp"%>

	<script src="js/jquery-1.11.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>