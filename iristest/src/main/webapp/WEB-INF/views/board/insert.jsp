<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="게시글 등록" name="title"/>
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
		//사이드바 설정
		$(".list-group-item").removeClass("active");
		$(".sb-write").addClass("active");
		
		//달력 초기설정-이전날짜 막기&첫 달력날짜 오늘로 설정
		var now = Date.now() // 지금 날짜를 밀리초로
		var milli = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		var today = new Date(now-milli).toISOString().split("T")[0]; //'2022-05-11T18:09:38.134Z'를 반환
		document.getElementById("startDate").setAttribute("min", today);
		$("[name=startTime]").val(today);
		
		
		
	});
</script>

<div class = "container-fluid mb-5 mt-3">
	<div class = "row">
	
		<div class = "col-2 offset-1">
			<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
		</div>
		<div class = "col-8">
			<div class="light-primary p-1 mb-2">
				<span class="ms-1">▌게시판 > 등록</span>
			</div>
			<div class="mx-1">
				<div class="mt-2 mb-2">
					<span class="strong fs-14">• 글 신규 등록</span>
					<span class="fs-14">*표시 필수 입력 항목</span>
				</div>
				<div>
					<table class="table align-middle">
						<tbody>
							<tr>
								<th class="table-active">* 구분</th>
								<td class="">
									<label for="categorySelect" class="form-label"></label>
									<select name="category" class="" id="categorySelect">
										<option value="공지">공지</option>
										<option value="자유">자유</option>
										<option value="질문">질문</option>
									</select>
								</td>
								<th class="table-active">* 게시기간</th>
								<td>
									<input type="checkbox" class="ckbox" checked>
									<span style="font-size:15px;" class="mx-1">무제한</span>
									<input type="date" class="me-1" name="startTime" id="startDate"> ~ 
									<input type="date" class="ms-1" name="endTime" disabled>
								</td>
							</tr>
							<tr>
								<th class="table-active">* 제목</th>
								<td colspan="4">
									<input type="text" class="w-100" name="title">
								</td>
							</tr>
							<tr>
								<th class="table-active">* 내용</th>
								<td colspan="3">
									<textarea type="text" class="w-100" name="content" rows="15" style="resize: none;"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-center mt-3">
					<button class="btn btn-primary m3-1 save-btn">저장</button>
					<a href="/" class="btn btn-secondary ms-1">취소</a>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
