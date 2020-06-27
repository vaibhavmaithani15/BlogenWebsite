package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "posts")
public class Posts {
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String title;
	private String category ;
	@Column(length = 1500)
	private String body;
	@Column(name="date")
	private Date addedDate;
	@Lob
	@Column(length = 1500)
	private String image;
	public Posts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Posts( String title, String category, String body, Date addedDate, String image) {
		super();
		this.id=new Random().nextInt(100000);
		this.title = title;
		this.category = category;
		this.body = body;
		this.addedDate = addedDate;
		this.image = image;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
