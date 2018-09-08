<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addupd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="js/WdatePicker.js">
	</script>
	
	<script type="text/javascript">
  	function fanhui(){
   		window.location="book/sel.action";
   	}
  </script>
  </head>
  
  <%String op=request.getParameter("op");%>
  
  <body>
  <form action="book/<%=op%>.action" method="post">
  <input type="hidden" name="id" value="${book.id }" readonly="readonly"><br>
  	图书名字:<input type="text" name="name" value="${book.name }" ><br>
  	图书作者:<input type="text" name="author" value="${book.author }" ><br>
  	购买时间:<input type="text" name="buytime" value="<fmt:formatDate value="${book.buytime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" > <br>
  	<!-- :<input type="text" name="did" ><br>
  	:<input type="text" name="" value=""><br> -->
  	图书类别:<select name="sort.sid" id="aa">
			<option value="0">请选择
				<c:forEach items="${sorts}" var="l">
					<option value="${l.sid }" ${book.sort.sid == l.sid ?'selected':''}>${l.name }</option>
				</c:forEach>
		</select>&nbsp;<br>
  	<input type="submit" value="确定" onclick="return IsValid()" >
  	<input type="button" value="返回" onclick="fanhui()">
  </form>
  </body>
  
  <script type="text/javascript" language="javascript">
    function IsValid() {
        if (Trim($("aa").value) == "0") {
            alert("请选择类别！");
            $("aa").focus();
            return false;
        }
        
        return true;
    }
    function $(objId) {
        return document.getElementById(objId);
    }
    function Trim(str) {
        return str.replace(/^\s+|\s+$/g, "");
    }
</script>
</html>
