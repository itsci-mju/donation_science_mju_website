package bean;

import javax.persistence.*;

@Entity
@Table(name="login")
public class Login{

	@Id
	@Column(name="username",nullable = false,length = 100,unique= true)
	private String username;
	
	@Column(name="upassword",nullable = false,length = 16)
	private String upassword;
	
	@Column(name="usertype",nullable = false,length = 100)
	private String usertype;
	/*
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "taxpayerno", referencedColumnName = "taxpayerno")
    private Donator donator;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "financial_officerid", referencedColumnName = "financial_officerid")
    private FinancialOfficer financial_officer;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "adminid", referencedColumnName = "adminid")
    private Admin admin;
	 */
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
/*
	public Donator getDonator() {
		return donator;
	}

	public void setDonator(Donator donator) {
		this.donator = donator;
	}

	public FinancialOfficer getFinancial_officer() {
		return financial_officer;
	}

	public void setFinancial_officer(FinancialOfficer financial_officer) {
		this.financial_officer = financial_officer;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
*/
	public Login(String username, String upassword, String usertype) {
		super();
		this.username = username;
		this.upassword = upassword;
		this.usertype = usertype;
	}

	public Login() {
		super();
	}
	
	
}