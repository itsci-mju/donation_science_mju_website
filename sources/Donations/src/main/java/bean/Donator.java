package bean;

import javax.persistence.*;

@Entity
@Table(name="donator")
public class Donator{
	
	@Id
	@Column(name="taxpayerno",nullable = false,length = 13)
	private String taxpayerno;
	
	@Column(name="donatorname",nullable = false,length = 100)
	private String donatorname;
	
	@Column(name="donator_mobileno",nullable = false,length = 10)
	private String donator_mobileno;
	
	@Column(name="donator_email",nullable = false,length = 255)
	private String donator_email;
	
	@Column(name="donator_address",nullable = false,length = 255)
	private String donator_address;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="username",unique= true)
	private Login login;
	
	public String getTaxpayerno() {
		return taxpayerno;
	}

	public void setTaxpayerno(String taxpayerno) {
		this.taxpayerno = taxpayerno;
	}

	public String getDonatorname() {
		return donatorname;
	}

	public void setDonatorname(String donatorname) {
		this.donatorname = donatorname;
	}

	public String getDonator_mobileno() {
		return donator_mobileno;
	}

	public void setDonator_mobileno(String donator_mobileno) {
		this.donator_mobileno = donator_mobileno;
	}

	public String getDonator_email() {
		return donator_email;
	}

	public void setDonator_email(String donator_email) {
		this.donator_email = donator_email;
	}

	public String getDonator_address() {
		return donator_address;
	}

	public void setDonator_address(String donator_address) {
		this.donator_address = donator_address;
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

	public Donator() {
		super();
	}

	public Donator(String taxpayerno, String donatorname, String donator_mobileno, String donator_email,
			String donator_address) {
		super();
		this.taxpayerno = taxpayerno;
		this.donatorname = donatorname;
		this.donator_mobileno = donator_mobileno;
		this.donator_email = donator_email;
		this.donator_address = donator_address;
	}

	public Donator(String taxpayerno, String donatorname, String donator_mobileno, String donator_email,
			String donator_address, Login login) {
		super();
		this.taxpayerno = taxpayerno;
		this.donatorname = donatorname;
		this.donator_mobileno = donator_mobileno;
		this.donator_email = donator_email;
		this.donator_address = donator_address;
		this.login = login;
	}
	
	
}