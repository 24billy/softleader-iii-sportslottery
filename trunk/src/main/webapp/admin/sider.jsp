<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<nav class="navbar navbar-inverse navbar-slider">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="visible-xs navbar-brand" href="<c:url value="/admin"/>"><i class="fa fa-fw fa-futbol-o"></i><span class="left5">Sports Lottery Admin</span></a>
	</div>
	<div class="collapse navbar-collapse" id="navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="<c:url value="/admin"/>"><i class="fa fa-fw fa-home"></i><span class="left10"><s:text name="admin.home"/></span></a></li>
			<li><a href="<c:url value="/admin/gameAdmin"/>"><i class="fa fa-fw fa-table"></i><span class="left10"><s:text name="admin.gameAdmin"/></span></a></li>
			<li><a href="<c:url value="/admin/teamAdmin"/>"><i class="fa fa-fw fa-users"></i><span class="left10"><s:text name="admin.teamAdmin"/></span></a></li>
			<li><a href="<c:url value="/admin/announceAdmin"/>"><i class="fa fa-fw fa-bullhorn"></i><span class="left10"><s:text name="admin.announceAdmin"/></span></a></li>
			<li><a href="<c:url value="/admin/adminChart"/>"><i class="fa fa-fw fa-line-chart"></i><span class="left10"><s:text name="admin.adminChart"/></span></a></li>
		</ul>
	</div>
	<!-- .navbar-slider -->
</nav>
