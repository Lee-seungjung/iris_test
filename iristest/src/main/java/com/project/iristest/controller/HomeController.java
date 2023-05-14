package com.project.iristest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.BoardDao;
import com.project.iristest.repository.MemberDao;
import com.project.iristest.vo.PaginationVO;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping("/")
	public String home(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		
		 if(memberNo !=null) { 
			 MemberDto dto = memberDao.selectOne(memberNo); 
			 model.addAttribute("loginNo" , memberNo);
			 model.addAttribute("member", dto);
		}
		//목록 출력
		String type="";
		String keyword="";
		int startNum=0;
		int endNum=20;
		int count = boardDao.listCnt(type, keyword);

		PaginationVO vo = new PaginationVO();
		vo.setP(1);
		vo.setCount(count);
		vo.setStartNum(startNum);
		vo.setEndNum(vo.getSize());
		vo.setLastBlock(vo.lastBlock());
		
		model.addAttribute("list", boardDao.list(type, keyword, startNum, endNum));
		model.addAttribute("pagination", vo);
		
		return "board/list";
	}
	
}
