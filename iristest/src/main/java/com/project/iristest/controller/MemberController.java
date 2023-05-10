package com.project.iristest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.MemberDao;
import com.project.iristest.vo.LoginVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginNo"); // 회원 번호 삭제
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		//int memberNo = (int)session.getAttribute("loginNo");
		int memberNo = 1;
		model.addAttribute("member", memberDao.selectOne(memberNo));
		return "member/mypage";
	}
}
