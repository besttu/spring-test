<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>
	<form action="/item/add_edit" method="post">
		<input name="id" value="${t.id }"  type="hidden" /><br> 
		名字： <input name="name" value="${t.name }" /><br>
		年龄： <input name="age" value="${t.age }"  /><br> 
		日期：</span>  <input  value="<fmt:formatDate value='${t.time}' type='time' pattern='yyyy-MM-dd'/>"  />
		 <input name="time" value="${t.time }"  /> <input
			type="submit" />
	</form>
</body>
</html>
