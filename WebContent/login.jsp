<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
	<span style="color:red">${msg }</span>
	<form action="loginCheck.jsp" method="post">
		账号：<input type="text" name=username><br>
		密码：<input type="password" name="password"><br>
		<input type="submit" value="登录">&nbsp;&nbsp;<a href="addForm.jsp">注册帐号</a>
	</form>
</body>
</html>