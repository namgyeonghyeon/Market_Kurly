<%@page import="shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_proc.jsp<br>

<%
request.setCharacterEncoding("UTF-8");
	
	String configFolder = "";//웹서버폴더
	int maxSize = 1024*1024*5; //최대 5메가
	String encoding = "UTF-8";
	
	configFolder = config.getServletContext().getRealPath("view/images");
	System.out.println("configFolder:" + configFolder);
	
	MultipartRequest mr = null;
	
	mr = new MultipartRequest(request, 
							configFolder,
							maxSize,
							encoding,
							new DefaultFileRenamePolicy());	
	
	String proimg = mr.getFilesystemName("proimg"); 
	String pname = mr.getParameter("pname");
	ProductDao pdao = ProductDao.getInstance();
	
	int cnt = pdao.inputProduct(mr); 
	String msg,url;
	
	if(cnt > 0){
		msg = "물품등록 성공";
		url = "admin_mall.jsp";
	}else{
		msg = "물품등록 실패";
		url = "admin_insert_Proc.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
