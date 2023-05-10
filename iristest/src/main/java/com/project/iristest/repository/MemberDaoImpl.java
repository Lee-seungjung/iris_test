package com.project.iristest.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.iristest.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 회원정보 단일조회(회원번호)
	 */
	@Override
	public MemberDto selectOne(int memberNo) {
		return sqlSession.selectOne("member.selectOneNo",memberNo);
	}
	
	/**
	 * 회원정보 단일조회(아이디)
	 */
	@Override
	public MemberDto selectOne(String id) {
		return sqlSession.selectOne("member.selectOneId",id);
	}
	
	/**
	 * pw 확인
	 */
	@Override
	public MemberDto pwCheck(String pw) {
		return sqlSession.selectOne("member.pwCheck",pw);
	}
	
	/**
	 * 회원정보 수정(memberDto)
	 */
	@Override
	public boolean update(MemberDto dto) {
		return sqlSession.update("member.updateMember",dto)>0;
	}
	
	
}
