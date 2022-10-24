package bean;

import javax.persistence.*;

@Entity
@Table(name="admin")
public class Admin {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="adminid",nullable = false)
	private int adminid;
	
	@Column(name="admin_name",nullable = false,length = 100)
	private String admin_name;
	
	@Column(name="admin_mobileno",nullable = false,length = 10)
	private String admin_mobileno;
	
	@Column(name="admin_email",nullable = false,length = 255)
	private String admin_email;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="username",unique= true,nullable = false)
	private Login login;

	public int getAdminID() {
		return adminid;
	}

	public void setAdminID(int adminid) {
		this.adminid = adminid;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_mobileno() {
		return admin_mobileno;
	}

	public void setAdmin_mobileno(String admin_mobileno) {
		this.admin_mobileno = admin_mobileno;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}
	
	public String getUsername() {
		return login.getUsername();
	}

	public Admin(int adminid, String admin_name, String admin_mobileno, String admin_email, Login login) {
		super();
		this.adminid = adminid;
		this.admin_name = admin_name;
		this.admin_mobileno = admin_mobileno;
		this.admin_email = admin_email;
		this.login = login;
	}
	
	public Admin() {
		super();
	}

	@Override
	public String toString() {
		return "Admin []";
	}
}
