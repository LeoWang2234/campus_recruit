package com.ecust.pojo;

import java.io.Serializable;
import java.util.Date;

public class Repair implements Serializable{
	private Integer repairId;
	private Integer equipmentId;
	private Integer createId;
	private Date crateTime;
	private Integer state;
	private Integer repairManId;
	private Date repairTime;
	public Integer getRepairId() {
		return repairId;
	}
	public void setRepairId(Integer repairId) {
		this.repairId = repairId;
	}
	public Integer getEquipmentId() {
		return equipmentId;
	}
	public void setEquipmentId(Integer equipmentId) {
		this.equipmentId = equipmentId;
	}
	public Integer getCreateId() {
		return createId;
	}
	public void setCreateId(Integer createId) {
		this.createId = createId;
	}
	public Date getCrateTime() {
		return crateTime;
	}
	public void setCrateTime(Date crateTime) {
		this.crateTime = crateTime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getRepairManId() {
		return repairManId;
	}
	public void setRepairManId(Integer repairManId) {
		this.repairManId = repairManId;
	}
	public Date getRepairTime() {
		return repairTime;
	}
	public void setRepairTime(Date repairTime) {
		this.repairTime = repairTime;
	}
}
