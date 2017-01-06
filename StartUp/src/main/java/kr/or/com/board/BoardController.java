package kr.or.com.board;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.com.DashBoard_News.JTBC_News_DTO;
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
	
	
	//고용 노동부
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
	
	//교육부
	@RequestMapping("/education.do")
	public View education(Model model){
		
		   
			List<DashBoard_education_DTO> dto_list = new ArrayList<DashBoard_education_DTO>();
			
			   try{
				
				SAXBuilder builder = new SAXBuilder(); 
				
				Document jdomdoc = builder.build(new java.net.URL("http://www.korea.go.kr/rss/030000"));
				
				Element root= jdomdoc.getRootElement();
		 		Element peresons_E1 =root.getChild("channel");
		 	
		 		List<Element> list=peresons_E1.getChildren("item");
		 		
		 		for(int i=0;i<list.size(); i++){
		 			Element person_E=list.get(i);
		 			DashBoard_education_DTO dto = new DashBoard_education_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
		 			dto_list.add(dto);
		 		}
		 		
		 		}catch(Exception e){
				   e.printStackTrace();
			   }
		    
		    model.addAttribute("education", dto_list);
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
	@RequestMapping("/FreeBoardDetail.do")
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
