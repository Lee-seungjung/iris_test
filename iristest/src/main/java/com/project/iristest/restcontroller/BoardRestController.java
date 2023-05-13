package com.project.iristest.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.iristest.dto.BoardDto;
import com.project.iristest.repository.BoardDao;
import com.project.iristest.vo.PaginationVO;

@RestController
@RequestMapping("/rest")
public class BoardRestController {
	
	@Autowired
	private BoardDao boardDao;
	
	/*@PostMapping("/board_search")
	public List<BoardDto> search(String type, String keyword, int startNum, int endNum){
		return boardDao.list(type, keyword, startNum, endNum);
	}*/
	
	@PostMapping("/board_search")
	public Map<String, Object> search(String type, String keyword, int startNum, int endNum, Integer page){
		Map<String, Object> map = new HashMap<>();
		int count = boardDao.listCnt(type, keyword);
		
		PaginationVO vo = new PaginationVO();
		if(page==null) {
			vo.setP(1);
		}else {
			vo.setP(page);
		}
		vo.setCount(count);
		vo.setStartNum(startNum);
		vo.setEndNum(vo.getSize());
		vo.setLastBlock(vo.lastBlock());
		
		List<BoardDto> dto = boardDao.list(type, keyword, startNum, endNum);
		map.put("boardList", dto);
		map.put("pagination", vo);
		
		return map;
	}
	
	@DeleteMapping("/board_delete")
	public boolean delete(int boardNo) {
		return boardDao.delete(boardNo);
	}
	
	
}
