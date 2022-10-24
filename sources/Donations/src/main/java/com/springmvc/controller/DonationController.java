package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.DonationManager;

@Controller
public class DonationController {
	
	@RequestMapping(value="/loadindex",method=RequestMethod.GET) 
	public String loadIndexPage(){ 
		return "index"; 
	}
	@RequestMapping(value="/loadDonation",method=RequestMethod.GET) 
	public String loadDonationPage(){ 
		return "donation"; 
	}
	@RequestMapping(value="/loadDonator",method=RequestMethod.GET) 
	public String loadDonatorPage(){ 
		return "donator"; 
	}
	@RequestMapping(value="/loadOfficer",method=RequestMethod.GET) 
	public String loadOfficerPage(){ 
		return "financial_officer"; 
	}
	@RequestMapping(value="/loadAdmin",method=RequestMethod.GET) 
	public String loadAdminPage(){ 
		return "admin"; 
	}
	@RequestMapping(value="/loadListProject",method=RequestMethod.GET) 
	public String loadListProjectPage(){ 
		return "listProject";
	}
	@RequestMapping(value="/loadAddProject",method=RequestMethod.GET) 
	public String loadAddProjectPage(){ 
		return "addProject";
	}
	@RequestMapping(value="/loadProjectDetail",method=RequestMethod.GET) 
	public String loadProjectDetailPage(HttpServletRequest request){
		return "projectDetail";
	}
	@RequestMapping(value="/loadListDonation",method=RequestMethod.GET) 
	public String loadListDonationPage(HttpServletRequest request){
		return "listDonation";
	}
	@RequestMapping(value="/loadListDonator",method=RequestMethod.GET) 
	public String loadListDonatorPage(HttpServletRequest request){
		return "listDonator";
	}
	@RequestMapping(value="/loadDonationDetail",method=RequestMethod.GET) 
	public String loadDonationDetailPage(HttpServletRequest request){
		return "donationDetail";
	}
	@RequestMapping(value="/loadDonationDonator",method=RequestMethod.GET) 
	public String loadDonationDonatorPage(HttpServletRequest request){
		return "donationDonator";
	}
	@RequestMapping(value="/loadReceipt",method=RequestMethod.GET) 
	public String loadReceiptPage(HttpServletRequest request){
		return "receipt";
	}
	@RequestMapping(value="/loadDonatorProfile",method=RequestMethod.GET) 
	public String loadDonatorProfilePage(HttpServletRequest request){
		return "donatorProfile";
	}
	
	
}
