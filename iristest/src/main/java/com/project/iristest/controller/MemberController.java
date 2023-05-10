package com.project.iristest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.iristest.repository.MemberDao;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		//int memberNo = (int)session.getAttribute("loginNo");
		int memberNo = 1;
		model.addAttribute("member", memberDao.selectOne(memberNo));
		return "member/mypage";
	}
}
