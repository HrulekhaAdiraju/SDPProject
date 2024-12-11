package com.jfsd.SDPProject.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin 
{
	@Id
	@Column(name="admin_uname",length=100)
	private String uname;
	@Column(name="admin_password",length=100,nullable=false)
	private String password;
    public String getUname()
    {
    	return uname;
    }
    public String getPassword()
    {
    	return password;
    }
    public void setPassword(String password)
    {
    	this.password=password;
    }
    public void setUname(String uname)
    {
    	this.uname=uname;
    }
}

