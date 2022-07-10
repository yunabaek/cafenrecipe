package kr.co.cafenrecipe.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.cafenrecipe.board.dto.BoardDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list();
	
	int write(HashMap<String, String> params);

	void upHit(String idx);

	BoardDTO detail(String idx);

	int delete(String idx);



}





