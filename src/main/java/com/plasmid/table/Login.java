package com.plasmid.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "login")
public class Login {
	@Id
	@GeneratedValue
	private String username;
	private String password;
	private String firstname;
	private String lastname;

	public String getUsername() {
		return username;
	}
	
	public String getFirstname() {
		return firstname;
	}
	
	public String getLastname() {
		return lastname;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String pass) {
		this.password=pass;
	}
	public void setUsername(String user) {
		this.username=user;
	}
	
	public void setFirstname(String user) {
		this.firstname=user;
	}
	
	public void setLastname(String user) {
		this.lastname=user;
	}

}