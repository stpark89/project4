package kr.or.com.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/board.do")
	public String board(){
		System.out.println("게시판");
		return "board.boardIndex";
	}
	
	//자유게시판
	@RequestMapping("/FreeBoard.do")
	public String FreeBoard(){
		return "board.FreeBoardIndex";
	}
	
}
