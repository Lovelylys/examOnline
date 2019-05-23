package com.zh.pojo;
/**
 * 题目类型
 * @author hspcadmin
 *
 */
public class Type {
	/**题型编号*/
	private Integer typeId;
	/**题型名称*/
	private String typeName;
	/**分值*/
	private Float score;

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	/**备注*/
	private String remark;
	public String getTypeName() {
		return typeName;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Type() {

	}
	public Type(int typeId, String typeName, Float score, String remark) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.score = score;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Type [typeId=" + typeId + ", typeName=" + typeName + ", score="
				+ score + ", remark=" + remark + "]";
	}
	
}
