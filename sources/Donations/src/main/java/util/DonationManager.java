package util;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import bean.*;
//Check
//Add
//GetObject
//List
//Delete
//Update
//New ID
//Tools
public class DonationManager {
	//Check
	public boolean login(String username,String pwd){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Login";
		boolean isUser = false;
		
		Query query = session.createQuery(hql);
		List<Login> list = query.list();
		sessionFactory.close();
		
		for(Login e : list) {
			if(e.getUsername().equals(username) && e.getUpassword().equals(pwd)) {
				isUser = true;
			}
		}
		return isUser;
	}
	
	public boolean isAdmin(String username,String pwd){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Login";
		boolean isUser = false;
		
		Query query = session.createQuery(hql);
		List<Login> list = query.list();
		sessionFactory.close();
		
		for(Login e : list) {
			if(e.getUsername().equals(username) && e.getUpassword().equals(pwd)&&e.getUsertype().equals("admin")) {
				isUser = true;
			}
		}
		return isUser;
	}
	
	public boolean isFinancial_Officer(String username,String pwd){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Login";
		boolean isUser = false;
		
		Query query = session.createQuery(hql);
		List<Login> list = query.list();
		sessionFactory.close();
		
		for(Login e : list) {
			if(e.getUsername().equals(username) && e.getUpassword().equals(pwd)&&e.getUsertype().equals("financial_officer")) {
				isUser = true;
			}
		}
		return isUser;
	}
	
