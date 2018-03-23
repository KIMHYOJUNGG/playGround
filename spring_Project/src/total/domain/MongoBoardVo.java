package total.domain;

public class MongoBoardVo {
	/*db.board.insertOne({
		"no":"글 번호(책 번호_0 .. 책 번호_10 이런 식?)",
		"bno":"책 번호(book 컬렉션의 bno)",
		"contents":"이제 여기가 게시글~ 1000자 맘껏 넘어도 됨ㅋㅋㅋ",
		"image":["게시글에","들어갈","이미지"],
		"tag":["글 태그,"배열"],
		"comments":[
			{"id":"댓글 단 사람 id", "reply":"댓글 내용", "date":"댓글 단 시간"},
			{"id":"댓글 단 사람 id2", "reply":"댓글 내용2", "date":"댓글 단 시간"}
			]
	});*/
	private String no;
	private String bno;
	private String contents;

	private String[] image;
	private String[] tag;
	private String[] coments;

	public  String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
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
	public String[] getComents() {
		return coments;
	}
	public void setComents(String[] coments) {
		this.coments = coments;
	}


	

}
