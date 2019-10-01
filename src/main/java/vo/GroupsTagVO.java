package vo;

import java.util.List;

public class GroupsTagVO {
	private List<GroupVO> groups;
	private List<StringIntVO> tags;
	private String id;
	public List<GroupVO> getGroups() {
		return groups;
	}
	public void setGroups(List<GroupVO> groups) {
		this.groups = groups;
	}
	public List<StringIntVO> getTags() {
		return tags;
	}
	public void setTags(List<StringIntVO> tags) {
		this.tags = tags;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
