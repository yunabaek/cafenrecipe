package kr.co.cafenrecipe.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cafenrecipe.board.dto.BoardDTO;

import kr.co.cafenrecipe.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService boardservice;
	
	/*리스트*/
	@RequestMapping(value="/list")
	public ModelAndView list(HttpSession session) {
		logger.info("리스트");
		return boardservice.list();
	}
	
	/*글쓰기 페이지 이동*/
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model) {		
		logger.info("writeForm 이동");
		return "writeForm";
	}
	
	/*글 쓰기*/
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params) {		
		logger.info("write : {}",params);
		boardservice.write(params);
		return "redirect:/list";
	}	
	
	/*글 상세*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String writeForm(Model model, @RequestParam String idx) {		
		logger.info("detail : {}",idx);
		
		BoardDTO dto = boardservice.detail(idx,"detail");
		logger.info("dto : {}",dto.getContent());
		model.addAttribute("info", dto);
		
		return "detail";
	}
	
	/*글 삭제*/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam String idx) {		
		logger.info("삭제 : {}",idx);		
		boardservice.delete(idx);		
		return "redirect:/list";
	}
	
	/*글 수정 페이지로 이동*/
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam String idx) {		
		logger.info("updateForm 요청 : {}",idx);		
		BoardDTO dto = boardservice.detail(idx,"update");
		model.addAttribute("info", dto);		
		return "updateForm";
	}
	
	/*글 수정*/
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, 
			@RequestParam HashMap<String, String> params) {		
		logger.info("update 요청 : {}",params);
		boardservice.update(params);
		return "redirect:/detail?idx="+params.get("idx");
	}
}	
	