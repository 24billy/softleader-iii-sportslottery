<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="/admin"/>"><i class="fa fa-fw fa-futbol-o"></i> Sports Lottery Admin</a>
		</div>
		
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-user"></i> <sec:authentication property="principal.username"/><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li>
						<a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                    </li>
                	<li>
                		<a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="<c:url value="/admin/j_spring_security_logout"/>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                    </li>
                </ul>
			</li>
		</ul>
		<!-- .navbar-right -->
		
		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value="/admin"/>">首頁</a></li>
				<li><a href="<c:url value="/admin/gameAdmin"/>">賽事管理</a></li>
				<li><a href="<c:url value="/admin/teamAdmin"/>">隊伍管理</a></li>
			</ul>
		</div>
		<!-- .navbar-collapse -->
	</div>
</nav>