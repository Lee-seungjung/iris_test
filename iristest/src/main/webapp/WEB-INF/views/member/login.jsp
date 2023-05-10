<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
<jsp:param value="로그인" name="title"/>
</jsp:include>

<!-- <style>
	input{
		border: 1px solid rgba(0, 0, 0, 0.1);
		padding:0.2rem 1rem;
	}
</style> -->

<style>
	.login-box{
		border:1px solid #D3D3D3;
		width:80%;
		padding:20px;
		margin-top:200px;
	}

</style>

<script>
	$(function(){
		//비밀번호 숨김해제
		$(".fa-eye").click(function(){
			var type = $("[name=pw]").attr("type");
			console.log(type);
			if(type=='password'){
				$("[name=pw]").attr("type","text");
			}else{
				$("[name=pw]").attr("type","password");
			}
		});
		
	});
</script>

<div class = "container-fluid mb-5 mt-3">
	
	<div class = "row">
		<div class = "col-6 offset-3 mt-5 d-flex justify-content-center">
			<div class="login-box rounded-3">
				<div class="inner-top text-center">
					<span class="align-middle" style="font-size:23px;">아이리스 연구소 게시판 로그인</span>
				</div>
				<div class="inner-bottom d-flex mt-4 justify-content-center">
					<div>
						<div class="d-flex align-items-center">
							<div class="p-2 flex-grow-1 strong text-end">아이디</div>
							<div class="p-2 ">
								<input type="text" name="id" class="form-control w-100">
							</div>
						</div>
						<div class="d-flex align-items-center">
							<div class="p-2 flex-grow-1 strong">비밀번호</div>
							<div class="p-2 d-flex align-items-center" style="position:relative;">
								<input type="password" name="pw"class="form-control w-100">
								<i class="fa-solid fa-eye cursor-pointer" style="position:absolute; margin-left:85%;"></i>
							</div>
						</div>
						<div>
							<div class="p-2 text-center">
								<button type="submit" class="btn btn-primary w-50">로그인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>