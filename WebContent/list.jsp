<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.entor.dao.impl.StudentDaoImpl"%>
<%@page import="com.entor.dao.StudentDao"%>
<%@page import="com.entor.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
	
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/myjs.js" type="text/javascript" charset="utf-8"></script>
		
</head>
<body>
	<center>
		<%
		Object o = request.getSession().getAttribute("s");
		if (o!=null) {
			Student s = (Student)o;
			%>
			欢迎【${s.getName() }】&nbsp;<a href="logout.jsp">注销用户</a>
			<%
		}
		%>
		<table id="myTable" border="1">
			<%
				String currentPage = request.getParameter("currentPage");
				StudentDao dao = new StudentDaoImpl();
				//页码
				int sp =1;
				//每页的记录数
				int pageSize = 20;
				//总记录数
				int totals = dao.getTotal();
				//总页数
				int pageCounts = totals/pageSize;
				if(totals%pageSize!=0){
					pageCounts++;	
				}
				try{
					sp = Integer.parseInt(currentPage);
				}catch(Exception e){
					sp = 1;
				}
				if(sp>pageCounts){
					sp = pageCounts;
				}
				if(sp<1){
					sp=1;
				}
				
		%>
		<tr>
				<th><input type="checkbox" id="all" onchange="checkAll()"/>全选</th>
				<th>编号</th>
				<th>姓名</th>
				<th>帐号</th>
				<th>密码</th>
				<th>性别</th>
				<th>年龄</th>
				<th>生日</th>
				<th>创建时间</th>
				<th>操作<a href="javascript:void(0)" onclick="deleteMore(<%=sp%>)">批量删除</a></th>
			</tr>		
		<%
				List<Student> list = dao.queryByPage(sp, pageSize);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				for(Student s:list){
				
		%>
			
			<tr>
				
				<tr onmouseOver="mouseOver(this)" onmouseOut="mouseOut(this)">
				<td><input type="checkbox" name="student" value="<%=s.getId()%>"/></td>
				<td><%=s.getId() %></td>
				<td><%=s.getName() %></td>
				<td><%=s.getUsername() %></td>
				<td><%=s.getPassword() %></td>
				<td><%=s.getSex()==1?"男":"女" %></td>
				<td><%=s.getAge() %></td>
				<td><%=s.getBrithday() %></td>
				<td><%=sdf.format(s.getCreateTime()) %></td>
				<td>
					<a href="queryById.jsp?id=<%=s.getId()%>&currentPage=<%=sp%>">修改</a>
<%-- 					<a href="deleteById.jsp?id=<%=s.getId()%>&currentPage=<%=sp%>">删除</a>
 --%>					<a href="javascript:void(0)" onclick="deleteById(<%=sp%>,<%=s.getId()%>)">删除</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		总记录数:<%=totals %>&nbsp;&nbsp;
		总页数数:<%=pageCounts %>&nbsp;&nbsp;
		当前页:<%=sp %>&nbsp;&nbsp;
		<a href="list.jsp?currentPage=1">首页</a>&nbsp;&nbsp;
		<a href="list.jsp?currentPage=<%=sp-1%>">上页</a>&nbsp;&nbsp;
		<a href="list.jsp?currentPage=<%=sp+1%>">下页</a>&nbsp;&nbsp;
		<a href="list.jsp?currentPage=<%=pageCounts %>">末页</a>&nbsp;&nbsp;
	</center>
</body>
</html>