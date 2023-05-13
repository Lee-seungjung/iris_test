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
	.m-btn{
		width:20%;
	}
</style>

<script>
	$(function(){
		$(".delete-btn").click(function(){
			$(".modal-text").text('게시글을 삭제하시겠습니까?');
			$("#boardModal").modal('show');
		});
		
		$(".modal-delete").click(function(){
			var boardNo = $("[name=boardNo]").val();
			$.ajax({
				url:"/rest/board_delete?boardNo="+boardNo,
				method:"delete",
				success:function(){
					location.href="/board/list";
				}
			});
		});
		
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
											<span>(${compareDay-nowDay+1}일 남음)</span>
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
				
					<!-- 작성자 일치여부 확인 후 버튼 다르게 표시 -->
					<c:if test="${member.memberNo eq board.memberNo}">
						<a href="/board/edit?boardNo=${board.boardNo}" class="btn btn-primary me-1">수정</a>
						<button class="btn btn-primary delete-btn">삭제</button>
					</c:if>
					<a href="/board/list" class="btn btn-secondary ms-1">목록</a>
					
				</div>
			</div>
		</div>
		
		<!-- hidden -->
		<input type="hidden" name="boardNo" value="${board.boardNo}">
		
		<!-- 모달 -->
		<div id="boardModal" class="modal fade" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body text-center">
						<span class="modal-text "></span>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-primary m-btn modal-delete">예</button>
						<button type="button" class="btn btn-secondary m-btn" data-bs-dismiss="modal">아니오</button>
					</div>	
				</div>
			</div>
		</div>
		
	</div>
</div>
