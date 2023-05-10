package com.project.iristest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.MemberDao;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private MemberDao memberDao;
	//@Autowired
	//private BoardDao boardDao;
	
	//등록
	@GetMapping("/write")
	public String insert(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		model.addAttribute("member",dto);
		return "board/insert";
	}

	//상세
	@GetMapping("/detail")
	public String detail(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		model.addAttribute("member",dto);
		
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
		
		return "board/list";
	}
	
}
