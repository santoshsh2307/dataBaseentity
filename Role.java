package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="role")
public class Role {//UserDetails
	
	
	private Long id;
	
	private String nameOfRole;//userName
	
	private String code;
	
	private Boolean statusName;

	@Id
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getNameOfRole() {
		return nameOfRole;
	}

	public void setNameOfRole(String nameOfRole) {
		this.nameOfRole = nameOfRole;
	}

	@Column(name = "code")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "status")
	public Boolean getStatusName() {
		return statusName;
	}

	public void setStatusName(Boolean statusName) {
		this.statusName = statusName;
	}
}
