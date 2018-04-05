package total.domain;

import java.util.Date;

public class BoardVO {
	
	/* no number(4,0)not null, -- 글번호 (몽고디비와 맞게끔...)
	 bno varchar2(30) not null, -- 책 번호 (몽고디비 book 컬렉션의 bno)
	 title varchar2(1000) not null, -- 게시글 제목
	 bookname varchar2(1000) not null,
	 regdate date not null, -- 작성일자
	 type varchar2(20) not null, -- 분류
	 writer varchar2(30) not null, -- 작가(member의 id)
	 good number(2,0) default 0, -- 좋아요 수
	 viewcnt number(4,0) default 0, -- 조회 수
	 red varchar2(10) default 'N',  --신고가 들어왔는지를
	 
	 
	 insert into board (no, bno, title, bookname, regdate, type, writer) 
 values(board_seq.nextval,#{bno},#{title}, #{bookname}, sysdate, #{type}, #{writer})
	*/
	private int no;
	private String bno;
	private String tag;
	private String title;
	private String type;
	private String book;
	private String bookname;
	private String writer;
	private String content;
	private Date regdate;
	private int viewcnt;
	private int good;
	private int replycnt;

	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", bno=" + bno + ", tag=" + tag + ", title=" + title + ", type=" + type + ", book="
				+ book + ", bookname=" + bookname + ", writer=" + writer + ", content=" + content + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", good=" + good + ", replycnt=" + replycnt + "]";
	}
	

	

	
	
	

}
