<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.flyme.entity.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<title>1708-本组最大的手机交易平台！</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">


<!-- Custom Fonts -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="fonts/font-slider.css" type="text/css">

<!-- jQuery and Modernizr-->
<script src="js/jquery-2.1.1.js"></script>

<!-- Core JavaScript Files -->
<script src="js/bootstrap.min.js"></script>

</head>

<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">

				<div class="col-xs-6"></div>
				<div class="col-xs-6">
					<ul class="top-link">
						<%
							if (session.getAttribute("customer") != null) {
								out.print(
										"<li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown'><span class='glyphicon glyphicon-user'></span>"
												+ ((Customer) request.getSession().getAttribute("customer")).getCallName()
												+ "</a><div class='dropdown-menu' style='center'><div class='dropdown-inner'><ul class='list-unstyled'><li><a href='QuitServlet'>&nbsp;&nbsp;quit</li></ul></div></div></li>");
							} else {
								out.print(
										"<li><a href='account.jsp'><span class='glyphicon glyphicon-user'></span>My Account</a></li>");
							}
						%>
						<li><a
							href="
							<%if (session.getAttribute("customer") != null) {
				out.print("contact.jsp");
			} else {
				out.print("account.jsp");
			}%>">
								<span class="glyphicon glyphicon-envelope"></span> 个人信息
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-4">
				<div id="logo">
					<img src="images/logo.png" />
				</div>
			</div>
			<div class="col-md-4">
				<form class="form-search">
					<input type="text" class="input-medium search-query">
					<button type="submit" class="btn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
			</div>
			<div class="col-md-4">
				<div id="cart">
					<a class="btn btn-1"
						href="<%if (session.getAttribute("customer") != null) {
				out.print("cart.jsp");
			} else {
				out.print("account.jsp");
			}%>"><span
						class="glyphicon glyphicon-shopping-cart"></span>CART : <%
						if (session.getAttribute("cart") != null) {
							out.print(((HashMap) request.getSession().getAttribute("cart")).size());
						} else {
							out.print("0");
						}
					%> ITEM</a>
				</div>
			</div>
		</div>
	</header>
	<!--Navigation-->
	<nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header">
				<span id="heading" class="visible-xs">Categories</span>
				<button type="button" class="btn btn-navbar navbar-toggle"
					data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<i class="fa fa-bars"></i>
				</button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">手机型号</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">Meizu</a></li>
									<li><a href="#">Samsung(无货)</a></li>
									<li><a href="#">Nokia(无货)</a></li>
									<li><a href="#">Lenovo(无货)</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="#">Oppo(无货)</a></li>
									<li><a href="#">HTC(无货)</a></li>
									<li><a href="#">Iphone(无货)</a></li>
								</ul>
							</div>
						</div></li>
					<!--					<li><a href="category.jsp">Software</a></li>-->
				</ul>
			</div>
		</div>
	</nav>
	<!--//////////////////////////////////////////////////-->
	<!--//////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->


	<div class="copyrights">
		Collect from <a href="http://www.cssmoban.com/">网页模板</a>
	</div>
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<a href="ProductDetailServlet?ProductID=1"><img
									src="images/Cgbj0FmANSOASndbAAPf0Qu2l3c067.jpg"
									alt="First slide"></a>
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center"></div>
								</div>
								<!-- /header-text -->
							</div>
							<div class="item">
								<img src="images/Cgbj0FmaOwaAEiz_AAFmT8gF4wE768.jpg"
									alt="Second slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center"></div>
								</div>
								<!-- /header-text -->
							</div>
							<div class="item">
								<img src="images/Cgbj0Fmb09KAOSLuAAG8mjZj90w051.jpg"
									alt="Third slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center"></div>
								</div>
								<!-- /header-text -->
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
					<!-- /carousel -->
				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-4">
						<img src="images/sub-banner1.png" />
					</div>
					<div class="col-sm-4">
						<img src="images/sub-banner2.png" />
					</div>
					<div class="col-sm-4">
						<img src="images/sub-banner3.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading">
						<h2>推荐</h2>
					</div>
					<%
						if (request.getSession().getAttribute("RandProduct") == null) {
							response.sendRedirect("IndexProductServlet");
						} else {
							ArrayList<Product> list = (ArrayList<Product>) request.getSession().getAttribute("RandProduct");
							out.print("<div class='products'>");
							for (int i = 0; i < 4; i++) {
								String str = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'><div class='product'><div class='image'><a href='ProductDetailServlet?ProductID="
										+ list.get(i).getProductID() + "'><img src='phoneimg/240x240/" + list.get(i).getProductID()
										+ list.get(i).getProductColor()
										+ "@240x240.jpg' /></a></div><div class='buttons'><a class='btn cart' href='ProductDetailServlet?ProductID="
										+ list.get(i).getProductID()
										+ "'><span class='glyphicon glyphicon-shopping-cart'>查看详情</span></a></div><div class='caption'><div class='name'><h3><a href='ProductDetailServlet?ProductID="
										+ list.get(i).getProductID() + "'>" + list.get(i).getProductName() + " "
										+ list.get(i).getProductColor() + "</a></h3></div><div class='price'>￥"
										+ list.get(i).getProductPrice() + "<span>￥" + (list.get(i).getProductPrice() + 1000)
										+ "</span></div><div class='rating'><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span></div></div></div></div>";
								out.print(str);
							}
							out.print("</div>");
							out.print("<div class='products'>");
							for (int i = 4; i < 8; i++) {
								String str = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'><div class='product'><div class='image'><a href='ProductDetailServlet?ProductID="
										+ list.get(i).getProductID() + "'><img src='phoneimg/240x240/" + list.get(i).getProductID()
										+ list.get(i).getProductColor()
										+ "@240x240.jpg' /></a></div><div class='buttons'><a class='btn cart' href='ProductDetailServlet?ProductID="
										+ list.get(i).getProductID()
										+ "'><span class='glyphicon glyphicon-shopping-cart'>查看详情</span></span></a></div><div class='caption'><div class='name'><h3><a href='ProductDetailServlet?ProductID="
										+ list.get(i).getProductID() + "'>" + list.get(i).getProductName() + " "
										+ list.get(i).getProductColor() + "</a></h3></div><div class='price'>￥"
										+ list.get(i).getProductPrice() + "<span>￥" + (list.get(i).getProductPrice() + 1000)
										+ "</span></div><div class='rating'><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span></div></div></div></div>";
								out.print(str);
							}
							out.print("</div>");
						}
					%>
					<!-- 		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<div class="product">
												<div class="image"><a href="ProductDetailServlet?ProductID=10"><img src="phoneimg/00/A0/Cix_s1gaoBuAJthwAA1jPCtyxxQ181.png@240x240.jpg" /></a></div>
												<div class="buttons">
													<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
													<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
													<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
												</div>
												<div class="caption">
													<div class="name"><h3><a href="ProductDetailServlet?ProductID=10">魅族 PRO 6s</a></h3></div>
													<div class="price">￥2299<span>￥3299</span></div>
													<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></div>
												</div>
											</div>
										</div>
									 -->

				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-6">
						<img src="images/sub-banner4.jpg" />
					</div>
					<div class="col-sm-6">
						<img src="images/sub-banner5.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading">
						<h2>热销</h2>
					</div>
					<div class="products">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image">
									<a href="product.jsp"><img src="images/iphone.png" /></a>
								</div>
								<div class="buttons">
									<a class="btn cart" href=""><span
										class="glyphicon glyphicon-shopping-cart"></span></a> <a
										class="btn wishlist" href="#"><span
										class="glyphicon glyphicon-heart"></span></a> <a
										class="btn compare" href="#"><span
										class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name">
										<h3>
											<a href="product.jsp">Aliquam erat volutpat</a>
										</h3>
									</div>
									<div class="price">
										$122<span>$98</span>
									</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star-empty"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image">
									<a href="product.jsp"><img src="images/galaxy-s4.jpg" /></a>
								</div>
								<div class="buttons">
									<a class="btn cart" href="#"><span
										class="glyphicon glyphicon-shopping-cart"></span></a> <a
										class="btn wishlist" href="#"><span
										class="glyphicon glyphicon-heart"></span></a> <a
										class="btn compare" href="#"><span
										class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name">
										<h3>
											<a href="product.jsp">Aliquam erat volutpat</a>
										</h3>
									</div>
									<div class="price">
										$122<span>$98</span>
									</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star-empty"></span><span
											class="glyphicon glyphicon-star-empty"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image">
									<a href="product.jsp"><img src="images/galaxy-note.jpg" /></a>
								</div>
								<div class="buttons">
									<a class="btn cart" href="#"><span
										class="glyphicon glyphicon-shopping-cart"></span></a> <a
										class="btn wishlist" href="#"><span
										class="glyphicon glyphicon-heart"></span></a> <a
										class="btn compare" href="#"><span
										class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name">
										<h3>
											<a href="product.jsp">Aliquam erat volutpat</a>
										</h3>
									</div>
									<div class="price">
										$122<span>$98</span>
									</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star-empty"></span><span
											class="glyphicon glyphicon-star-empty"></span><span
											class="glyphicon glyphicon-star-empty"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image">
									<a href="product.jsp"><img src="images/Z1.png" /></a>
								</div>
								<div class="buttons">
									<a class="btn cart" href="#"><span
										class="glyphicon glyphicon-shopping-cart"></span></a> <a
										class="btn wishlist" href="#"><span
										class="glyphicon glyphicon-heart"></span></a> <a
										class="btn compare" href="#"><span
										class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name">
										<h3>
											<a href="product.jsp">Aliquam erat volutpat</a>
										</h3>
									</div>
									<div class="price">
										$122<span>$98</span>
									</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="wrap-footer">
				<div class="row">
					<div class="col-md-3 col-footer footer-1">
						<img src="images/logofooter.png" />
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Lorem Ipsum is simply dummy text of the
							printing and typesetting industry.</p>
					</div>
					<div class="col-md-3 col-footer footer-2">
						<div class="heading">
							<h4>Customer Service</h4>
						</div>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Conditions</a></li>
							<li><a href="#">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-3">
						<div class="heading">
							<h4>My Account</h4>
						</div>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Brands</a></li>
							<li><a href="#">Gift Vouchers</a></li>
							<li><a href="#">Specials</a></li>
							<li><a href="#">Site Map</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-4">
						<div class="heading">
							<h4>Contact Us</h4>
						</div>
						<ul>
							<li><span class="glyphicon glyphicon-home"></span>California,
								United States 3000009</li>
							<li><span class="glyphicon glyphicon-earphone"></span>+91
								8866888111</li>
							<li><span class="glyphicon glyphicon-envelope"></span>infor@yoursite.com</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						Copyright &copy; 2015.Company name All rights reserved.<a
							target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<ul>
								<li><img src="images/visa-curved-32px.png" /></li>
								<li><img src="images/paypal-curved-32px.png" /></li>
								<li><img src="images/discover-curved-32px.png" /></li>
								<li><img src="images/maestro-curved-32px.png" /></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
