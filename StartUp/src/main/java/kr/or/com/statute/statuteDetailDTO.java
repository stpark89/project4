package kr.or.com.statute;
/**
 * 의안 상세 DTO
 * 
 */
public class statuteDetailDTO {
	 
	  private String billName;
	  private String committeeName;
	  private String billId;
	  private String summary;
	  private String proposer;
	
	  
   public statuteDetailDTO(String billName, String committeeName, String billId, String summary, String proposer) {
		this.billName = billName;
		this.committeeName = committeeName;
		this.billId = billId;
		this.summary = summary;
		this.proposer = proposer;
	}
	
	public String getBillName() {
		return billName;
	}
	public void setBillName(String billName) {
		this.billName = billName;
	}
	public String getCommitteeName() {
		return committeeName;
	}
	public void setCommitteeName(String committeeName) {
		this.committeeName = committeeName;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getProposer() {
		return proposer;
	}
	public void setProposer(String proposer) {
		this.proposer = proposer;
	}
	@Override
	public String toString() {
		return "statuteDetailDTO [billName=" + billName + ", committeeName=" + committeeName + ", billId=" + billId
				+ ", summary=" + summary + ", proposer=" + proposer + "]";
	}
	  
	  
}
