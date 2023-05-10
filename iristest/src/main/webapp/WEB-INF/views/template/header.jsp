<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%-- 헤더 --%>
<head>
<meta charset="UTF-8">
<title></title>
 
<!-- 글꼴 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- Font Awesome CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<!-- Bootswatch CDN-->
       <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/litera/bootstrap.css">
<!-- Bootstrap CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
<%-- jQuery CDN --%>
<script src = "https://code.jquery.com/jquery-3.6.1.js"></script>

<style>
	* {
		font-family: 'Noto Sans KR', 산세리프;
		font-size : 18px;
		/* border:1px dotted gray; */
	}
	
	a {	
		color:black;
	}
	
	p {
		margin-bottom:0;
	}
	.strong{
		font-weight:bolder;
	}
	.light-primary{
		background-color:#cfdffa;
	}
	.fs-14{
		font-size:14px;
	}
	.cursor-pointer{
		cursor: pointer;
	}
	.modal-footer{
		border-top:none;
		padding:0 0.75rem 0.75rem;
	}
	.modal-backdrop{
		background-color: rgba(0,0,0,0);
	}
	.btn.btn-primary{
		background-color: #07114B;
  		border-color: #07114B;
	}
	.list-group-item-action.active {
		background-color: #07114B;
  		border-color: #07114B;
	}
</style>


</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid d-flex mx-5">
		<div class="p-2 flex-row">
			<!-- <a class="navbar-brand strong" href="/">아이리스 연구소 게시판</a> -->
			<a class="navbar-brand strong" href="/">아이리스 연구소 게시판</a>
		</div>
		<div class="p-2 flex-row-reverse">
			<c:choose>
				<c:when test="${loginNo!=null}">
					<span class="">안녕하세요. <a href="/mypage" class="strong">${member.name}</a> 님</span>
					<a href="/logout" class="btn btn-primary my-2 ms-2 my-sm-0" type="button">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="/login" class="btn btn-primary my-2 ms-2 my-sm-0" type="button">로그인</a>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</nav>

<input type="hidden" value="${loginNo}" name="memberNo">