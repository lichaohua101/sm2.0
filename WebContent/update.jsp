<%@page import="com.entor.dao.impl.StudentDaoImpl"%>
<%@page import="com.entor.dao.StudentDao"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.jsp.tagext.SimpleTagSupport"%>
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
	//获取页面传过来的参数
			String sp = request.getParameter("currentPage");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String birthday = request.getParameter("birthday");
			String id = request.getParameter("id");
			//封装参数到对象中
			Student s = new Student();
			s.setName(name);
			s.setUsername(username);
			s.setPassword(password);
//			int  number  = Integer.valueOf("123456");
		    s.setAge(Integer.parseInt(age));
			s.setSex(Integer.valueOf(sex));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				//字符串转转时间类型
				s.setBrithday(sdf.parse(birthday));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			s.setId(Integer.parseInt(id));
			//调用dao更新对数据
			StudentDao dao = new StudentDaoImpl();
			dao.update(s);
			//页面跳转(重定向)
			response.sendRedirect("list.jsp?currentPage="+sp+"");
			
	%>
</body>
</html>