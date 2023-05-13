<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="게시글 상세" name="title"/>
</jsp:include>

<style>
	th{
		font-size:15px;
	}
	td, option, td>span{
		font-size:14.5px;
	}
	input, select, textarea{
		border: 1px solid rgba(0, 0, 0, 0.1);
		padding:0.2rem 1rem;
	}
	.w-10{
		width:10%;
	}
	.w-40{
		width:40%;
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
								<th class="table-active text-center w-10">구분</th>
								<td class="w-40">
									${board.category}
								</td>
								<th class="table-active text-center w-10">공지기간</th>
								<td class="w-40">
								
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:parseDate var="endDate" value="${board.endDate}" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber var="nowDay" value="${now.time / (1000*60*60*24)}" integerOnly="true" scope="request"/>
									<fmt:parseNumber var="compareDay" value="${endDate.time / (1000*60*60*24)}" integerOnly="true" scope="request"/>
									
									<c:choose>
										<c:when test="${board.endDate eq '9999-12-31'}">
											<span>무제한</span>
										</c:when>
										<c:otherwise>
											<span>${board.startDate} ~ ${board.endDate}</span>
											<span>(${compareDay-nowDay}일 남음)</span>
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>
							<tr>
								<th class="table-active text-center">작성자</th>
								<td>
									${board.writer}
								</td>
								<th class="table-active text-center">작성 일시</th>
								<td>
									${board.writeDate}
								</td>
							</tr>
							<tr>
								<th class="table-active text-center">제목</th>
								<td colspan="3">
									${board.title}
								</td>
							</tr>
							<tr style="height:200px;">
								<th class="table-active text-center">내용</th>
								<td colspan="3">
									${board.content}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-center mt-3">
					<button class="btn btn-primary me-1 edit-btn">수정</button>
					<button class="btn btn-primary delete-btn">삭제</button>
					<a href="/board/list" class="btn btn-secondary ms-1">목록</a>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
