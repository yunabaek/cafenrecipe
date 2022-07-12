package kr.co.cafenrecipe.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cafenrecipe.board.dao.BoardDAO;
import kr.co.cafenrecipe.board.dto.BoardDTO;

@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardDAO boarddao;
	
	/*리스트*/
	public ModelAndView list() {
		logger.info("Board service 도착");
		ModelAndView mav = new ModelAndView();
		ArrayList<BoardDTO> list = boarddao.list();
		logger.info("list size : "+list.size());
		mav.addObject("size", list.size());
		mav.addObject("list", list);
		mav.setViewName("list");
		return mav;
	}
	/*글 쓰기*/
	public void write(HashMap<String, String> params) {
		int row = boarddao.write(params);
		logger.info(" 입력된 건수 : {}",row);		
	}
	
	/*글 상세보기*/
	public BoardDTO detail(String idx, String method) {		
		if(method.equals("detail")) {
			boarddao.upHit(idx);					
		}		
		return boarddao.detail(idx);
	}
	
	/*글 삭제*/
	public void delete(String idx) {		
		int success = boarddao.delete(idx);
		logger.info("삭제 완료 여부 : "+success);
	}
	
	/*글 수정*/
	public void update(HashMap<String, String> params) {
		int row = boarddao.update(params);		
		logger.info("수정 성공여부 : {}",row);
	}
	
	
	
}
