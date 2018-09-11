package com.briup.cms.bean;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 基础信息
 */
@Entity
@Table(name="tbl_basicInfo")
public class BasicInfo {
	private Long id;
	//基本信息名称
	private String name;	
	//基本信息的值
	private String content;	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public BasicInfo() {
		
	}
	public BasicInfo(String name, String content) {
		this.name = name;
		this.content = content;
	}
	public BasicInfo(Long id, String name, String content) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
	}
	
}
