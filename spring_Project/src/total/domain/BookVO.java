package total.domain;

public class BookVO {
	private String bno;
	private String writer;
	private String bookName;
	private String[] type;
	private String[] tag;
	private int good;
	
	public BookVO() {
		// TODO Auto-generated constructor stub
	}
	public BookVO(String bno, String writer, String bookName, String[] type, String[] tag, int good) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.bookName = bookName;
		this.type = type;
		this.tag = tag;
		this.good = good;
	}
	
	public void setBno(String bno) {
		this.bno = bno;
	}
	public void setId(String id) {
		this.writer = id;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setType(String[] type) {
		this.type = type;
	}
	public void setTag(String[] tag) {
		this.tag = tag;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getBno() {
		return bno;
	}
	public String getId() {
		return writer;
	}
	public String getBookName() {
		return bookName;
	}
	public String[] getType() {
		return type;
	}
	public String[] getTag() {
		return tag;
	}
	public int getGood() {
		return good;
	}
	
	
}
