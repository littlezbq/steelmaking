<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.sql.*" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MySQL数据库的链接</title>
</head>
<body>
<%@
String dbDriver="com.mysql.jdbc.Driver";
String dbUrl="jdbc:mysql://localhost:3306/hzxy_db";
String dbUser="root";
String dbPass="123456";
Connection conn=null;
Class.forName(dbDriver);//加载驱动
conn=DriverManager.getConnection(dbUrl, dbUser, dbPass);//获得链接
if(conn!=null)
	out.print("数据库链接成功");
else
	out.print("数据库链接失败");


%>
</body>
</html>