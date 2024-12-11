package com.jfsd.SDPProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.SDPProject.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String>
{
   @Query("select a from Admin a where a.uname=?1 and a.password=?2")
   public Admin checkAdminlogin(String uname,String password);
}
