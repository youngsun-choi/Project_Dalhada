package vo;

public class SearchTitleVO {
	private String image;
	private String title;
	private String searchKeyword;
	private int start;
    private int last;
    
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "SearchTitleVO [image=" + image + ", title=" + title + ", searchKeyword=" + searchKeyword + ", start="
				+ start + ", last=" + last + "]";
	}
}
