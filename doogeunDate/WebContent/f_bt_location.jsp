<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%! String click_location = "구월동"; %>
<%@ page errorPage = "error/errorpage.jsp" %>
<%
String location = request.getParameter("clicked_location");
click_location = location;
request.setAttribute("location", click_location);
pageContext.forward("mainPage.jsp");%>