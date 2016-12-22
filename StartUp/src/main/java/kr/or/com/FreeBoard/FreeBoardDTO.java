package kr.or.com.FreeBoard;

public class FreeBoardDTO {

	private int bno;
	private String title;
	private String writer;
	private String regdate;
	private int viewcnt;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
		return "FreeBoardDTO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + "]";
	}
	
}
