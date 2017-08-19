package com.ecust.pojo;

import java.io.Serializable;

public class Equipment implements Serializable{
	//设备ID
	private String equipmentId;
	//公司名称ID
	private String name;
	private String produceName;
	//设备编号
	private String no;
	//设备状态：0正常1待维修2正在维修
	private Integer state;
	//备注
	private String remark;
	//设备类型
	private Integer typeId;
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProduceName() {
		return produceName;
	}
	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}
	
	public String getEquipmentId() {
		return equipmentId;
	}
	public void setEquipmentId(String equipmentId) {
		this.equipmentId = equipmentId;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
}
