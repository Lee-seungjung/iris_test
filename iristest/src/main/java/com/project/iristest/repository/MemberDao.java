package com.project.iristest.repository;

import com.project.iristest.dto.MemberDto;

public interface MemberDao {
	//수정
	boolean update(MemberDto dto);
	
	//단일조회
	MemberDto selectOne(int memberNo);
	
}
