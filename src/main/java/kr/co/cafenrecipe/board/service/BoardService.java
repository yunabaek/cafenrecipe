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

	public void write(HashMap<String, String> params) {
		int row = boarddao.write(params);
		logger.info(" 입력된 건수 : {}",row);		
	}

	public BoardDTO detail(String idx, String method) {		
		if(method.equals("detail")) {
			boarddao.upHit(idx);					
		}		
		return boarddao.detail(idx);
	}

	public void delete(String idx) {		
		int success = boarddao.delete(idx);
		logger.info("삭제 완료 여부 : "+success);
	}
	
	
	
	
	
}
