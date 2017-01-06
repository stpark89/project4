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
public class MBC_News {

	@Autowired
	private View jsonView;
	
	//MBC 뉴스  - 속보 부분
	@RequestMapping("/CommunityNews_2.do")
	public View News2(Model model) throws Exception{
	
		URL url= new URL("http://imnews.imbc.com/rss/news/news_00.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString());
        model.addAttribute("joinsmsn", obj);
        return jsonView;
	}
	
	//MBC 뉴스 - 정치 부분
	@RequestMapping("/JungChi.do")
	public View JungChi(Model model) throws Exception{
		URL url= new URL("http://imnews.imbc.com/rss/news/news_01.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
        model.addAttribute("mbcJung", obj);
        return jsonView;
	}
	
	//MBC 뉴스 - 경제
	@RequestMapping("/GyungJae.do")
	public View GyungJae(Model model) throws Exception{
		URL url= new URL("http://imnews.imbc.com/rss/news/news_04.xml");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
		String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
        model.addAttribute("mbcGyung", obj);
        return jsonView;
	}
	
}
