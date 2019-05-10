<%@page import="Bean.DingdanDao"%>
<%@page import="Model.Dingdan"%>
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
		DingdanDao dingdanDao=new DingdanDao();
		String t=request.getParameter("t");
		if(t!=null){
			String dingdannum=request.getParameter("dingdannum");
			String sql="update s_dingdan set type=1 where dingdannum='"+dingdannum+"'";
			dingdanDao.update(sql);
			
			
		}else{
			
			String[] ids=request.getParameterValues("shenhe");
			if(ids!=null){
				for(int i=0;i<ids.length;i++){
					String sql="update s_dingdan set type=1 where dingdannum='"+ids[i]+"'";
					dingdanDao.update(sql);
				}
				
				
			}
			
		}
		response.sendRedirect("showguanli.jsp");
%>
</body>
</html>