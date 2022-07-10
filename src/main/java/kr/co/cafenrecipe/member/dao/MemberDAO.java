package kr.co.cafenrecipe.member.dao;

import kr.co.cafenrecipe.member.dto.MemberDTO;

public interface MemberDAO {

	String login(String id, String pw);

	int join(MemberDTO dto);

	String findid(String name, String birth, String email);

	String findpw(String id, String birth, String email);


}
