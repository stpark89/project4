package kr.or.com.Parliament;

import java.awt.print.Book;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

@Controller
public class PaliamentController {

	@Autowired
	private View jsonView;
	
	@RequestMapping("/Member_Parliament.do")
	public String Parliament_List(){
		System.out.println("의원검색");
		return "parliament.ParliamentList";
	}
	
	@RequestMapping("/XmlParse.do")
	public View xmlParse(Model model)throws Exception{
		    String clientID="";
	        String clientSecret = "";
	        	
	        URL url = new URL("http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberNameInfoList?ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
	        
	        URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 
	        
	        urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
	        
	        String data="";
	        String msg = null;
	        while((msg = br.readLine())!=null)
	        {
	            System.out.println(msg);
	            data += msg;
	        }
	        
	        List<Book> list = null; //결과데이터 담을 리스트 
	        System.out.println(data); //응답받은 xml문서 xml문서로부터 내가 원하는 값 탐색하기(xml 파싱)
	        /* XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	         XmlPullParser parser = factory.newPullParser(); //연결하는거 담고 
	         parser.setInput(new StringReader(data));
	         int eventType= parser.getEventType();
	         Book b = null;
	         while(eventType != XmlPullParser.END_DOCUMENT){
	             switch(eventType){
	             case XmlPullParser.END_DOCUMENT://문서의 끝 
	                 break;
	             case XmlPullParser.START_DOCUMENT:
	                 list = new ArrayList<Book>();
	                 break;
	             case XmlPullParser.START_TAG:{ //무조건 시작하면 만남 
	                 String tag = parser.getName();
	                 switch(tag){
	                 case "items": //items가 열렸다는것은 새로운 책이 나온다는것 
	                     b = new Book();
	                     break;
	                 case "title":
	                     System.out.println(parser.nextText());
	                     break;
	                 }
	                 break;
	             }
	         }
	             eventType =parser.next();
	
	             
	             for(Book book:list)
	     	        System.out.println(book);
	     	    }
	        */ 
	         return jsonView;
	    }
	    
	
}
