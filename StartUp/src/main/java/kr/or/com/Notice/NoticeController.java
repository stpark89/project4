package kr.or.com.Notice;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
/*
 * 작성자 : 박성준
 * 작성일 : 2016-12-26
 * 목적   : 공지사항 및 Q&A 관련
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private View jsonView;
	
	@Autowired 
	private QnaService qnaservice;
	
	//헤더 공지사항 클릭시 - 공지사항 index 부분
	@RequestMapping("/NoticeIndex.do")
	public String NoticeIndex(Model model){
		List<NoticeDTO> list = noticeService.selectAllListNotice();
		model.addAttribute("list", list);
		return "notice.Notice";
	}
	
	@RequestMapping("/Noticelist.do")
	public View NoticeTab(Model model){
		List<NoticeDTO> list = noticeService.selectAllListNotice();
		model.addAttribute("list", list);
		return jsonView;
	}
	
	//Q&A 탭 클릭시
	@RequestMapping("/QnaIndex.do")
	public View QnaIndex(Model model){
		List<QnaDTO> list = qnaservice.qnaList();
		model.addAttribute("qnalist", list);
		
		return jsonView;
	}
	
	//Qna 글쓰기
	@RequestMapping("/WriteQna.do")
	public String QnaWrite(){
		return "notice.Qna";
	}
	
	//공지사항 글쓰기 버튼 클릭시
	@RequestMapping(value="/WriteNotice.do", method=RequestMethod.GET)
	public String NoticeWriteForm(){
		return "notice.writeNoticeForm";
	}
}
