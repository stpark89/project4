package kr.or.com.DashBoard_News;

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
public class JoSun_News {

	
	@Autowired
	private View jsonView;
	
	//조선뉴스 속보 부분
	@RequestMapping("/JoSun.do")
	public View YunHabNews(Model model) throws Exception{
		URL url = new URL("http://myhome.chosun.com/rss/www_section_rss.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		String data="";
		String msg = null;
	    while((msg = br.readLine())!=null)
	        {
	            data += msg;
	        }
	    JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
        model.addAttribute("josun", obj);
	    return jsonView;
	}

	//조선 뉴스 정치 부분
	@RequestMapping("/JosunJung.do")
	public View Josun_Jung(Model model) throws Exception{
		URL url = new URL("http://www.chosun.com/site/data/rss/politics.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		String data="";
		String msg = null;
	    while((msg = br.readLine())!=null)
	        {
	            data += msg;
	        }
	    JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
        model.addAttribute("josun_jung", obj);
	    return jsonView;
	}
	
	
	//조선 뉴스 경제 부분
	@RequestMapping("/JosunGyung.do")
	public View Josun_Gyung(Model model) throws Exception{
		URL url = new URL("http://biz.chosun.com/site/data/rss/rss.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		String data="";
		String msg = null;
	    while((msg = br.readLine())!=null)
        {
            data += msg;
        }
	    JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
        model.addAttribute("josun_Gyung", obj);
	    return jsonView;
	}
	
	
}
