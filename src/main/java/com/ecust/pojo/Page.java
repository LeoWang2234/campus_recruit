package com.ecust.pojo;

import java.io.Serializable;

public class Page implements Serializable{
	/** 页码 */
	private Integer pageNo;
	/** 每页显示条数 */
	private Integer pageSize;
	/** 总页数 */
	private Integer totalPages;
	/** 总条数 */
	private Integer totalElements;
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	public Integer getTotalElements() {
		return totalElements;
	}
	public void setTotalElements(Integer totalElements) {
		this.totalElements = totalElements;
	}
	public Integer getNumberElements() {
		return numberElements;
	}
	public void setNumberElements(Integer numberElements) {
		this.numberElements = numberElements;
	}
	/** 当页总条数 */
	private Integer numberElements;
}
