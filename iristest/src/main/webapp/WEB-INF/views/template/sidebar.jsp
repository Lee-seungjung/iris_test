<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	$(function(){
		$(".sb-write").click(function(){
			$(".list-group-item").removeClass("active");
			$(this).addClass("active");
		});
	});
</script>

<div class="list-group text-center">
	<a href="/" class="list-group-item list-group-item-action active">Home</a>
	<a href="/board/write" class="list-group-item list-group-item-action sb-write">글 등록</a>
</div>
