package com.project.iristest.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/**
	 * 단일 조회
	 */
	@Override
	public BoardDto selectOne(int boardNo) {
		return sqlSession.selectOne("board.selectOne",boardNo);
	}

	/**
	 * 전체 조회
	 */
	@Override
	public List<BoardDto> list(String type, String keyword, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("board.selectList",map);
	}

	/**
	 * 수정
	 */
	@Override
	public boolean update(BoardDto dto) {
		return sqlSession.update("board.update",dto)>0;
	}
	
	/**
	 * 삭제
	 */
	@Override
	public boolean delete(int boardNo) {
		return sqlSession.delete("board.delete",boardNo)>0;
	}
	
}