package kr.or.com.statute;
/*
 * 의안 DTO
 * 
 * */
public class statuteDTO { 
  private String proposeDt;
  private String billName;
  private String committeeName;
  private String generalResult;
 
public statuteDTO(String proposeDt, String billName, String committeeName, String generalResult) {
	
	this.proposeDt = proposeDt;
	this.billName = billName;
	this.committeeName = committeeName;
	this.generalResult = generalResult;
}

public statuteDTO(String proposeDt, String billName, String committeeName) {
	
	this.proposeDt = proposeDt;
	this.billName = billName;
	this.committeeName = committeeName;
}
public String getBillName() {
	return billName;
}
public void setBillName(String billName) {
	this.billName = billName;
}
public String getProposeDt() {
	return proposeDt;
}
public void setProposeDt(String proposeDt) {
	this.proposeDt = proposeDt;
}
public String getCommitteeName() {
	return committeeName;
}
public void setCommitteeName(String committeeName) {
	this.committeeName = committeeName;
}
public String getGeneralResult() {
	return generalResult;
}
public void setGeneralResult(String generalResult) {
	this.generalResult = generalResult;
}

@Override
public String toString() {
	return "statuteDTO [proposeDt=" + proposeDt + ", billName=" + billName + ", committeeName=" + committeeName + "]";
}

  
  
}
