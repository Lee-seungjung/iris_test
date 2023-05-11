package com.project.iristest.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.iristest.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 등록
	 */
	@Override
	public void insert(BoardDto dto) {
		sqlSession.insert("board.insert",dto);
	}
	
	
	
	
	
}