package kr.or.com.DashBoard_News;
/*
 * 작성일 : 2017-01-02
 * 작성자 : 박성준
 * 목 적  : 매일 경재 - rss 관련
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

@Controller
public class Mail_News {

	@Autowired
	private View jsonView;
	
	
	//매일경재 속보 부분
	@RequestMapping("/MailNews.do")
	public View MailNews(Model model)throws Exception{
		URL url = new URL("http://file.mk.co.kr/news/rss/rss_40300001.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
         JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
         System.out.println("매일 속보좀 확인 할께요 : "+obj);
        model.addAttribute("mail_news", obj);
        return jsonView;
	}
	
	//매일경재 정치 부분
	@RequestMapping("/MailJung.do")
	public View MailJung(Model model) throws Exception{
		URL url = new URL("http://file.mk.co.kr/news/rss/rss_30200030.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
         JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
      
        model.addAttribute("mail_jung", obj);
        return jsonView;
	}
	
	//매일경제 경제 부분
	@RequestMapping("/MailGyung.do")
	public View MailGyung(Model model) throws Exception{
		URL url = new URL("http://file.mk.co.kr/news/rss/rss_30100041.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
         JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
         model.addAttribute("mail_gyung", obj);
        return jsonView;
	}
	
	
	
}
