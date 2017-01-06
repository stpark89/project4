package kr.or.com.board;

public class DashBoard_education_DTO {

	private String title;
	private String link;
	private String date;

	public DashBoard_education_DTO(String title, String link, String date) {
		this.title = title;
		this.link = link;
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "DashBoard_education_DTO [title=" + title + ", link=" + link + ", date=" + date + "]";
	}
	
	
}
