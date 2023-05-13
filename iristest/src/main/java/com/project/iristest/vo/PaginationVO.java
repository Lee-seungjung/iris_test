package com.project.iristest.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PaginationVO {
	
		private int p = 1;	 //현재 페이지 번호
		private int size =20; //20개씩 조회
		private int count;
		private int blockSize = 10;
		private int startNum;
		private int endNum;
		
		// 현재 페이지 첫 항목 rownum
		public int startRow() {
			return endRow() - (size - 1);
		}

		// 현재 페이지 마지막 항목 rownum
		public int endRow() {
			return p * size;
		}
		
		// 현재 페이지에 표시할 블럭의 시작 번호
		public int startBlock() {
			return (p - 1) / blockSize * blockSize + 1;
		}
		
		
		// 현재 페이지에 표시할 블럭의 끝 번호
		public int endBlock() {
			int value = startBlock() + blockSize - 1;
			return Math.min(value, lastBlock());
		}

		// 마지막 게시글이 속한 블럭 번호(마지막 페이지 번호)
		public int pageCount() {
			return (count + (size - 1)) / size;
		}

		// 블럭의 시작 번호(첫 페이지 번호)
		public int firstBlock() {
			return 1;
		}
		
		// 블럭의 끝 번호 (마지막 페이지 번호 = 마지막 항목이 속한 블럭 번호)
		public int lastBlock() {
			return pageCount();
		}
		
		// 이전 블럭의 번호 반환
		public int prevBlock() {
			return startBlock() - 1;
		}
		
		// 다음 블럭의 번호 반환
		public int nextBlock() {
			return endBlock() + 1;
		}
		
		// 현재 블럭이 첫 번째 블럭인지의 여부를 반환
		public boolean isFirst() {
			return p == 1;
		}
		
		// 현재 블럭이 마지막 블럭인지의 여부를 반환
		public boolean isLast() {
			return p == lastBlock();
		}
		
		// 이전 블럭 구간이 존재하는지의 여부를 반환
		public boolean hasPrev() {
			return startBlock() > 1;
		}
		
		// 다음 블럭 구간이 존재하는지의 여부를 반환
		public boolean hasNext() {
			return endBlock() < lastBlock();
		}

}
