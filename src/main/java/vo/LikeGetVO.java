package vo;

public class LikeGetVO {
	private int id;
	private int cnt;
	private int selectedbucket_id;
	private String member_id;
	
	public LikeGetVO(){ 
		 this.cnt=0; 
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getSelectedbucket_id() {
		return selectedbucket_id;
	}

	public void setSelectedbucket_id(int selectedbucket_id) {
		this.selectedbucket_id = selectedbucket_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "LikeGetVO [id=" + id + ", cnt=" + cnt + ", selectedbucket_id=" + selectedbucket_id + ", member_id="
				+ member_id + "]";
	}
}
