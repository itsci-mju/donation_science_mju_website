package util;

import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import bean.*;

public class HibernateConnection {
	public static SessionFactory sessionFactory;
	//static String url = "jdbc:mysql://localhost:3306/donation?characterEncoding=UTF-8";
	static String url = "jdbc:mysql://localhost:3306/test?characterEncoding=UTF-8";
	static String uname = "root";
	static String pwd = "1234";
	
	public static SessionFactory doHibernateConnection() {
	Properties database = new Properties();
	
	//database.setProperty("hibernate.hbm2ddl.auto","create");
	database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
	database.setProperty("hibernate.connection.username", uname);//user database
	database.setProperty("hibernate.connection.password", pwd);//password database
	database.setProperty("hibernate.connection.url", url);//UTF8 ����ͧ�Ѻ����
	database.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");//���ҷ����
	
	Configuration cfg = new Configuration().setProperties(database)
											.addPackage("bean")
											.addAnnotatedClass(Donation.class)
											.addAnnotatedClass(Donator.class)
											.addAnnotatedClass(FinancialOfficer.class)
											.addAnnotatedClass(Admin.class)
											.addAnnotatedClass(Login.class)
											.addAnnotatedClass(Project.class)
											.addAnnotatedClass(ProjectDetail.class)
											.addAnnotatedClass(ProjectPicture.class)
											.addAnnotatedClass(Receipt.class);
	StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	sessionFactory = cfg.buildSessionFactory(ssrb.build());
	
	return sessionFactory;
	}
}
