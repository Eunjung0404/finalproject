<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/result.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${result=='success' }">
	<div>
		
	</div>
		<script type="text/javascript">
			alert("작업 성공");
			location.href="${cp}/qna/list";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("잘못된 입력입니다.");
			location.href="${cp}/qna/qnahome";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>