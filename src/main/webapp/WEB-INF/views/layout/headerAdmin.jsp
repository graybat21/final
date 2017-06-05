<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />

  <header class="main-header">
    <!-- Logo -->
    <a href="main.gh" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>G</b>H</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"> <img
						src="${pageContext.request.contextPath}/resources/image/img_logo_admin.png"></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      
    </nav>
  </header>
