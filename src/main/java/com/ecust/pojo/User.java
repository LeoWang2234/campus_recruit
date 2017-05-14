package com.ecust.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	private Integer id;
	//账号
	private String userName;
	private String password;
	//真实姓名
	private String trueName;
	//角色：管理员，使用者，维修者
	private String roleName;
	//部门
	private String deptName;
	private Integer createId;
	private Date createTime; 
	private String phone;
	public Integer getCreateId() {
		return createId;
	}

	public void setCreateId(Integer createId) {
		this.createId = createId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getId() {
		return id;
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password="
				+ password + ", trueName=" + trueName + ", roleName="
				+ roleName + ", deptName=" + deptName + ", createId="
				+ createId + ", createTime=" + createTime + ", phone=" + phone
				+ "]";
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	
	
	
}
