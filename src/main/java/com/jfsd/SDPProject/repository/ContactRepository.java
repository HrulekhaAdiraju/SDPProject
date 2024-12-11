package com.jfsd.SDPProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jfsd.SDPProject.model.Contact;

public interface ContactRepository extends JpaRepository<Contact, String> {

}
