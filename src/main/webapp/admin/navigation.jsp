<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="hidden-xs navbar-brand" href="<c:url value="/admin"/>"><i class="fa fa-fw fa-futbol-o"></i> Sports Lottery Admin</a>
		</div>
		<!-- .navbar-header -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-user"></i> <sec:authentication property="principal.username"/><span class="caret"></span></a>
				<ul class="dropdown-menu">
                    <li>
                        <a href="<c:url value="/admin/j_spring_security_logout"/>"><i class="fa fa-fw fa-power-off"></i> 登出</a>
                    </li>
                </ul>
			</li>
		</ul>
		<!-- .navbar-right -->
	</div>
</nav>