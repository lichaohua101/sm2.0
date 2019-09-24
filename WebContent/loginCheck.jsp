<%@page import="com.entor.entity.Student"%>
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		StudentDao dao = new StudentDaoImpl();
		Student s = dao.login(username, password);
		System.out.println(username);
		System.out.println(password);
		if(s!=null){
			//保存学生对象到回话
			request.getSession().setAttribute("s", s);
			request.getRequestDispatcher("/list.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "登录失败");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
				
	
	%>
</body>
</html>