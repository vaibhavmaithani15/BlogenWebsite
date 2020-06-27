package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "category")
public class Category {
	@Id
	private int id;
	private String title;
	private Date date;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String title, Date date) {
		super();
		this.id =new Random().nextInt(100000);
		this.title = title;
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
