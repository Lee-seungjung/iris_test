package com.project.iristest.repository;

import com.project.iristest.dto.MemberDto;

public interface MemberDao {
	
	//단일조회(회원번호)
	MemberDto selectOne(int memberNo);
	//단일조회(아이디)
	MemberDto selectOne(String memberId);
	//pw 확인
	MemberDto pwCheck(String pw, String id);
	
	//수정
	boolean update(MemberDto dto);
}
