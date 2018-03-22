package total.domain;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="collection")
public class ImageVO {
	
	private Integer no;
	private Integer bno;
	private String contents;
	private String[] image;
	private String[] tag;
	private String[][] comments;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String[] getImage() {
		return image;
	}
	public void setImage(String[] image) {
		this.image = image;
	}
	public String[] getTag() {
		return tag;
	}
	public void setTag(String[] tag) {
		this.tag = tag;
	}
	public String[][] getComments() {
		return comments;
	}
	public void setComments(String[][] comments) {
		this.comments = comments;
	}
	
	
	
	
	
	
}
