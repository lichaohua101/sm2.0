<%@page import="java.util.Date"%>
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
		Student s = dao.queryById(Integer.parseInt(id));
		String name = s.getName();
		String username = s.getUsername();
		String password = s.getPassword();
		int sex = s.getSex();
		int age = s.getAge();
		Date birthday = s.getBrithday(); 
		String sp = request.getParameter("currentPage");
		
		
	%>
	<form action='update.jsp' method='post' >
		姓名：<input type="text" name="name" value="<%=name%>"><br>
		帐号：<input type="text" name="username" value="<%=username%>"><br>
		密码：<input type="password" name="password" value="<%="password"%>"><br>
		<%
		if(s.getSex()==1){
			%>
			性别：<input type='radio' name='sex' value='1' checked='checked'/>男<input type='radio' name='sex' value='0' />女<br/>
			<% 	
		}else{
			%>
			性别：<input type='radio' name='sex' value='1'/>男<input type='radio' name='sex' value='0' checked='checked' />女<br/>
			<% 	
		}
		%>
		年龄：<input type="text" name="age" value="<%=age%>"><br>
		生日：<input type="date" name="birthday" value="<%=birthday%>"><br>
		<input type='hidden' name='id' value="<%=id%>">
		<input type='hidden' name='currentPage' value="<%=sp%>">
		<input type="submit" value="修改"><br>
		</form>
</body>
</html>