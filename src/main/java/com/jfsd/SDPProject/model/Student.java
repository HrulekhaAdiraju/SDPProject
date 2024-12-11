package com.jfsd.SDPProject.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student {

	@Id
	@Column(name="student_id")
	private int id;
	@Column(name="student_name",nullable=false,length=100)
	private String name;
	@Column(name="student_gender",nullable=false,length=20)
	private String gender;
	@Column(name="student_dob",nullable=false,length=20)
	private String dob;
	@Column(name="student_phoneno",nullable=false,unique=true,length=20)
	private String phoneno;
	@Column(name="student_year",nullable=false,length=10)
	private String year;
	@Column(name="student_branch",nullable=false,length=10)
	private String branch;
	@Column(name="student_sec",nullable=false,length=10)
	private String sec;
	@Column(name="student_email",nullable=false,unique=true,length=100)
	private String email;
	@Column(name="student_password",nullable=false,length=100)
	private String password;
    public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	private Blob image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSec() {
		return sec;
	}
	public void setSec(String sec) {
		this.sec = sec;
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


