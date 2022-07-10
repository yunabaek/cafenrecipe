package kr.co.cafenrecipe.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cafenrecipe.member.dao.MemberDAO;
import kr.co.cafenrecipe.member.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired MemberDAO memberdao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public String login(String id, String pw) {
		
		String loginId = null;		
		loginId = memberdao.login(id,pw);
		
		return loginId;
	}

	public String join(MemberDTO dto) {
		logger.info("회원가입 서비스 도착");
		String page = "joinForm";
		if (memberdao.join(dto)>0) {
			page = "loginForm";
		}
		return page;
	}

	public String findid(String name, String birth, String email) {
		return memberdao.findid(name, birth, email);
	}

	public String findpw(String id, String birth, String email) {
		return memberdao.findpw(id, birth, email);
	}





	
	

}
