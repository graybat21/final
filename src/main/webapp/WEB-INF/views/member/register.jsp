<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class='no-js'>
<head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/commonUser.js"></script>

</head>
<body class="cms-index-index">

	<div class="wrapper">

		<div class="page one-column">

			<div class="em-wrapper-main">
                    <div class="container container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            <div class="em-main-container em-col1-layout">
                                <div class="row">
                                    <div class="em-col-main col-sm-24">
                                        <div class="account-create">
                                            <div class="page-title">
                                                <h1>Create an Account</h1>
                                            </div>
                                            <form:form commandName="user" method="post" id="form_validate" name="form_validate" onsubmit="return verifyOK()">
                                                	<spring:hasBindErrors name="user">
														<font color="red">
															<c:forEach items="${errors.globalErrors}" var="error">
																<spring:message code="${error.code}" />
															</c:forEach>
														</font>
													</spring:hasBindErrors>
                                                    <input type="hidden" name="success_url" value="" />
                                                    <input type="hidden" name="error_url" value="" />
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name-middlename">
                                                            
                                                                <div class="field name-username">
                                                                    <label for="email" class="required"><em>*</em>Email</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="email" name="email" value="${member.email}" title="Email" maxlength="50" class="input-text required-entry" onkeyup="isExistUser()"/>
                                                                        <font color="red">
                                                                        	<span id="duplicateResult"></span><br>
                                                                        	<form:errors path="email"/>
                                                                        </font>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="field">
                                                                <label for="pw" class="required"><em>*</em>Password</label>
                                                                <div class="input-box">
                                                                    <input type="password" name="pw" id="pw" title="Password" class="input-text required-entry validate-password" />
                                                                	<font color="red"><form:errors path="pw"/></font>
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="confirmation" class="required"><em>*</em>Confirm Password</label>
                                                                <div class="input-box">
                                                                    <input type="password" name="confirmation" title="Confirm Password" id="confirmation" class="input-text required-entry validate-cpassword" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                        	<div class="field name-username">
                                                                <label for="name" class="required"><em>*</em>Name</label>
                                                                <div class="input-box">
                                                                    <input type="text" id="name" name="name" title="Name" maxlength="255" class="input-text required-entry" />
                                                                    <font color="red"><form:errors path="name"/></font>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                        <div class="field">
	                                                            <label for="phone" class="required"><em>*</em>Phone</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="phone" id="phone" title="Phone" value="${member.phone}" class="input-text required-entry" maxlength="13" onkeyup="pressKey()"/>
	                                                                <font color="red"><form:errors path="phone"/></font>
	                                                            </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <div class="buttons-set">
                                                        <p class="back-link"><a href="login.html" class="back-link"><small>&laquo; </small>Back</a>
                                                        </p>
                                                        <button type="submit" title="Submit" class="button"><span><span>Submit</span></span>
                                                        </button>
                                                        <p class="required">* Required Fields</p>
                                                    </div>
                                                
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->




			

		</div>
		<!-- /.page -->

	</div>
	<!-- /.wrapper -->

</body>
</html>