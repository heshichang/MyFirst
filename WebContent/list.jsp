<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

      <style type="text/css">
      td{
      text-align: center;
      }
      a{
      text-decoration: none;
      }
      </style>
      
       <!-- <script type="text/javascript">
			   function pa(ge){
				   var f=document.getElementById("fr");
				   var p=document.getElementById("pp");
				   p.value=ge;
				   f.submit();}
		</script> -->
  </head>
  
  <body>
<script type="text/javascript">
function del(i){
	if(confirm("确定删除?")){
		location.href="book/del.action?id="+i;
	}
}
	 function rest(){
	   document.getElementById("").value="";
	 	document.getElementById("").value='0';
	 }
</script>
<form action="book/toadd.action">
<input type="hidden" name="op" value="add"> 
	<input type="submit" value="添加">
</form>
	<%-- <form action="" method="post" id="fm">
		<input type="hidden" name="p" value="1" id="p"> 
		:<input type="text" name="" value="" id="">&nbsp; 
		:<select name="" id="">
			<option value="0">请选择
				<c:forEach items="" var="">
					<option value="" ${dd== dd ?'selected':''}>
				</c:forEach>
		</select>&nbsp; 
		<input type="submit" value="查询">
		<input type="button" value="重置" onclick="rest()">
	</form> --%>
	  <table border="0" cellspacing="2" width="100%">
  	<tr align="center"  bgcolor="#999999">
  		<td>图书编号</td>
  		<td>图书名字</td>
  		<td>图书作者</td>
  		<td>购买时间</td>
  		<td>图书类别</td>
  		<td>操作</td>
  	</tr>
  	<c:forEach items="${books}" var="l" varStatus="i"> 
  		<tr style="background-color: ${(i.index+1)%2==0?'#cccccc':''};">
			<td>${l.id }</td>
			<td>${l.name }</td>
			<td>${l.author}</td>
			<td><fmt:formatDate value="${l.buytime}" pattern="yyyy-MM-dd"/>
</td>
			<td>${l.sort.name}</td>
			<td>
			<a href="book/toupdate.action?op=update&id=${l.id }">编辑</a>
			<a href="javascript:del('${l.id }')">删除</a>
			</td>
		</tr>
  	</c:forEach>
  </table>
  
			<%-- <a href="javascript:pa(1)">首页，</a>第${pb.p}页，共${pb.pagetotal}页，
			<a href="javascript:pa(${pb.p-1})">上一页,</a>
			<a href="javascript:pa(${pb.p+1})">下一页，
			</a><a href="javascript:pa(${pb.pagetotal})">尾页</a> --%>
</body>
</html>
