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
		//모달 숨기기
        $("#searchModal").attr("style","display:none;");
        
		//엔터키 이벤트
        $("#keyword").on("keyup",function(key){
	        if(key.keyCode==13) {
	        	$(".search-btn").click();
	        }
        });
        
        //조회 버튼 이벤트
        $(".search-btn").click(function(){
			var type = $("#type option:selected").val();
            var keyword = $("#keyword").val();
            var startNum = 0;
            var endNum = 20;
           
			if(keyword.length==0){
				$(".modal-text").text('검색어를 입력하여 주십시오.');
				$("#searchModal").modal('show');
				return;
			}
			if(type==''){
				$(".modal-text").text('검색어 구분을 선택하여 주십시오.');
				$("#searchModal").modal('show');
				return;
			}
			selectAjax(type, keyword, startNum, endNum); //조회함수
        });
        
        //조회 ajax
        function selectAjax(type, keyword, startNum, endNum){
        	searchData = {
					type:type,
					keyword:keyword,
					startNum:startNum,
					endNum:endNum
			}
			$.ajax({
				url:"/rest/board_search",
				method:"post",
				data:searchData,
				success:function(resp){
					tableTag(resp); //태그생성
				}
			});
        }
        
        //테이블 태그
        function tableTag(list){
        	$("#tbody").empty();
	         var tbody = $("#tbody");
			if(list.length!=0){
				for(var i=0; i<list.length; i++){
		               var tr = $("<tr>").attr("class","text-center");
		               var firTd = $("<td>").text(list[i].boardNo);
		               var secTd = $("<td>").text(list[i].category);
		               var thiTd = $("<td>");
		               var aTag = $("<a>").attr("href","/board/detail?boardNo="+list[i].boardNo).text(list[i].title);
		               thiTd.append(aTag);
		               var fourTd = $("<td>").text(list[i].writer);
		               var fifTd = $("<td>").text(list[i].writeDate);
		               tr.append(firTd).append(secTd).append(thiTd)
		                  .append(fourTd).append(fifTd);
		               tbody.append(tr);
				}
			}else{
				var tr = $("<tr>").attr("class","text-center");
	            var firTd = $("<td>").text("검색 결과가 없습니다").attr("colspan","5");
	            tr.append(firTd);
	            tbody.append(tr);
			}
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
			            <select id="type" class="form-select form-select-sm" style="font-size:16px;">
			               <option value="">검색어 구분</option>
			               <option value="title">제목</option>
			               <option value="writer">등록자</option>
			            </select>
			         </div>
			         <div class="me-2">
			            <input type="text" id="keyword" class="form-control form-control-sm" style="font-size:16px;">
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
						<thead>
							<tr class="text-center" style="background-color:#343a40; color:#fff">
								<th style="width:10%;">번호</th>
								<th style="width:10%;">구분</th>
								<th style="width:50%;">제목</th>
								<th style="width:10%;">등록자</th>
								<th style="width:20%;">등록 일시</th>
							</tr>
						<thead>
						<tbody id="tbody">	
							<c:forEach var="list" items="${list}">
								<tr class="text-center">
									<td>${list.boardNo}</td>
									<td>${list.category}</td>
									<td>
										<a href="/board/detail?boardNo=${list.boardNo}">${list.title}</a>
									</td>
									<td>${list.writer}</td>
									<td>${list.writeDate}</td>
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
		
		<!-- 모달 -->
		<div id="searchModal" class="modal fade" tabindex="-1">
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
</div>
