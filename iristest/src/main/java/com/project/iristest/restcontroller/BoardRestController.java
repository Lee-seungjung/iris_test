package com.project.iristest.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.iristest.component.SHA256Encrypt;
import com.project.iristest.dto.BoardDto;
import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.BoardDao;
import com.project.iristest.repository.MemberDao;
import com.project.iristest.vo.LoginVO;

@RestController
@RequestMapping("/rest")
public class BoardRestController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	
	@PostMapping("/board_search")
	public List<BoardDto> search(String type, String keyword, int startNum, int endNum){
		return boardDao.list(type, keyword, startNum, endNum);
	}
	
	
	
}
