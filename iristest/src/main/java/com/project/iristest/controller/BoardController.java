package com.project.iristest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.iristest.dto.BoardDto;
import com.project.iristest.dto.MemberDto;
import com.project.iristest.repository.BoardDao;
import com.project.iristest.repository.MemberDao;
import com.project.iristest.vo.PaginationVO;

@Controller
public class BoardController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	
	//등록(get)
	@GetMapping("/write")
	public String insert(HttpSession session, Model model) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		if(memberNo !=null) { 
			MemberDto dto = memberDao.selectOne(memberNo); 
			model.addAttribute("member",dto);
		}else {
			return "redirect:/login";
		}
		return "board/insert";
	}
	
	//등록(post)
	@PostMapping("/write")
	public String insert(@ModelAttribute BoardDto dto) {
		boardDao.insert(dto);
		return "redirect:/list";
	}

	//상세
	@GetMapping("/detail")
	public String detail(HttpSession session, Model model, int boardNo) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		if(memberNo !=null) { 
			 MemberDto dto = memberDao.selectOne(memberNo); 
			 model.addAttribute("loginNo" , memberNo);
			 model.addAttribute("member", dto);
		}
		
		model.addAttribute("board", boardDao.selectOne(boardNo));
		return "board/detail";
	}
	
	//수정
	@GetMapping("/edit")
	public String edit(HttpSession session, Model model, int boardNo) {
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		MemberDto dto = memberDao.selectOne(memberNo); 
		model.addAttribute("member",dto);
		model.addAttribute("board", boardDao.selectOne(boardNo));
		return "board/edit";
	}
	
	//수정(post)
	@PostMapping("/edit")
	public String edit(@ModelAttribute BoardDto dto, RedirectAttributes attr) {
		boardDao.update(dto);
		attr.addAttribute("boardNo",dto.getBoardNo());
		return "redirect:/detail";
	}
	
	//조회
	@GetMapping("/list")
	public String list(HttpSession session, Model model) {	
		Integer memberNo = (Integer)session.getAttribute("loginNo");
		if(memberNo !=null) { 
			 MemberDto dto = memberDao.selectOne(memberNo); 
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
