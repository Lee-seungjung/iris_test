package com.project.iristest.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PaginationVO {
	
		private int p = 1;
		private int size =20; //20개씩 조회
		private int count;
		private int blockSize = 10;
		private int startNum;
		private int endNum;
		private int lastBlock; //마지막페이지

		
		// 마지막 게시글이 속한 블럭 번호(마지막 페이지 번호)
		public int pageCount() {
			return (count + (size - 1)) / size;
		}
		
		// 블럭의 끝 번호 (마지막 페이지 번호 = 마지막 항목이 속한 블럭 번호)
		public int lastBlock() {
			return pageCount();
		}
		
}
