<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="메인" name="title"/>
</jsp:include>

<div class = "container-fluid mb-4">
	<div class = "row">
		<div class = "col-8 offset-2">
			<h1>메인</h1>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>