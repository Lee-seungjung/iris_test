<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<style>
	th{
		font-size:15px;
	}
	td, option{
		font-size:14.5px;
	}
	input, select{
		border: 1px solid rgba(0, 0, 0, 0.1);
		padding:0.2rem 1rem;
	}
</style>

<script>
	$(function(){
		var memberNo = $("[name=memberNo]").val(); //원본 회원번호
		var originName = $("[name=name]").val(); //원본 이름
		var originTel = $("[name=tel]").val(); //원본 전화
		var originCell = $("[name=cell]").val(); //원본 휴대폰
		var originTeam = $("[name=team]").val(); //원본 부서명
		var originJob = $("[name=originJob]").val(); //원본 직무
		var originPosition = $("[name=originPosition]").val(); //원본 직위
		var originResponsibility = $("[name=originResponsibility]").val(); //원본 직책
		var originRemarks = $("[name=remarks]").val(); //원본 비고

		//select 기본 선택
		$("[name=job]").val(originJob).prop("selected",true);
		$("[name=position]").val(originPosition).prop("selected",true);
		$("[name=responsibility]").val(originResponsibility).prop("selected",true);
		
		//수정 이벤트
		$(".save-btn").click(function(e){
			e.preventDefault();
			
			var newName = $("[name=name]").val();
			if(newName==''){
				alert('필수항목을 입력해주세요.');
				return;
			}
			var newTel = $("[name=tel]").val();
			var newCell = $("[name=cell]").val();
			var newTeam = $("[name=team] ").val();
			var newJob = $("#jobSelect option:selected").val();
			var newPosition = $("#positionSelect option:selected").val(); 
			var newResponsibility = $("#resSelect option:selected").val()
			var newRemarks = $("[name=remarks]").val();
			
		    var check = originName==newName && originTel==newTel && originCell==newCell &&
		    					originTeam==newTeam && originJob==newJob && originPosition==newPosition &&
		    					originResponsibility==newResponsibility && originRemarks==newRemarks;
		  
		    if(check){
		    	alert('변경할 항목을 입력해주세요.');
		        return;
		   }else{
				var judge = confirm('저장하시겠습니까?');
				if(judge){
					data={
							memberNo:memberNo,
							name:newName,
							tel:newTel,
							cell:newCell,
							team:newTeam,
							job:newJob,
							position:newPosition,
							responsibility:newResponsibility,
							remarks:newRemarks
					}
					$.ajax({
						url:"./rest/mypage",
						method:"put",
						data:JSON.stringify(data),
                		contentType: 'application/json',
						async: false,
						success:function(resp){
							console.log(resp);
						    if(resp){
							    location.href="/";
						    }
						}
					});
				}
		   }
		    
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
				<span class="ms-1">▌마이페이지</span>
			</div>
			<div class="mx-1">
				<div class="mt-2 mb-2">
					<span class="strong fs-14">개인정보 수정 </span>
					<span class="fs-14">*표시 필수 입력 항목</span>
				</div>
				<div>
					<table class="table align-middle">
						<tbody>
							<tr>
								<th class="table-active">아이디</th>
								<td class="id">${member.id}</td>
								<th class="table-active">* 이름</th>
								<td>
									<input type="text" value="${member.name}" name="name">
								</td>
							</tr>
							<tr>
								<th class="table-active">일반전화</th>
								<td>
									<input type="text" value="${member.tel}" name="tel">
								</td>
								<th class="table-active">휴대전화</th>
								<td>
									<input type="text" value="${member.cell}" name="cell">
								</td>
							</tr>
							<tr>
								<th class="table-active">부서명</th>
								<td>
									<input type="text" value="${member.team}" name="team">
								</td>
								<th class="table-active">직무</th>
								<td>
									<label for="jobSelect"></label>
									<select name="job" id="jobSelect">
										<option value="개발">개발</option>
										<option value="관리">관리</option>
										<option value="영업">영업</option>
										<option value="생산">생산</option>
										<option value="개발">개발</option>
										<option value="기술">기술</option>
										<option value="경영">경영</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="table-active">직위</th>
								<td>
									<label for="positionSelect" ></label>
									<select name="position" class="" id="positionSelect">
										<option value="부장">부장</option>
										<option value="책임">책임</option>
										<option value="과장">과장</option>
										<option value="선임">선임</option>
										<option value="대리">대리</option>
										<option value="주임">주임</option>
										<option value="사원">사원</option>
									</select>
									
								</td>
								<th class="table-active">직책</th>
								<td>
									<label for="resSelect" class="form-label"></label>
									<select name="responsibility" class="" id="resSelect">
										<option value="본부장">본부장</option>
										<option value="팀장">팀장</option>
										<option value="팀원">팀원</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="table-active">비고</th>
								<td colspan="3">
									<input type="text" value="${member.remarks}" size="80" name="remarks">
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
		
		<input type="hidden" value="${member.job}" name="originJob">
		<input type="hidden" value="${member.position}" name="originPosition">
		<input type="hidden" value="${member.responsibility}" name="originResponsibility">
		
	</div>
</div>
