package kr.or.com.Member;

public class MemberDTO {

	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private String interest;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", gender=" + gender
				+ ", interest=" + interest + "]";
	}
	
	
	
}
