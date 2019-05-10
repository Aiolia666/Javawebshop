<%@page import="Bean.UserDao"%>
<%@page import="Bean.DingdanDao"%>
<%@page import="Model.Shopcart"%>
<%@page import="Bean.ShopcartDao"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
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
	User user=new User();
	user=(User)session.getAttribute("user");
	System.out.print(user.getAddress()+user.getPlace()+user.getUsername());
	UserDao userDao=new UserDao();
	user=userDao.load(user.getUsername());
	if(user.getAddress()==null||user.getPlace()==null){
		request.setAttribute("tip1", "请添加新地址");
		%>
		<jsp:forward page="addplace.jsp"></jsp:forward>
		<% 
	}
	ShopcartDao shopcartDao=new ShopcartDao();
	Shopcart shopcart=null;
	String[] ids=request.getParameterValues("choosebuy");
	for(int i =0;i<ids.length;i++){
		shopcart=new Shopcart();
		int id =Integer.parseInt(ids[i]);
		String sqlli="select * from s_shopcart where id="+id;
		shopcart=shopcartDao.loadone(sqlli);
		DingdanDao dingdanDao=new DingdanDao();
		dingdanDao.add(shopcart, ids[i]);
		sqlli="delete from s_shopcart where id="+id;
		shopcartDao.delete(sqlli);
	}
	
	
	
%>
<script>
	alert("结算成功");
	window.location.href="productlist.html";
</script>
</body>
</html>