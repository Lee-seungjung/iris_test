package com.project.iristest.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardDto {
	private int boardNo;
	private int memberNo;
	private String category;
	private String title;
	private String writer;
	private String content;
	private String startDate;
	private String endTime;
}
