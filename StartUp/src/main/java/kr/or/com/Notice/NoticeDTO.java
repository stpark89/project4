package kr.or.com.Notice;

public class NoticeDTO {

	private String noticeBno;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	
	public String getNoticeBno() {
		return noticeBno;
	}
	public void setNoticeBno(String noticeBno) {
		this.noticeBno = noticeBno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeBno=" + noticeBno + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
}
