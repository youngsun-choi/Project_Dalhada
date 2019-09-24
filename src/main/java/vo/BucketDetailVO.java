package vo;

import java.util.List;

public class BucketDetailVO {
	private String title;
	private String content;
	private float lat;
	private float lng;
	private String image;
	private int cnt;
	private int likecnt;
	private String get_member_id;
	private String by_member_id;
	private List<String> tags;
	
	public String getGet_member_id() {
		return get_member_id;
	}
	public void setGet_member_id(String get_member_id) {
		this.get_member_id = get_member_id;
	}
	public String getBy_member_id() {
		return by_member_id;
	}
	public void setBy_member_id(String by_member_id) {
		this.by_member_id = by_member_id;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	@Override
	public String toString() {
		return "BucketDetailVO [title=" + title + ", content=" + content + ", lat=" + lat + ", lng=" + lng + ", image="
				+ image + ", cnt=" + cnt + ", likecnt=" + likecnt + ", get_member_id=" + get_member_id
				+ ", by_member_id=" + by_member_id + ", tags=" + tags + "]";
	}
	
}
