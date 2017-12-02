<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/helang-Date.css">
</head>
<body>
<h3>hello world</h3>
	<form action="/item/add_edit" method="post">
		<input name="id" value="${t.id }"  type="hidden" /><br> 名字： <input name="name" value="${t.name }" /><br>
		年龄： <input name="age" value="${t.age }"  /><br><span id="dd"> 日期：
			 <input type="text"  name="time"  value="<fmt:formatDate value='${t.time}' type='time' pattern='yyyy-MM-dd'/>"  class="text1 helang-date" placeholder="选择日期">
    <input type="button" class="btn1 helang-date" data-el=".text1" data-year="2015,1974" value="选择日期">
		<input
			type="submit" />
			
	</form>
</body>
<script src="/js/jquery.1.9.1.min.js"></script>
<script type="text/javascript" src="/js/helang-Date.js">

</script>
</html>
