package kr.co.cafenrecipe.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cafenrecipe.member.service.MemberService;
import kr.co.cafenrecipe.member.dto.MemberDTO;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberService memberservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {		
		return "index";
	}
	
	/*인덱스 페이지 이동*/
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {		
		return "index";
	}
	
	/*로그인 페이지로 이동*/
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Model model) {
		logger.info("로그인 페이지로 이동");		
		return "loginForm";
	}	
	
	/*로그인*/
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, @RequestParam String id, @RequestParam String pw, 
			HttpSession session) {
		logger.info("로그인 요청"); 
		logger.info(id+"/"+pw);
		
		String page = "redirect:/";
		
		String loginId = memberservice.login(id, pw);
		
		if (loginId != null) {
			page = "redirect:/list";
			session.setAttribute("loginId", loginId);
		}
		return page;
		
	}
	
	/*로그아웃*/
	@RequestMapping (value = "/logout")
	public ModelAndView logout(HttpSession session) {
		
		session.removeAttribute("loginId");
		ModelAndView mav = new ModelAndView("redirect:/");
		mav.addObject("msg","로그아웃이 완료 되었습니다.");
		return mav;
		
	}	
	
	/*회원가입 페이지 이동*/
	@RequestMapping(value = "/joinForm")
	public String joinForm(Model model) {
		logger.info("회원가입 페이지 이동 ");
		return "joinForm";
	}
	
    /*회원가입 */
	@RequestMapping(value = "/join")
	public String join(Model model, @ModelAttribute MemberDTO dto) {
		logger.info("회원가입 요청");
		logger.info("dto:{}",dto.getId());
		return memberservice.join(dto);
	}
	
	/*id찾기 페이지 이동 */
	@RequestMapping(value = "/idfind")
	public String idfind(Model model) {
		logger.info("idfind page 이동");
		return "idfind";
		
	}
	
	/*id찾기*/
	@RequestMapping(value = "/findid")
    @ResponseBody 
    public HashMap<String, Object> findid(
            @RequestParam String name, @RequestParam String birth,
            @RequestParam String email, Object id, HttpSession session) {
		logger.info("로그인 체크:{} / {}", name, birth);

        String success = memberservice.findid(name, birth, email);
        logger.info("아이디 찾기 여부 성공:{}", success);
        HashMap<String, Object> map 
            = new HashMap<String, Object>();
        
        if (success != null) {
        	map.put("success", success);    
        } else {
        	map.put("success", "아이디없음");
        }
        return map;
    }
	
	/*pw찾기 페이지 이동 */
	@RequestMapping(value = "/pwfind")
	public String pwfind(Model model) {
		logger.info("pwfind page 이동");
		return "pwfind";
		
	}
	/*pw찾기*/
	@RequestMapping(value = "/findpw")
    @ResponseBody 
    public HashMap<String, Object> findpw(
            @RequestParam String id
            ,@RequestParam String birth, @RequestParam String email, HttpSession session) {
		
		logger.info("비밀번호 확인시 필수 정보 체크:{}", id);
        String success = memberservice.findpw(id,birth, email);        
        logger.info("비밀번호 찾기 여부 성공:{}", success);   
        
        HashMap<String, Object> map 
            = new HashMap<String, Object>();
        
        if (success != null) {
        	map.put("success", success);    
        } else {
        	map.put("success", "일치하는 정보가 없습니다.");
        }
        return map;
    }
		
	
}
