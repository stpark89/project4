package kr.or.com.statute;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
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
public class StatuteController {

	@Autowired
	private View jsonview;
	
	@RequestMapping("/statute.do")
	public String statute(){
		System.out.println("법률");
		return "statute.statute";
	}
	
	//의안 리스트 출력
	@RequestMapping("/statuteList.do")
	public View statuteList(Model model) throws Exception{
		String clientID="";
        String clientSecret = "";
        	
        URL url = new URL("http://apis.data.go.kr/9710000/BillInfoService/getBillInfoList?ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
        
        URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 
        
        urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
		urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        
        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
        
        String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString());
		model.addAttribute("statutelist", obj);
		System.out.println(" 의안 리스트");
		return jsonview;
	}
}
