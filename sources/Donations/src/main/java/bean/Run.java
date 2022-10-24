package bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import util.DonationManager;
import util.HibernateConnection;

public class Run {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session =sessionFactory.openSession();
		Transaction t=session.beginTransaction();
		
		DonationManager dm = new DonationManager();
		/*
		String hql = "From Donation";
		Query query = session.createQuery(hql);
		List<Donation> list = query.list();
		for(Donation p : list) {
			System.out.println(p.getProjectID());
		}*/
		
		/*
		//PJ
		Project p = new Project(1,"test");
		p.getProjectPK().setProjectID(dm.newProjectID());
		
		//Detail
		Calendar date = Calendar.getInstance();
		ProjectDetail pd = new ProjectDetail("test",date,date);
		pd.getProject_detailPK().setProject_detail_id(dm.newProject_DetailID());
		p.getProject_detail().add(pd);
		pd.getProject_detailPK().setProject(p);
		
		//PP
		ProjectPicture pt = new ProjectPicture("test");
		pt.setProject_detail(pd);
		pd.getProject_picture().add(pt);
		
		session.save(p);
		*/
		
		
		//session.save(pt);
		//AddProject
		
		/*
		Donation d = new Donation("ทุนการศึกษาสำหรับนักศึกษา", 500, "donation1.png", "พุฒิพงศ์ ชมชิด","90 ต.หนองหาร อ.สันทราย จ.เชียงใหม่ 50290", "ส่งใบเสร็จรับเงินแล้ว", Calendar.getInstance());
		d.getDonationID().setDonationid(dm.newDonationID());
		d.getDonationID().setProject_detail(pd);
		
		Donator dt = new Donator("1234567890123", "พุฒิพงศ์ ชมชิด", "0958805467", "Jett@gmail.com","90 ต.หนองหาร อ.สันทราย จ.เชียงใหม่ 50290");
		d.setDonator(dt);
		
		Login login = new Login("putty","1234","donator");
		dt.setLogin(login);
		
		//session.save(login);
		session.save(d);
		//addDonation
		*/
		
		/*
		Login la = new Login("admin","1234","admin");
		Login lf = new Login("officer","1234","financial_officer");
		Login ld = new Login("donator","1234","donator");
		Admin a = new Admin(1, "พรชัย", "0950000000", "admin@gmail.com", la);
		FinancialOfficer f = new FinancialOfficer(1, "ปราณี", "0958850000","officer@gmail.com", lf);
		Donator d = new Donator("1234567890123", "พุฒิพงศ์", "0958805467", "kepler142593@gmail.com","90/1",ld);
		session.save(a);
		session.save(d);
		session.save(f);
		*/
		
		List<ProjectDetail> ld = dm.listProjectDetail();
		List<Project> lpro = dm.listProject();
		
		Project project = session.load(Project.class, lpro.get(3).getProjectPK());
		System.out.println(project.getProject_detail().size());
		
		
		//ProjectDetail pd = session.load(ProjectDetail.class, ld.get(3).getProject_detailPK());
		//pd.getProject_detailPK().setProject(project);
		//System.out.println(pd.getProjectID());
		
		if(project.getProject_detail().size() <= 1) {
			/*
			List<ProjectDetail> list = new ArrayList();
			list.add(pd);
			project.setProject_detail(list);*/
			session.delete(project);
		}
		
		System.out.println("Detail : ");
		//session.delete(pd);
		System.out.println("Project : ");
		
		
		/*
		List<ProjectPicture> lp = dm.listProjectPicture();
		ProjectPicture pp = session.load(ProjectPicture.class, (Serializable) lp.get(2).getProject_pictureid());
		pp.setProject_detail(pd);
		System.out.println(pp.getProject_detail().getProject_detailPK().getProject_detail_id());
		session.delete(pp);*/
		
		t.commit();
		
		sessionFactory.close();
		System.out.println("successfully saved");
	}

}
