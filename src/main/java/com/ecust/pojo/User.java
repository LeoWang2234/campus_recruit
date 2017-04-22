package com.ecust.pojo;

import java.io.Serializable;

public class User implements Serializable{
	private Integer id;
	private String userName;
	private String password;
	private String trueName;
	//角色：管理员，使用者，维修者
	private String roleName;
	private Integer deptId;
	private String deptName;
	public Integer getId() {
		return id;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password="
				+ password + ", trueName=" + trueName + ", roleName="
				+ roleName + ", deptId=" + deptId + ", deptName=" + deptName
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
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	
}
