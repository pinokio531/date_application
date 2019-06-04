<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
request.setAttribute("location", "구월동");
pageContext.forward("mainPage.jsp");
%>
<%@ page errorPage = "error/errorpage.jsp" %>