	public boolean isDonatorEmail(String email){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Login";
		boolean isUser = false;
		
		Query query = session.createQuery(hql);
		List<Login> list = query.list();
		sessionFactory.close();
		
		for(Login e : list) {
			if(e.getUsername().equals(email)) {
				isUser = true;
			}
		}
		return isUser;
	}
	//Add
	public boolean addProject(Project project) {
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			
			session.save(project);
			t.commit();
			sessionFactory.close();
			return true;
		}
		catch (Exception e) { 
			sessionFactory.close();
			return false;
		}
	}
	
	public boolean addDonation(Donation donation) {
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			
			session.save(donation);
			
			t.commit();
			sessionFactory.close();
			return true;
		}
		catch (Exception e) { 
			sessionFactory.close();
			return false;
		}
	}
	
	//GetObject
	public Login getLogin(String username,String pwd){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Login";
		Login user = new Login();
		
		Query query = session.createQuery(hql);
		List<Login> list = query.list();
		sessionFactory.close();
		
		for(Login e : list) {
			if(e.getUsername().equals(username) && e.getUpassword().equals(pwd)) {
				user = e;
			}
		}
		return user;
	}
	
	public Project getProject(String projectID,String year){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Project";
		Query query = session.createQuery(hql);
		List<Project> list = query.list();
		sessionFactory.close();
		
		Project project = new Project();
		int id = Integer.parseInt(projectID);
		for(Project p : list) {
			if(id == p.getProjectPK().getProjectID()&&
					p.getProjectYear().equals(year)) {
				project = p;
			}
		}
		return project;
	}
	
	public ProjectDetail getProjectDetail(String project_detail_id,String projectID,String year){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From ProjectDetail";
		Query query = session.createQuery(hql);
		List<ProjectDetail> list = query.list();
		sessionFactory.close();
		
		ProjectDetail detail = new ProjectDetail();
		int detailID = Integer.parseInt(project_detail_id);
		int pID = Integer.parseInt(projectID);
		for(ProjectDetail p : list) {
			if(detailID == p.getProject_detailPK().getProject_detail_id()&&
				pID == p.getProject_detailPK().getProject().getProjectPK().getProjectID()&&
				year.equals(p.getProject_detailPK().getProject().getProjectPK().getYear())) {
				detail = p;
			}
		}
		
		return detail;
	}
	
	public Donation getDonation(String donationID,String projectID,String project_detailID,String year){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Donation";
		Query query = session.createQuery(hql);
		List<Donation> list = query.list();
		sessionFactory.close();
		
		Donation donation = new Donation();
		int dID = Integer.parseInt(donationID);
		int detailID = Integer.parseInt(project_detailID);
		int pID = Integer.parseInt(projectID);
		for(Donation d : list) {
			if(
				dID == d.getDonationID() &&
				detailID == d.getProjectDetailID()&&
				pID == d.getProjectID() &&
				year.equals(d.getProjectID_Year())) {
				donation = d;
			}
		}
		
		return donation;
	}
	
	public Donator getDonator(String taxpayerno){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Donator";
		Query query = session.createQuery(hql);
		List<Donator> list = query.list();
		sessionFactory.close();
		
		Donator donator = new Donator();
		donator.setTaxpayerno("");
		for(Donator d : list) {
			if(taxpayerno.equals(d.getTaxpayerno()) ) {
				donator = d;
			}
		}
		
		return donator;
	}
	
	public Donator getDonator(Login login){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Donator";
		Query query = session.createQuery(hql);
		List<Donator> list = query.list();
		sessionFactory.close();
		Donator donator = new Donator();
		for(Donator d : list) {
			if(login.getUsername().equals(d.getUsername()) ) {
				donator = d;
			}
		}
		
		return donator;
	}
	
	public FinancialOfficer getFinancial_Officer(Login login){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From FinancialOfficer";
		Query query = session.createQuery(hql);
		List<FinancialOfficer> list = query.list();
		sessionFactory.close();
		FinancialOfficer officer = new FinancialOfficer();
		for(FinancialOfficer d : list) {
			if(login.getUsername().equals(d.getUsername()) ) {
				officer = d;
			}
		}
		
		return officer;
	}
	
	public Admin getAdmin(Login login){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Admin";
		Query query = session.createQuery(hql);
		List<Admin> list = query.list();
		sessionFactory.close();
		Admin admin = new Admin();
		for(Admin d : list) {
			if(login.getUsername().equals(d.getUsername()) ) {
				admin = d;
			}
		}
		return admin;
	}
	
	//List
	public List<Project> listProject(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Project";
		
		Query query = session.createQuery(hql);
		List<Project> list = query.list();
		sessionFactory.close();
		return list;
	}
	
	public List<ProjectDetail> listProjectDetail(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From ProjectDetail";
		
		Query query = session.createQuery(hql);
		List<ProjectDetail> list = query.list();
		sessionFactory.close();
		return list;
	}
	
	public List<ProjectDetail> listProjectDetail(Project project){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From ProjectDetail";
		
		Query query = session.createQuery(hql);
		List<ProjectDetail> list = query.list();
		sessionFactory.close();
		
		List<ProjectDetail> pd = new ArrayList();
		for(ProjectDetail p : list) {
			if(project.getProjectPK().getProjectID() == p.getProject_detailPK().getProject().getProjectPK().getProjectID() && 
					project.getProjectPK().getYear().equals(p.getProject_detailPK().getProject().getProjectPK().getYear())) {
				pd.add(p);
			}
		}
		
		
		return pd;
	}
	
	public List<ProjectPicture> listProjectPicture(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From ProjectPicture";
		
		Query query = session.createQuery(hql);
		List<ProjectPicture> list = query.list();
		
		sessionFactory.close();
		
		return list;
	}
	
	public List<ProjectPicture> listProjectPicture(ProjectDetail project){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From ProjectPicture";
		
		Query query = session.createQuery(hql);
		List<ProjectPicture> list = query.list();
		sessionFactory.close();
		List<ProjectPicture> pp = new ArrayList();
		for(ProjectPicture p : list) {
			if(project.getProject_detailPK().getProject_detail_id() == p.getProject_detail().getProject_detailPK().getProject_detail_id() && 
					project.getProject_detailPK().getProject().getProjectPK().getYear().equals(p.getProject_detail().getProject_detailPK().getProject().getProjectPK().getYear())&&
					project.getProject_detailPK().getProject().getProjectPK().getProjectID() == p.getProject_detail().getProject_detailPK().getProject().getProjectPK().getProjectID()) {
				pp.add(p);
			}
		}
		
		return pp;
	}
	
	public List<ProjectPicture> listProjectPicture(String project_detail_id,String projectID,String year){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From ProjectPicture";
		
		Query query = session.createQuery(hql);
		List<ProjectPicture> list = query.list();
		sessionFactory.close();
		
		List<ProjectPicture> pp = new ArrayList();
		for(ProjectPicture p : list) {
			if(Integer.parseInt(project_detail_id) == p.getProject_detail().getProject_detailPK().getProject_detail_id() && 
					year.equals(p.getProject_detail().getProject_detailPK().getProject().getProjectPK().getYear())&&
					Integer.parseInt(projectID) == p.getProject_detail().getProject_detailPK().getProject().getProjectPK().getProjectID()) {
				pp.add(p);
			}
		}
		
		return pp;
	}
	
	public List<Donation> listDonation(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Donation";
		
		Query query = session.createQuery(hql);
		List<Donation> list = query.list();
		sessionFactory.close();
		
		return list;
	}
	
	public List<Donation> listDonation(String projectID,String year,String project_detail_id){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Donation";
		
		Query query = session.createQuery(hql);
		List<Donation> list = query.list();
		sessionFactory.close();
		List<Donation> donation = new ArrayList();
		for(Donation e : list) {
			if(Integer.parseInt(projectID) == e.getProjectID() && 
					year.equals(e.getProjectID_Year())&&
					Integer.parseInt(project_detail_id) == e.getProjectDetailID()) {
				donation.add(e);
			}
			
		}
		
		
		return donation;
	}
	
	public List<Donation> listDonation(Login login){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Donation";
		Query query = session.createQuery(hql);
		List<Donation> list = query.list();
		sessionFactory.close();
		
		List<Donation> donation = new ArrayList();
		Donator donator = this.getDonator(login);
		
		for(Donation e : list) {
			if(donator.getTaxpayerno().equals(e.getTaxpayerno())) {
				donation.add(e);
			}
		}
		return donation;
	}
	
	public List<Donator> listDonator(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Donator";
		
		Query query = session.createQuery(hql);
		List<Donator> list = query.list();
		sessionFactory.close();
		
		return list;
	}
	
	public List<Receipt> listReceipt(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		String hql = "From Receipt";
		
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		sessionFactory.close();
		
		return list;
	}
	
	//Delete
	public int deleteProjectDetail(String projectID,String year,String project_detailID){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			ProjectDetail detail = session.load(ProjectDetail.class, this.getProjectDetail(project_detailID,projectID,year).getProject_detailPK());
			
			for(ProjectPicture pt : this.listProjectPicture(project_detailID,projectID,year)) {
				ProjectPicture picture = session.load(ProjectPicture.class,(Serializable) pt.getProject_pictureid());
				picture.setProject_detail(detail);
				session.delete(picture);
			}
			
			session.delete(detail);
			
			t.commit();
			sessionFactory.close();
			return 1;
		}
		catch (Exception e) { 
		sessionFactory.close();
		return -1;
		}
	}
	
	public int deleteProject(String projectID,String year){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			
			Project project = session.load(Project.class, this.getProject(projectID,year).getProjectPK());
			if(project.getProject_detail().size() <= 1) {
				session.delete(project);
			}
			
			t.commit();
			sessionFactory.close();
			return 1;
		}
		catch (Exception e) { 
		sessionFactory.close();
		return -1;
		}
	}
	
	//Update
	public boolean acceptDonation(Donation donation){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		try {
			Transaction t = session.beginTransaction();
			
			donation.setStatus_donation("ตรวจสอบข้อมูลแล้ว");
			session.update(donation);
			
			t.commit();
			sessionFactory.close();
			return true;
		}
		catch (Exception e) { 
		sessionFactory.close();
		return false;
		}
	}
	
	public boolean rejectDonation(Donation donation){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		try {
			Transaction t = session.beginTransaction();
			
			donation.setStatus_donation("ข้อมูลไม่ถูกต้อง");
			session.update(donation);
			
			t.commit();
			sessionFactory.close();
			return true;
		}
		catch (Exception e) { 
		sessionFactory.close();
		return false;
		}
	}
	
	public boolean receiptDonation(Donation d,String file){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		
		try {
			Transaction t = session.beginTransaction();
			
			Donation donation = (Donation) session.load(Donation.class,(Serializable) d.getDonationPK());
			Receipt receipt = new Receipt(file,Calendar.getInstance(),donation);
			
			session.save(receipt);
			
			t.commit();
			sessionFactory.close();
			return true;
		}
		catch (Exception e) { 
		System.out.println(e);
		sessionFactory.close();
		return false;
		}
	}
	
	//New ID
	public int newProjectID(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Project";
		Query query = session.createQuery(hql);
		List<Project> list = query.list();
		sessionFactory.close();
		int id = 0;
		for(Project p : list) {
			id = p.getProjectPK().getProjectID();
		}
		
		return ++id;
	}
	
	public int newProject_DetailID(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From ProjectDetail";
		Query query = session.createQuery(hql);
		List<ProjectDetail> list = query.list();
		sessionFactory.close();
		int id = 0;
		for(ProjectDetail p : list) {
			id = p.getProject_detailPK().getProject_detail_id();
		}
		
		return ++id;
	}
	
	public int newDonationID(){
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
		String hql = "From Donation";
		Query query = session.createQuery(hql);
		List<Donation> list = query.list();
		sessionFactory.close();
		int id = 0;
		for(Donation p : list) {
			id = p.getDonationID();
		}
		return ++id;
	}
	
	//Tools
	public boolean isReceipt(Donation donation,List<Receipt> receipt){
		for(Receipt e:receipt) {
			if(e.getDonationID() == donation.getDonationID() &&
					e.getProjectID() == donation.getProjectID()&&
					e.getProjectYear().equals(donation.getProjectID_Year())&&
					e.getProjectDetailID() == donation.getProjectDetailID()) {
				return true;
			}
		}
		return false;
	}
	
	public List<ProjectPicture> listPictureJoinProjectDetail(ProjectDetail detail,List<ProjectPicture> picture){
		List<ProjectPicture> list = new ArrayList();
		for(ProjectPicture e:picture) {
			if(e.getProjectID() == detail.getProjectID() &&
					e.getProjectYear().equals(detail.getProjectYear())&&
					e.getProject_DetailID() == detail.getProject_DetailID()) {
				list.add(e);
			}
		}
		return list;
	}
	
	
	//Random Key
	public String Key_Random(){
		int leftLimit = 48; // numeral '0'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 6;
	    Random random = new Random();

	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString().toUpperCase();
				
		return generatedString;
		
	}
}
