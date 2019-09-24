package vo;

public class LikeGetVO {
	private int seqId;
	private String member_id;
	private int bucket_id;
	private int selectedbucket_id; 
	private int cnt;
	
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBucket_id() {
		return bucket_id;
	}
	public void setBucket_id(int bucket_id) {
		this.bucket_id = bucket_id;
	}
	public int getSelectedbucket_id() {
		return selectedbucket_id;
	}
	public void setSelectedbucket_id(int selectedbucket_id) {
		this.selectedbucket_id = selectedbucket_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "LikeGetVO [seqId=" + seqId + ", member_id=" + member_id + ", bucket_id=" + bucket_id
				+ ", selectedbucket_id=" + selectedbucket_id + ", cnt=" + cnt + "]";
	}
}
