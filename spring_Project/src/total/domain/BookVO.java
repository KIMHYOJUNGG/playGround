package total.domain;

public class BookVO {
	private String bno;
	private String id;
	private String bookName;
	private String[] type;
	private String[] tag;
	private int good;
	
	public BookVO(String bno, String id, String bookName, String[] type, String[] tag, int good) {
		super();
		this.bno = bno;
		this.id = id;
		this.bookName = bookName;
		this.type = type;
		this.tag = tag;
		this.good = good;
	}
	
	public String getBno() {
		return bno;
	}
	public String getId() {
		return id;
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
