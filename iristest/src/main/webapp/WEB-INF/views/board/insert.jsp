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
		
		//달력 설정
		settingDate();
		
		//게시기간 무제한 체크박스 (비)활성화
		$(".ckbox").click(function(){
			var judge = $(this).prop("checked");
			$("#endDate").attr("disabled",judge);
		});
		
		//입력창 유효성검사
		inputCheck={
				category : false,
				title : false,
				content : false,
				startDate:false,
				allValid:function(){
					return this.category && this.title && this.content && this.startDate;
				}
		};
		
		$(".save-btn").click(function(e){
			e.preventDefault();
			
			var category = $("#categorySelect option:selected").val();
			var title = $("[name=title]").val();
			var content = $("[name=content]").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			
			//카테고리
			if(category==''){
				$(".modal-text").text('게시판 구분을 선택하세요.');
				$("#boardModal").modal('show');
				inputCheck.category=false;
			}else{
				inputCheck.category=true;
			}
			
			//제목
			if(title==''){
				$(".modal-text").text('게시판 제목을 입력하여 주십시오.');
				$("#boardModal").modal('show');
				inputCheck.title=false;
			}else{
				inputCheck.title=true;
			}
			
			//내용
			if(content==''){
				$(".modal-text").text('게시판 내용이 비어있습니다.');
				$("#boardModal").modal('show');
				inputCheck.content=false;
			}else{
				inputCheck.content=true;
			}
			
			//날짜
			var ck = $(".ckbox").prop("checked");			
			if(ck){
				if(startDate==''){
					alert('게시기간을 선택해주세요.');
					inputCheck.startDate=false;
				}else{
					$("[name=startDate]").val(startDate);
					$("[name=endDate]").val("9999-12-31");
					inputCheck.startDate=true;
				}
			}else{
				if(startDate=='' || endDate==''){
					alert('게시기간을 선택해주세요.');
					inputCheck.startDate=false;
				}else{
					$("[name=startDate]").val(startDate);
					$("[name=endDate]").val(endDate);
					inputCheck.startDate=true;
				}
			}

			if(inputCheck.allValid()){
				$("#insert-form").submit();
			}
			
			
		});
		
		
		
		
		//달력 초기설정-이전날짜 막기&첫 달력날짜 오늘로 설정
		function settingDate(){
			var now = Date.now() //현재 날짜를 밀리초로
			var milli = new Date().getTimezoneOffset()*60000; //분단위를 밀리초로 변환
			var today = new Date(now-milli).toISOString().split("T")[0]; //'2023-05-10T18:09:38.134Z' 반환
			document.getElementById("startDate").setAttribute("min", today);
			document.getElementById("endDate").setAttribute("min", today);
			
			var date = new Date();
			var year = date.getYear();
			var month = date.getMonth()+1;
			var lastdate = new Date(year, month, 0).getDate(); //마지막 날짜 추출
			var stringDate = today.substring(0,8)+lastdate;
			
			$("#startDate").val(today);
			$("#endDate").val(stringDate);
		}
		
		
		
		
		
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
				<form action="/write" method="post" id="insert-form">
					<div>
						<table class="table align-middle">
							<tbody>
								<tr>
									<th class="table-active text-center">* 구분</th>
									<td>
										<label for="categorySelect" class="form-label"></label>
										<select name="category" class="" id="categorySelect">
											<option value="">게시판 구분</option>
											<option value="공지">공지</option>
											<option value="자유">자유</option>
											<option value="질문">질문</option>
										</select>
									</td>
									<th class="table-active text-center">게시기간</th>
									<td>
										<input type="checkbox" class="ckbox cursor-pointer" id="cklabel" checked>
										<label for="cklabel" style="font-size:15px;" class="mx-1 cursor-pointer">무제한</label>
										<input type="date" class="me-1" id="startDate"> ~ 
										<input type="date" class="ms-1" id="endDate" disabled>
										<!-- 달력 실제로 넘어가는 값 -->
										<input type="hidden" name="startDate">
										<input type="hidden"name="endDate">
									</td>
								</tr>
								<tr>
									<th class="table-active text-center">* 제목</th>
									<td colspan="4">
										<input type="text" class="w-100" name="title" maxlength="100">
									</td>
								</tr>
								<tr>
									<th class="table-active text-center">* 내용</th>
									<td colspan="3">
										<textarea type="text" class="w-100" name="content" rows="15" style="resize: none;" maxlength="1000"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="text-center mt-3">
						<button type="submit" class="btn btn-primary m3-1 save-btn">저장</button>
						<a href="/list" class="btn btn-secondary ms-1">취소</a>
					</div>
					<!-- hidden 값 -->
					<input type="hidden" name="memberNo" value="${member.memberNo}">
					<input type="hidden" name="writer" value="${member.name}">
				</form>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
	<div id="boardModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body text-center">
					<span class="modal-text "></span>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
				</div>	
			</div>
		</div>
	</div>
	
</div>
