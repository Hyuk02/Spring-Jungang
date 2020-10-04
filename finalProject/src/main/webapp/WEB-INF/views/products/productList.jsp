<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html><html><head><meta charset="UTF-8">
	<title>SONSOO</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/animate.css">
	    
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/resources/css/magnific-popup.css">
	
	<link rel="stylesheet" href="/resources/css/aos.css">
	
	<link rel="stylesheet" href="/resources/css/ionicons.min.css">
	
	<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">
	
	    
	<link rel="stylesheet" href="/resources/css/flaticon.css">
	<link rel="stylesheet" href="/resources/css/icomoon.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<script>
		function addToCart(){
			if(confirm("상품을 장바구니에 추가하시겠습니까?")){
				document.addForm.submit();
			}else{
				document.addForm.reset();
			}
		}
	</script>
</head>

<body>
<jsp:include page="../includes/menu.jsp" />
<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
		<div class="col-md-9 ftco-animate text-center">
			<h1 class="mb-0 bread">SONSOO PRODUCTS</h1>
			<p class="breadcrumbs">
				<span class="mr-2"><a href="index.html">Home</a></span> 
				<span>Product</span>				
			</p>
		</div>
		</div>
	</div>
</div>
<section class="ftco-section bg-light">
<div class="container-fluid">
<form id="searchForm" action="/products/productList" method="get">
<div class="row">		
	<div class="col-md-2">		
		<div class="form-group">
			<select name="type" class="form-control">
				<option value="N">상품</option>
				<option value="S">판매자</option>
			</select>
		</div>		
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<input type="text" name="keyword" class="form-control">
		</div>
	</div>
	<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
	<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
	<button class="btn btn-primary py-1 px-2" style="margin-botton:5px">검색</button>	
</div>
</form>
<br>

<div class="row">
	<c:forEach var="product" items="${list}">
	<div class="col-sm col-md-6 col-lg-3 ftco-animate">	
		<div class="product">
			<a href="/products/product?id=${memberId}&p_id=${product.p_id}" class="img-prod">
				<img class="img-fluid" src="/pimage/<c:out value="${product.tnImage}"/>" alt="Colorlib Template">
				<!-- <span class="status">RECOMMAND</span> -->
			</a>
		
			<div class="text py-3 px-3">
				<h3><a href="#"><c:out value="${product.name}"/></a></h3>
				<div class="d-flex">
					<div class="pricing">
						<p class="price">
						<span class="price">"${product.price}"</span></p>
					</div>
				</div>
				<hr>
				
				<form name="addForm" action="/products/cartPost" method="post">
				<p class="bottom-area d-flex">
					<a href="#" class="add-to-cart"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
					<!-- <input type="button" class="btn btn-primary py-3 px-12" style="float: bottom;" value='Add to Cart' onclick="addToCart()"> -->
					<!-- <input type="button" class="add-to-cart" value="Add to Cart" onclick="addToCart()"><i class="ion-ios-add ml-1"></i> -->
					<a href="#" class="ml-auto"><span><i class="ion-ios-heart-empty"></i></span></a>
				</p>
				<input type="hidden" name="id" value="${memberId}">
				<input type="hidden" id='p_id' name='p_id' value='<c:out value="${product.p_id}"/>'>				
				</form>
			</div>
		</div>	
	</div>
	</c:forEach>
</div>
<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<!-- <li><a href="#">&lt;</a></li>
				<li class="active"><span>1</span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&gt;</a></li> -->
				<c:if test="${pageMaker.prev}">
              		<li><a href='<c:out value="${pageMaker.startPage-1}"/>' name="pageBtn">&lt;</a></li>
              	</c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                	<li name="pageBtn" class="${pageMaker.cri.pageNum==num? "active":""}">
                	<a href='<c:out value="${num}"/>' name="pageBtn">${num}</a>
                	</li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                	<li name="pageBtn"><a href='<c:out value="${pageMaker.endPage+1}"/>' name="pageBtn">&gt;</a></li>
                </c:if>
			</ul>
		</div>
		<hr>
		<!-- <button id='regBtn' type="button" class="btn btn-primary py-1 px-2">상품 등록</button> -->
		<!-- 페이지 번호 클릭시 동작 -->
		<form id='actionForm' action="/products/productList" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type'		value='<c:out value="${ pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' 	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
	</div>
</div>
</div>
</section>

	
	

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
<svg class="circular" width="48px" height="48px">
	<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
	<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
</svg>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>
<script src="/resources/js/main.js"></script>
 <script type="text/javascript" src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		var result = '<c:out value="${result}"/>';//입력,수정,삭제 결과 rttr.addFlashAttribute("result","success");

		$("#regBtn").on("click", function() {
			self.location = "/products/productRegister";
		});
	    
		<%--페이지 이동--%>
		var actionForm = $("#actionForm");
		$("a[name=pageBtn]").on("click",function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();	
			});

		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='fp_id' value='"+
					$(this).attr("href")+"'>");
			actionForm.attr("action","/funding/FProduct");	
			actionForm.submit();	
			});
	});
</script>
<script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>
