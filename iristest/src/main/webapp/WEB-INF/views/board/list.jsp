<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="게시판" name="title"/>
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
            var page = 1;
           
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
			selectAjax(type, keyword, startNum, endNum, page); //조회함수
        });
        
        //페이지네이션 조회
        $(document).on("click",".pageNum",function(){
        	var judge = $(this).parent().hasClass("active");
        	if(judge) return; //불필요한 ajax 막기
        	
        	var page = $(this).text();
        	var size = 20;
        	var type = $("#type option:selected").val();
            var keyword = $("#keyword").val();
            var startNum = (page-1)*size;
            var endNum = size;
            
            selectAjax(type, keyword, startNum, endNum, page);
        });
        
      	//제일 처음 블럭
        $(document).on("click",".first-block",function(){
        	var nowBlock = $(".active").children().text();
        	if(nowBlock==1) return;
        	
        	var size = 20;
        	var type = $("#type option:selected").val();
            var keyword = $("#keyword").val();
            var startNum = 0;
            var endNum = size;
            
            selectAjax(type, keyword, startNum, endNum, 1);
        });
        
        //이전 블럭
        $(document).on("click",".prev-block",function(){
        	var nowBlock = $(".active").children().text();
        	if(nowBlock==1) return;
        	
        	var page = parseInt(nowBlock)-1;
        	var size = 20;
        	var type = $("#type option:selected").val();
            var keyword = $("#keyword").val();
            var startNum = (page-1)*size;
            var endNum = size;

            selectAjax(type, keyword, startNum, endNum, page);
        });
        
		//다음 블럭
		$(document).on("click",".next-block",function(){
	       	var lastBlock = $("[name=lastBlock]").val();
	       	var nowBlock = $(".active").children().text();
	       	if(nowBlock==lastBlock) return;
	       	
	       	var page = parseInt(nowBlock)+1;
	       	var size = 20;
	       	var type = $("#type option:selected").val();
			var keyword = $("#keyword").val();
			var startNum = (page-1)*size;
			var endNum = size;

            selectAjax(type, keyword, startNum, endNum, page);
		});
      
		//제일 마지막 블럭
        $(document).on("click",".last-block",function(){
	       	var lastBlock = $("[name=lastBlock]").val();
	       	var nowBlock = $(".active").children().text();
	       	if(nowBlock==lastBlock) return;
	       	
	       	var page = lastBlock;
	       	var size = 20;
	       	var type = $("#type option:selected").val();
			var keyword = $("#keyword").val();
			var startNum = (page-1)*size;
			var endNum = size;

            selectAjax(type, keyword, startNum, endNum, page);
		});
        
        //조회 ajax
        function selectAjax(type, keyword, startNum, endNum, page){
        	searchData = {
					type:type,
					keyword:keyword,
					startNum:startNum,
					endNum:endNum,
					page:page
			}
			$.ajax({
				url:"/rest/board_search",
				method:"post",
				data:searchData,
				success:function(resp){
					console.log(resp.boardList);
					console.log(resp.pagination);
					tableTag(resp.boardList); //태그생성
					paginationTag(resp.pagination) //페이지네이션 태그생성
					$("[name=lastBlock]").val(resp.pagination.lastBlock); //검색시 count 변경
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
		               var aTag = $("<a>").attr("href","/detail?boardNo="+list[i].boardNo).text(list[i].title);
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
        
      //페이지네이션 태그생성
        function paginationTag(list){
        	var pagination = $(".pagination");
        	pagination.empty();
        	
        	var f_li = $("<li>");
        	if(list.p==1){
        		 f_li.attr("class","page-item disabled first-block");
        	}else{
        		f_li.attr("class","page-item first-block");
        	}
        	var f_a = $("<a>").attr("class","page-link").attr("href","#").text("«");
        	f_li.append(f_a);
        	
        	var s_li = $("<li>");
        	if(list.p==1){
        		s_li.attr("class","page-item disabled prev-block");
        	}else{
        		s_li.attr("class","page-item prev-block");
        	}
        	var s_a = $("<a>").attr("class","page-link").attr("href","#").text("<");
        	s_li.append(s_a);
        	pagination.append(f_li).append(s_li);
        	
       		if(list.lastBlock==0){
       			var li = $("<li>").attr("class","page-item active");
           		var a = $("<a>").attr("class","page-link pageNum").attr("href","#").text(1);
           		li.append(a);
           		pagination.append(li);
       		}else{
       			for(var i=1; i<=list.lastBlock; i++){
           			var li = $("<li>");
           			if(list.p==i){
           				li.attr("class","page-item active");
           			}else{
           				li.attr("class","page-item");
           			}
               		var a = $("<a>").attr("class","page-link pageNum").attr("href","#").text(i);
               		li.append(a);
               		pagination.append(li);
               	}
       		}

        	var t_li = $("<li>");
        	if(list.p==list.lastBlock){
        		t_li.attr("class","page-item disabled next-block");
        	}else{
        		t_li.attr("class","page-item next-block");
        	}
        	var t_a = $("<a>").attr("class","page-link").attr("href","#").text(">");
        	t_li.append(t_a);
        	
        	var f_li = $("<li>");
        	if(list.p==list.lastBlock){
        		f_li.attr("class","page-item disabled last-block");
        	}else{
        		f_li.attr("class","page-item last-block");
        	}
        	var f_a = $("<a>").attr("class","page-link").attr("href","#").text("»");
        	f_li.append(f_a);
        	pagination.append(t_li).append(f_li);
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
			            <select id="type" class="form-select form-select-sm cursor-pointer" style="font-size:16px;">
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
					<a href="/write" class="btn btn-primary btn-sm">등록</a>
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
										<a href="/detail?boardNo=${list.boardNo}">${list.title}</a>
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
						<li class="page-item disabled first-block">
							<a class="page-link" href="#">&laquo;</a>
						</li>
						<li class="page-item disabled prev-block">
							<a class="page-link" href="#">&lt;</a>
						</li>
						
						<!-- 블럭 생성 -->
						<c:forEach var="i" begin="1" end="${pagination.lastBlock}" step="1" >
							<c:choose>
								<c:when test="${i==1}">
									<li class="page-item active">
										<a class="page-link pageNum" href="#">${i}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link pageNum" href="#">${i}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<li class="page-item next-block">
							<a class="page-link" href="#">&gt;</a>
						</li>
						<li class="page-item last-block">
							<a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
		
		<!-- hidden -->
		<input type="hidden" name="lastBlock" value="${pagination.lastBlock}">
		
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
