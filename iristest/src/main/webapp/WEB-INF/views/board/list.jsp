<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="게시글 목록" name="title"/>
</jsp:include>

<style>
	th{
		font-size:15px;
	}
	td, option, td>a{
		font-size:14.5px;
	}
	input, select, textarea{
		border: 1px solid rgba(0, 0, 0, 0.1);
		padding:0.2rem 1rem;
		
	}
	.search-box{
		background-color:#E5E5E5;
		border:1px solid rgba(0, 0, 0, 0.125);
	}
	.page-item.active .page-link{
		background-color: #07114B;
	    border-color: #07114B;
	}
	.page-link{
		color:#07114B;
	}
	.page-link:hover{
		color: #07114B;
	}

</style>

<script>
	$(function(){
		
		    
		
	});
</script>

<div class = "container-fluid mb-5 mt-3">
	<div class = "row">
	
		<div class = "col-2 offset-1">
			<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
		</div>
		<div class = "col-8">
			<div class="light-primary p-1 mb-2">
				<span class="ms-1">▌게시판 > 목록</span>
			</div>
			<div class="mx-1">
				<div class="mt-2 mb-2">
					<span class="strong fs-14">• 게시판 조회</span>
				</div>
				<div class="search-box d-flex flex-row align-items-center p-2">
			         <div class="me-2">
			            <span class="strong" style="font-size:16px;">> 검색어</span>
			         </div>
			         <div class="me-2">
			            <select name="category" class="form-select form-select-sm" style="font-size:16px;">
			               <option>검색어 구분</option>
			               <option value="title">제목</option>
			               <option value="writer">등록자</option>
			            </select>
			         </div>
			         <div class="me-2">
			            <input type="text" name="keyword" class="form-control form-control-sm" style="font-size:16px;">
			         </div>
			         <div>
			            <button type="button" class="btn btn-primary btn-sm search-btn">조회</button>
			         </div>
				</div>
			      
				<div class="text-end mt-3">
					<a href="/board/write" class="btn btn-primary btn-sm">등록</a>
				</div>
			      
				<div class="mt-2">
					<table class="table align-middle">
						<tbody>
							<tr class="text-center" style="background-color:#7F7F7F; color:#fff">
								<th style="width:10%;">번호</th>
								<th style="width:10%;">구분</th>
								<th style="width:50%;">제목</th>
								<th style="width:10%;">등록자</th>
								<th style="width:20%;">등록 일시</th>
							</tr>
							
							<c:forEach var="list" items="${list}">
								<tr class="text-center">
									<td>${list.boardNo}</td>
									<td>${list.category}</td>
									<td>
										<a href="/board/detail?boardNo=${list.boardNo}">${list.title}</a>
									</td>
									<td>${list.writer}</td>
									<td>${list.startDate}</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
				
				<!-- 페이지네이션 -->
				<div class="mt-4">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item disabled">
							<a class="page-link" href="#">&laquo;</a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" href="#">&lt;</a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">4</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">5</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">&gt;</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</div>
