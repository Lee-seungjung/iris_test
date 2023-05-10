<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="게시글 상세" name="title"/>
</jsp:include>

<style>
	th{
		font-size:15px;
	}
	td, option{
		font-size:14.5px;
	}
	input, select, textarea{
		border: 1px solid rgba(0, 0, 0, 0.1);
		padding:0.2rem 1rem;
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
				<span class="ms-1">▌게시판 > 정보</span>
			</div>
			<div class="mx-1">
				<div class="mt-2 mb-2">
					<span class="strong fs-14">• 게시판 글 조회</span>
				</div>
				<div>
					<table class="table align-middle">
						<tbody>
							<tr>
								<th class="table-active text-center">구분</th>
								<td class="">
									?
								</td>
								<th class="table-active text-center">게시기간</th>
								<td>
									?
								</td>
							</tr>
							<tr>
								<th class="table-active text-center">작성자</th>
								<td>
									?
								</td>
								<th class="table-active text-center">작성 일시</th>
								<td>
									?
								</td>
							</tr>
							<tr>
								<th class="table-active text-center">제목</th>
								<td colspan="3">
									?
								</td>
							</tr>
							<tr>
								<th class="table-active text-center">내용</th>
								<td colspan="3">
									?
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-center mt-3">
					<button class="btn btn-primary m3-1 edit-btn">수정</button>
					<button class="btn btn-primary m3-1 delete-btn">삭제</button>
					<a href="/board" class="btn btn-secondary ms-1">목록</a>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
