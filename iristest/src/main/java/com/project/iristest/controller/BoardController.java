package com.project.iristest.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.iristest.dto.BoardDto;
import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.BoardDao;
import com.project.iristest.repository.MemberDao;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	
	//등록(get)
	@GetMapping("/write")
	public String insert(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		model.addAttribute("member",dto);
		return "board/insert";
	}
	
	//등록(post)
	@PostMapping("/write")
	public String insert(@ModelAttribute BoardDto dto) {
		System.out.println(dto);
		boardDao.insert(dto);
		return "redirect:/board/list";
	}

	//상세
	@GetMapping("/detail")
	public String detail(HttpSession session, Model model, int boardNo) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		
		model.addAttribute("member",dto);
		model.addAttribute("board", boardDao.selectOne(boardNo));
		return "board/detail";
	}
	
	//수정
	@GetMapping("/edit")
	public String edit(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		model.addAttribute("member",dto);
		
		return "board/edit";
	}
	
	//조회
	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		model.addAttribute("member",dto);
		
		//목록 출력
		String type="";
		String keyword="";
		int startNum=0;
		int endNum=20;
		model.addAttribute("list", boardDao.list(type, keyword, startNum, endNum));
		
		return "board/list";
	}
	
}
