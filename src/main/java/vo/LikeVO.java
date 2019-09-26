package vo;

public class LikeVO {
	private int selectedBucket_id;
	private String member_id;
	
	public int getSelectedBucket_id() {
		return selectedBucket_id;
	}
	public void setSelectedBucket_id(int selectedBucket_id) {
		this.selectedBucket_id = selectedBucket_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "LikeVO [selectedBucket_id=" + selectedBucket_id + ", member_id=" + member_id + "]";
	}
}
