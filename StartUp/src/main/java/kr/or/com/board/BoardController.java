package kr.or.com.board;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.FreeBoard.FreeBoardService;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

@Controller
public class BoardController {

	@Autowired
	private FreeBoardService free_Service;
	
	@Autowired
	private View jsonView;
	
	//게시판 커뮤니티 메인 페이지
	@RequestMapping("/CommunityIndex.do")
	public String Community(){
		return "community.CommunityIndex";
	}
	
	@RequestMapping("/CommunityNews_1.do")
	public View News1(Model model) throws Exception{
		
		URL url = new URL("http://www.moel.go.kr/rss/rss.jsp?bbs_cd=105");
		
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
        String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        
        
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString());
      //  System.out.println("변환을 해봅시다 : " +obj);
        model.addAttribute("Goyoung", obj);
		return jsonView;
	}
	
	//뉴스 rss
	@RequestMapping("/CommunityNews_2.do")
	public View News2(Model model) throws Exception{
		
	
		URL url= new URL("http://imnews.imbc.com/rss/news/news_00.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
    
		String headerType = urlConn.getContentType();
		
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5헤더타입은 ?? : "+headerType);
		
		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		
		
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }

       System.out.println("data 확인좀 : "+data);
        
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); System.out.println("변환을 해봅시다 : " +obj);
        model.addAttribute("joinsmsn", obj);
        return jsonView;
	}
	
	//게시판 관련 
	@RequestMapping("/board.do")
	public String board(){
		System.out.println("게시판");
		return "board.boardIndex";
	}
	
	//자유게시판
	@RequestMapping("/FreeBoard.do")
	public View FreeBoard(Model model){
		
		List<FreeBoardDTO> list = free_Service.selectBoard();
		model.addAttribute("list",list);
		return jsonView;
	}
	
	@RequestMapping("/Back_FreeBoard.do")
	public String backBoard(){
		return "redirect:board.do";
	}
	
	//자유게시판 글쓰기
	@RequestMapping(value="/FreeBoardWrite.do", method=RequestMethod.GET)
	public String FreeBoardWrite(){
		return "board.FreeBoardWrite";
	}
	
	//자유게시판 글쓰기 submit 할때
	@RequestMapping(value="/FreeBoardWrite.do", method=RequestMethod.POST)
	public String FreeBoardWriteResult(FreeBoardDTO dto, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		
		if(logId == null || logId.equals("")){
				dto.setWriter("손님");
		}
		
		String result = free_Service.writeBoard(dto);
		if(result.equals("성공")){
			return "redirect:board.do";
		}else{
			return "board.do";
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
