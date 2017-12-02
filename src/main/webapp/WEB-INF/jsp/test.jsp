<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
</head>
<body>
	<form method="post" action="/item/">
		<table id="table1" border="1px">
			<input id="search" type="text" name="search" value="${search }" />
			<input type="submit" value="搜索" />
			<tr>
				<th>姓名</th>
				<th>年龄</th>
				<th>日期</th>
			</tr>
			<c:forEach var="tt" items="${p.list }">
				<tr>
					<td>${tt.name }</td>
					<td>${tt.age }</td>
					<td><fmt:formatDate value='${tt.time}' type='time'
							pattern='yyyy-MM-dd' /></td>
				</tr>
			</c:forEach>
		</table>
		<button id="pre">上一页</button>
		<input type="text" value="${p.pageNum }" readonly="readonly" id="curr"
			style="width: 20px" name="curr" /> / <input type="text"
			value="${p.pages }" style="width: 20px" readonly="readonly"
			name="total" />
		<button id="next">下一页</button>

	</form>
</body>
<script src="/js/jquery.1.9.1.min.js"></script>
</script>
<script type="text/javascript">
$(function(){
	page.init();
})

var page = {
	pre:function(){
		$("#pre").click(function() {
			if (${p.isFirstPage}) {
				return;
			}
			$("#curr").val("${p.prePage}")
		})	
	},next:function(){
		$("#next").click(function() {
			if (${p.isLastPage}) {
				return;
			}
			$("#curr").val("${p.nextPage}")
		})
	}	,init:function(){
		this.pre();
		this.next();
	}
		
		
}

	

</script>
</html>
