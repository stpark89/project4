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
import org.springframework.web.servlet.View;

@Controller
public class Notice {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private View jsonView;
	
	//헤더 공지사항 클릭시 - 공지사항 index 부분
	@RequestMapping("/NoticeIndex.do")
	public String NoticeIndex(Model model){
		List<NoticeDTO> list = noticeService.selectAllListNotice();
		System.out.println(list.toString());
		model.addAttribute("list", list);
		return "notice.Notice";
	}
	
	@RequestMapping("/NoticeView.do")
	public View NoticeTab(){
		return jsonView;
	}
	
	
}
