<%@page import="com.entor.dao.impl.StudentDaoImpl"%>
<%@page import="com.entor.dao.StudentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	//获取参数
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("username");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String brithday = request.getParameter("brithday");
		//封装到对象
		Student s =new Student();
		s.setName(name);
		s.setUsername(username);
		s.setPassword(password);
		s.setSex(Integer.parseInt(sex));
		s.setAge(Integer.parseInt(age));
		s.setBrithday(new SimpleDateFormat("yyyy-MM-dd").parse(brithday));
		//保存数据
		StudentDao dao = new StudentDaoImpl();
		dao.add(s);
		//页面跳转(重定向)
		response.sendRedirect("login.jsp");
		
	%>
</body>
</html>