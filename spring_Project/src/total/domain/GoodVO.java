package total.domain;

public class GoodVO {

	private int targetboard;
	private String wholike;
	public int getTargetboard() {
		return targetboard;
	}
	public void setTargetboard(int targetboard) {
		this.targetboard = targetboard;
	}
	public String getWholike() {
		return wholike;
	}
	public void setWholike(String wholike) {
		this.wholike = wholike;
	}
	@Override
	public String toString() {
		return "GoodVO [targetboard=" + targetboard + ", wholike=" + wholike + "]";
	}
	
}
