<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-inverse navbar-slider">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="visible-xs navbar-brand" href="<c:url value="/admin"/>"><i class="fa fa-fw fa-futbol-o"></i> Sports Lottery Admin</a>
	</div>
	<div class="collapse navbar-collapse" id="navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="<c:url value="/admin"/>"><i class="fa fa-fw fa-home"></i> 首頁</a></li>
			<li><a href="<c:url value="/admin/gameAdmin"/>"><i class="fa fa-fw fa-table"></i> 賽事管理</a></li>
			<li><a href="<c:url value="/admin/teamAdmin"/>"><i class="fa fa-fw fa-users"></i> 隊伍管理</a></li>
			<li><a href="<c:url value="/admin/announceAdmin"/>"><i class="fa fa-fw fa-bullhorn"></i> 公告管理</a></li>
			<li><a href="<c:url value="/admin/adminChart"/>"><i class="fa fa-fw fa-line-chart"></i> 報表</a></li>
		</ul>
	</div>
	<!-- .navbar-slider -->
</nav>
