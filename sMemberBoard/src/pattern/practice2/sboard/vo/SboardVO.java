package pattern.practice2.sboard.vo;

public class SboardVO {

	private String bno;
	private String bsubject;
	private String bname;
	private String bpw;
	private String bmemo;
	private String binsertdate;
	private String bupdatedate;
	private String bdeleteyn;
	
	// getter setter
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBpw() {
		return bpw;
	}
	public void setBpw(String bpw) {
		this.bpw = bpw;
	}
	public String getBmemo() {
		return bmemo;
	}
	public void setBmemo(String bmemo) {
		this.bmemo = bmemo;
	}
	public String getBinsertdate() {
		return binsertdate;
	}
	public void setBinsertdate(String binsertdate) {
		this.binsertdate = binsertdate;
	}
	public String getBupdatedate() {
		return bupdatedate;
	}
	public void setBupdatedate(String bupdatedate) {
		this.bupdatedate = bupdatedate;
	}
	public String getBdeleteyn() {
		return bdeleteyn;
	}
	public void setBdeleteyn(String bdeleteyn) {
		this.bdeleteyn = bdeleteyn;
	}
	
	// printVO
	public static void printVO(){
		SboardVO sbvo = new SboardVO();
		System.out.println("VO 데이터확인 >>>\nbno:" + sbvo.getBno()
									  + "\nbsubject:" + sbvo.getBsubject()
									  + "\nbname:" + sbvo.getBname()
									  + "\nbpw:" + sbvo.getBpw()
									  + "\nbmemo:" + sbvo.getBmemo()
									  + "\nbinsertdate:" + sbvo.getBinsertdate()
									  + "\nbupdatedate:" + sbvo.getBupdatedate()
									  + "\nbdeleteyn:" + sbvo.getBdeleteyn());
	}// end of printVO
	
} // end of SboardVO
