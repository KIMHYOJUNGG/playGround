package total.domain;

import java.util.Date;

public class ReportVO {

	
	private int rno;
	private int no;
	private String reason;
	private String readcheck;
	private String writer;
	/* create table report(
			 no number(4,0) not null,
			 bno number(4,0) not null,
			 reason varchar2(1000) not null,
			 readcheck varchar2(10) default 'N',

			 constraint report_rule01 primary key(no),
			 constraint report_rule02 foreign key(bno) references board(no),
			 constraint report_rule03 check(readcheck in ('Y','N'))

			 );
						 
	 */
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getReadcheck() {
		return readcheck;
	}
	public void setReadcheck(String readcheck) {
		this.readcheck = readcheck;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "ReportVO [rno=" + rno + ", no=" + no + ", reason=" + reason + ", readcheck=" + readcheck + ", writer="
				+ writer + "]";
	}
	
	
	
	
	
	

}
