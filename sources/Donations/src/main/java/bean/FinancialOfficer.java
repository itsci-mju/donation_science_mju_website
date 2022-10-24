package bean;

import javax.persistence.*;

@Entity
@Table(name="financial_officer")
public class FinancialOfficer{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="financial_officerid",nullable = false)
	private int financial_officerid;
	
	@Column(name="financial_officername",nullable = false,length = 100)
	private String financial_officername;
	
	@Column(name="financial_officer_mobileno",nullable = false,length = 10)
	private String financial_officer_mobileno;
	
	@Column(name="financial_officer_email",nullable = false,length = 255)
	private String financial_officer_email;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="username",unique= true,nullable = false)
	private Login login;

	public int getFinancial_officerid() {
		return financial_officerid;
	}

	public void setFinancial_officerid(int financial_officerid) {
		this.financial_officerid = financial_officerid;
	}

	public String getFinancial_officername() {
		return financial_officername;
	}

	public void setFinancial_officername(String financial_officername) {
		this.financial_officername = financial_officername;
	}

	public String getFinancial_officer_mobileno() {
		return financial_officer_mobileno;
	}

	public void setFinancial_officer_mobileno(String financial_officer_mobileno) {
		this.financial_officer_mobileno = financial_officer_mobileno;
	}

	public String getFinancial_officer_email() {
		return financial_officer_email;
	}

	public void setFinancial_officer_email(String financial_officer_email) {
		this.financial_officer_email = financial_officer_email;
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

	public FinancialOfficer(int financial_officerid, String financial_officername, String financial_officer_mobileno,
			String financial_officer_email, Login login) {
		super();
		this.financial_officerid = financial_officerid;
		this.financial_officername = financial_officername;
		this.financial_officer_mobileno = financial_officer_mobileno;
		this.financial_officer_email = financial_officer_email;
		this.login = login;
	}

	public FinancialOfficer() {
		super();
	}
	
	
}