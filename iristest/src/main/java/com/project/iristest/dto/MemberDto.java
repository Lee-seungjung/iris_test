package com.project.iristest.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDto {
	private int memberNo;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String cell;
	private String team;
	private String job;
	private String position;
	private String responsibility;
	private String remarks;
	private String salt;
}
