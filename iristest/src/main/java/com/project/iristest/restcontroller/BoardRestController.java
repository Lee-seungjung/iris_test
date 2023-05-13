package com.project.iristest.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.iristest.dto.BoardDto;
import com.project.iristest.repository.BoardDao;
import com.project.iristest.repository.MemberDao;

@RestController
@RequestMapping("/rest")
public class BoardRestController {
	
	@Autowired
	private BoardDao boardDao;
	
	@PostMapping("/board_search")
	public List<BoardDto> search(String type, String keyword, int startNum, int endNum){
		return boardDao.list(type, keyword, startNum, endNum);
	}
	
	@DeleteMapping("/board_delete")
	public boolean delete(int boardNo) {
		return boardDao.delete(boardNo);
	}
	
}
