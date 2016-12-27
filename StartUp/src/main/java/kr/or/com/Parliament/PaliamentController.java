package kr.or.com.Parliament;

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
/*
 * 작성일 : 2016-12-29
 * 작성자 : 박성준
 * 목  적 : 국회의원 관련 컨트롤러
 */
@Controller
public class PaliamentController {

	@Autowired
	private View jsonView;
	
	//국회의원 헤더부분 클릭시 이동하는 페이지
	@RequestMapping("/Member_Parliament.do")
	public String Parliament_List(Model model){
		return "parliament.ParliamentList";
	}
	
	//국회의원 전체 리스트 뿌려주는 컨트롤러
	@RequestMapping("/XmlParse.do")
	public View xmlParse(Model model)throws Exception{
	    String clientID="";
        String clientSecret = "";
        	
        URL url = new URL("http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberCurrStateList?numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
        
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
        
		model.addAttribute("xml", data);
		return jsonView;
	}
	
	//정당 뽑을라고 이거함. ..
	@RequestMapping("/PaliamentJungDang")
	public View xmlPlusJung(String num, String dept_cd, Model model)throws Exception{
		URL url = new URL("http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd="+dept_cd+"&num="+num+"&numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
        String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        model.addAttribute("jungDang", data);
		return jsonView;
	}
	
	//국회의원 상세보기 - 기본  페이지
	@RequestMapping("/PaliamentDetail")
	public String detail(String num, String dept_cd, String img, Model model){
		model.addAttribute("num", num);
		model.addAttribute("dept_cd", dept_cd);
		model.addAttribute("img", img);
		model.addAttribute("tid", "1");
		return "parliament.ParliamentDetail";
	}
	
	
	//국회의원 상세보기
	@RequestMapping("/PaliamentDetailView.do")
	public View detailPaliment(String num, String dept_cd, String img, Model model) throws Exception{
		System.out.println("넘어온 값 : "+num+ " / dept : "+dept_cd);
		URL url = new URL("http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd="+dept_cd+"&num="+num+"&numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
        
		URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
        
        String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        System.out.println("상세보기 데이타 : "+data);
        
        
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString());
        System.out.println("변환을 해봅시다 : " +obj);
        model.addAttribute("detailImg", img);
        model.addAttribute("detail", obj);
		return jsonView;
	}
	
}
