package com.entities;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import org.hibernate.annotations.Table;

@Entity
@javax.persistence.Table(name = "users")
public class Users {
	@Id
	private int id;
	private String name;
	private String email;
	private String password;
	private String cpassword;
	
	public Users(String name,String email, String password, String cpassword) {
		super();
		this.id=new Random().nextInt(100000);
		this.name=name;
		this.email = email;
		this.password = password;
		this.cpassword=cpassword;
		
	}
	
	
	public String getCpassword() {
		return cpassword;
	}


	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
