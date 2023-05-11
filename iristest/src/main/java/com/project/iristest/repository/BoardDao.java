package com.project.iristest.repository;

import java.util.List;

import com.project.iristest.dto.BoardDto;

public interface BoardDao {
	
	//등록
	void insert(BoardDto dto);
	
	//전체 조회
	List<BoardDto> list();
	

}
