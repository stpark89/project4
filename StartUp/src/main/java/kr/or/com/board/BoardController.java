package kr.or.com.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.FreeBoard.FreeBoardService;

@Controller
public class BoardController {

	@Autowired
	FreeBoardService free_Service;
	
	//게시판 관련 
	@RequestMapping("/board.do")
	public String board(){
		System.out.println("게시판");
		return "board.boardIndex";
	}
	
	//자유게시판
	@RequestMapping("/FreeBoard.do")
	public String FreeBoard(Model model){
		
		List<FreeBoardDTO> list = free_Service.selectBoard();
		model.addAttribute("list",list);
		return "board.FreeBoardIndex";
	}
	
	//자유게시판 글쓰기
	@RequestMapping(value="/FreeBoardWrite.do", method=RequestMethod.GET)
	public String FreeBoardWrite(){
		return "board.FreeBoardWrite";
	}
	
	//자유게시판 글쓰기 submit 할때
	@RequestMapping(value="/FreeBoardWrite.do", method=RequestMethod.POST)
	public String FreeBoardWriteResult(FreeBoardDTO dto){
		
		String result = free_Service.writeBoard(dto);
		if(result.equals("성공")){
			return "redirect:FreeBoard.do";
		}else{
			return "FreeBoard.do";
		}
	}
	

	//게시판 상세보기
	@RequestMapping("FreeBoardDetail.do")
	public String FreeBoardDetail(String bno, Model model){
		System.out.println("넘어온 글번호 : "+bno);
		FreeBoardDTO dto=free_Service.selectDetail(bno);
		
		if(dto.getTitle().equals("") || dto.getTitle() != null){
			model.addAttribute("dto", dto);
			return "board.FreeBoardDetail";
		}else{
			return null;
		}
		
		
	}
	
}
