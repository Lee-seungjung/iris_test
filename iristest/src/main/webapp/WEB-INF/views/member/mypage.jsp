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

<div class = "container-fluid mb-5 mt-3">
	<div class = "row">
	
		<div class = "col-2 offset-1">
			<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
		</div>
		<div class = "col-8">
			<div class="light-primary p-1 mb-2">
				<span class="ms-1">마이페이지</span>
			</div>
			<div class="mx-1">
				<div class="mt-2 mb-2">
					<span class="strong fs-12">개인정보 수정 </span>
					<span class="fs-12">*표시 필수 입력 항목</span>
				</div>
				<div>
					<table class="table align-middle">
						<tbody>
							<tr>
								<th class="table-active">아이디</th>
								<td>${member.id}</td>
								<th class="table-active">이름</th>
								<td>
									<input type="text" value="${member.name}">
								</td>
							</tr>
							<tr>
								<th class="table-active">일반전화</th>
								<td>
									<input type="text" value="${member.tel}">
								</td>
								<th class="table-active">휴대전화</th>
								<td>
									<input type="text" value="${member.cell}">
								</td>
							</tr>
							<tr>
								<th class="table-active">부서명</th>
								<td>
									<input type="text" value="${member.team}">
								</td>
								<th class="table-active">직무</th>
								<td>
									<label for="teamSelect"></label>
									<select name="team" class="" id="teamSelect">
										<option>개발</option>
										<option>관리</option>
										<option>영업</option>
										<option>생산</option>
										<option>개발</option>
										<option>기술</option>
										<option>경영</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="table-active">직위</th>
								<td>
									<label for="positionSelect" ></label>
									<select name="position" class="" id="positionSelect">
										<option>부장</option>
										<option>책임</option>
										<option>과장</option>
										<option>선임</option>
										<option>대리</option>
										<option>주임</option>
										<option>사원</option>
									</select>
									
								</td>
								<th class="table-active">직책</th>
								<td>
									<label for="resSelect" class="form-label"></label>
									<select name="responsibility" class="" id="resSelect">
										<option>본부장</option>
										<option>팀장</option>
										<option>팀원</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="table-active">비고</th>
								<td colspan="3">
									<input type="text" value="${member.remarks}" size="80">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-center mt-3">
					<button class="btn btn-primary m3-1">저장</button>
					<button class="btn btn-secondary ms-1">취소</button>
				</div>
			</div>
		</div>
		
		<input type="hidden" value="${member.job}">
		<input type="hidden" value="${member.position}">
		<input type="hidden" value="${member.responsibility}">
		
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>