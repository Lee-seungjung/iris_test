package com.project.iristest.restcontroller;

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
public class MemberRestController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	
	@PostMapping("/login")
	public boolean login(@RequestBody LoginVO inputVO, HttpSession session) {
		try {
			MemberDto dto = memberDao.selectOne(inputVO.getId()); //회원여부 확인
			
			if(dto!=null) { //비밀번호 확인
				String saveSalt = dto.getSalt(); //DB저장 salt
				SHA256Encrypt encrypt = new SHA256Encrypt();
				String pwCheck = encrypt.getEncrypt(inputVO.getPw(), saveSalt); //암호화 처리된 입력pw
				
				MemberDto pwCheckDto = memberDao.pwCheck(pwCheck, dto.getId());
				if(pwCheckDto!=null) {
					session.setAttribute("loginNo", pwCheckDto.getMemberNo()); //세션 저장
					return true;
				}
			}
			return false;
		}catch(Exception e) {
			return false;
		}
	}
	
	@PutMapping("/mypage")
	public boolean mypage(@RequestBody MemberDto dto) {
		return memberDao.update(dto);
	}
	
	
	
}
