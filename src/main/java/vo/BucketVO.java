package vo;

public class BucketVO {
	private int bucket_id;
	private int selectedbucket_id;
	private int group_id;
	private String image_path;
	private String title;
	private int islike;
	private String className;
	
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
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getIslike() {
		return islike;
	}
	public void setIslike(int islike) {
		this.islike = islike;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public void addClass() {
		this.setClassName(islike==0?"js-addlike":"js-addedlike"); 
	}
	@Override
	public String toString() {
		return "BucketVO [bucket_id=" + bucket_id + ", selectedbucket_id=" + selectedbucket_id + ", group_id="
				+ group_id + ", image_path=" + image_path + ", title=" + title + ", islike=" + islike + ", className="
				+ className + "]";
	}
}