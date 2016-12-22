package kr.or.com.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.FreeBoard.FreeBoardService;

@Controller
public class BoardController {

	@Autowired
	FreeBoardService free_Service;
	
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
	
	//자유게시판 글쓰기
	@RequestMapping(value="/FreeBoardWrite.do", method=RequestMethod.GET)
	public String FreeBoardWrite(){
		return "board.FreeBoardWrite";
	}
	
	@RequestMapping(value="/FreeBoardWrite.do", method=RequestMethod.POST)
	public String FreeBoardWriteResult(FreeBoardDTO dto){
		
		free_Service.writeBoard(dto);
		
		return "board.FreeBoardWrite";
	}
}
