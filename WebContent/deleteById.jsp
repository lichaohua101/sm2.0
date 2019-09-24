<%@page import="com.entor.dao.impl.StudentDaoImpl"%>
<%@page import="com.entor.dao.StudentDao"%>
<%@page import="com.entor.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		String id = request.getParameter("id");
		StudentDao dao = new StudentDaoImpl();
		dao.deleteById(Integer.parseInt(id));
		
		String sp = request.getParameter("currentPage");
		//request.getRe
		//页面跳转(重定向)
		response.sendRedirect("list.jsp?currentPage="+sp+"");
	%>
	
</body>
</html>