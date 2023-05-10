package com.project.iristest.repository;

import com.project.iristest.dto.MemberDto;

public interface MemberDao {
	
	//단일조회(회원번호)
	MemberDto selectOne(int memberNo);
	//단일조회(아이디)
	MemberDto selectOne(String memberId);
	//salt 조회
	String findSalt(String memberId);
	//pw 확인
	MemberDto pwCheck(String pw);
	
	//수정
	boolean update(MemberDto dto);
}
