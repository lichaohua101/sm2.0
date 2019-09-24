<%@page import="com.entor.dao.impl.StudentDaoImpl"%>
<%@page import="com.entor.dao.StudentDao"%>
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
		System.out.println("多选删除页面");
		String sp = request.getParameter("currentPage");
		String ids = request.getParameter("ids");
		StudentDao dao = new StudentDaoImpl();
		dao.deleteMore(ids);
		//跳转
		request.getRequestDispatcher("/list").forward(request, response);
		//页面跳转(重定向)
		//response.sendRedirect("list.jsp?currentPage="+sp+"");
		                              
	%>
</body>
</html>