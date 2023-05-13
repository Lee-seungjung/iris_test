package com.project.iristest.repository;

import java.util.List;

import com.project.iristest.dto.BoardDto;

public interface BoardDao {
	
	//등록
	void insert(BoardDto dto);
	
	//단일 조회
	BoardDto selectOne(int boardNo);
	//전체 조회 count
	int listCnt(String type, String keyword);
	//검색 조회
	List<BoardDto> list(String type, String keyword, int startNum, int endNum);
	
	//수정
	boolean update(BoardDto dto);
	
	//삭제
	boolean delete(int boardNo);
	
}
