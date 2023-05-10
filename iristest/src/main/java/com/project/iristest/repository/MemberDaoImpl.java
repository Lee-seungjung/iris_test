package com.project.iristest.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.iristest.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean update(MemberDto dto) {
		return sqlSession.update("member.update")>0;
	}

	@Override
	public MemberDto selectOne(int memberNo) {
		return sqlSession.selectOne("member.selectOne",memberNo);
	}
	
	
}
