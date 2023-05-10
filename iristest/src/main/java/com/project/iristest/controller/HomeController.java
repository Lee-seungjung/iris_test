package com.project.iristest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.MemberDao;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/")
	public String home(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		
		 if(memberNo !=null) { 
			 MemberDto dto = memberDao.selectOne(memberNo); 
			 model.addAttribute("loginNo" , memberNo);
			 model.addAttribute("member",dto);
		}
		return "home";
	}
	
}
