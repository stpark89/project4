package kr.or.com.Notice;
/*
 * 작성일  : 2016-12-27
 * 작성자  : 하재현
 * 목   적 : Q&A DTO
 * 
 * */
public class QnaDTO {
 
	private int qnaBno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int viewcnt;
	public int getQnaBno() {
		return qnaBno;
	}
	public void setQnaBno(int qnaBno) {
		this.qnaBno = qnaBno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "QnaDTO [qnaBno=" + qnaBno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}
	
	
	
	
}
