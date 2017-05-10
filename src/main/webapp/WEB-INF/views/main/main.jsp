<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.wrapper-index {
	background-repeat: no-repeat !important;
	background-position: center !important;
	background-size: cover !important;
	background-attachment: fixed !important;
	height: 100vh;
	width: 100%;
	margin-bottom: 30px;
	align-items: center;
	justify-content: center;
	display: flex;
	float: left;
	transition: all linear 0.3s;
	url:
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
}

.wrapper-inner {
	float: left;
	width: 100%;
	position: relative;
}

.slick-slider {
	padding: 0;
	position: relative;
	text-align: center;
	padding: 10px 0px;
	display: block;
	box-sizing: border-box;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-khtml-user-select: none;
	-ms-touch-action: pan-y;
	touch-action: pan-y;
	-webkit-tap-highlight-color: transparent;
}

.slick-slider .slick-track, .slick-slider .slick-list {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	-o-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.slick-track {
	position: relative;
	top: 0;
	left: 0;
	display: block;
}

.slick-list {
	width: 95%;
	position: relative;
	display: block;
	overflow: hidden;
	margin: 0;
	padding: 0;
}

@media ( max-width : 767px) .hidden-xs {
	display
	:
	 
	none
	!important;

}

.row {
	margin-right: -15px;
	margin-left: -15px;
}

.wrapper-inner .main-fill {
	text-align: center;
}

.wrapper-inner .main-fill .panel {
	background-color: transparent;
	border-radius: 0;
	margin-bottom: 0;
}

.wrapper-inner .main-fill .panel .nav-tabs {
	border: none;
}

.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.nav-tabs {
	border-bottom: 1px solid #ddd;
}

.panel-heading {
	padding: 10px 15px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.nav {
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
}

ul {
	margin: 0;
}

.wrapper-inner .main-fill .panel .panel-body {
	padding: 0px 10px;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul {
	margin: 0;
	position: relative;
	text-align: left;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul li {
	text-align: left;
	float: left;
	position: relative;
	width: 20%;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul li .form-group
	{
	position: relative;
	float: left;
	width: 100%;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul li .form-group input
	{
	border-radius: 0;
	background-color: transparent;
	color: #ff6c26;
	font-family: "Raleway", sans-serif;
	font-size: 12px;
	position: relative;
	font-weight: 400;
}

.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

input {
	line-height: normal;
}

button, input, select, textarea {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

button, input, optgroup, select, textarea {
	margin: 0;
	font: inherit;
	color: inherit;
}

.form-group {
	margin-bottom: 15px;
}

.list-inline {
	padding-left: 0;
	margin-left: -5px;
	list-style: none;
}

.list-inline>li {
	display: inline-block;
	padding-right: 5px;
	padding-left: 5px;
}
</style>
<body>
	<div class="inner-body">
		<!-- <div class="wrapper-index"> -->
		<img class="wrapper-index" src="${pageContext.request.contextPath}/resources/image/plane-beach.jpg">
		<div class="wrapper-inner">
			<div class="row scroll-text hidden-xs">
				<div class="col-sm-12">
					<div class="text-box">
						<h3>
							<i class="fa fa-plane"></i> <span>Flights</span> <br> WHERE
							YOU WANT TO GO? <br> Fly With Us
						</h3>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="text-box hidden-xs">
						<h3>
							<span>Travel</span> <br> THE WORLD YOU <br> NEVER SEEN
							<i class="fa fa-car"></i> <br>

						</h3>

					</div>
				</div>
				<div class="col-sm-12">
					<div class="text-box">
						<h3>
							<span>Hotels</span> <br> We Provide best <span><i
								class="fa fa-globe"></i> </span> quality?
						</h3>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="main-fill">
					<div class="panel">
						<div class="panel-body">
							<!--tab-content-->
							<div class="tab-content">

								<!--tabhotel-->
								<div class="tab-pane fade in" id="tabhotel">
									<h3>Search and Book GuestHouse</h3>
									<ul class="list-inline list-unstyled">
										<li>
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="Enter Your Hotel Name?" required="">
											</div>
										</li>
										<li>
											<div class="form-group">
												<input type="text" class="form-control hasDatepicker"
													placeholder="Check In" id="datepicker3" required="">
												<img class="ui-datepicker-trigger"
													src="${pageContext.request.contextPath}/resources/image/search/icon-calendar.png" alt="Select date"
													title="Select date">
											</div>
										</li>
										<li>
											<div class="form-group">
												<input type="text" class="form-control hasDatepicker"
													placeholder="Check Off" id="datepicker4" required="">
												<img class="ui-datepicker-trigger"
													src="${pageContext.request.contextPath}/resources/image/search/icon-calendar.png" alt="Select date"
													title="Select date">
											</div>
										</li>
										<li><select class="select-one">
												<option selected="selected">1 Room</option>
												<option>2 Room</option>
												<option>3 Room</option>
												<option>4 Room</option>

										</select></li>

										<li><select class="select-one">
												<option selected="selected">1 Guest</option>
												<option>1 Guest</option>
												<option>2 Guest</option>
												<option>No One</option>

										</select></li>
										<!-- <li>
					<select class="select-one">
						<option selected="selected">1 Children</option>
						<option>1 Children</option>
						<option>2 Children</option>
						<option>3 Children</option>
						<option>No One</option>

					</select>
				</li> -->
										<li>
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="Max budget (Optional)">
											</div>
										</li>
										<li><a
											href="html/hotel/hotels_list_one/left_sidebar.html"
											class="btn btn-search-travel">Search Now</a></li>
									</ul>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
