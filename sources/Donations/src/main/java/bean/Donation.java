package bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="donation")
public class Donation implements Serializable {
	
	@EmbeddedId
	private DonationID donationPK = new DonationID();
	
	@Column(name="objective",nullable = false,length = 100)
	private String objective;
	
	@Column(name="amount",nullable = false)
	private double amount;
	
	@Column(name="donationIMG",nullable = false,length = 100)
	private String donationIMG;
	
	@Column(name="donation_name",nullable = false,length = 200)
	private String donation_name;
	
	@Column(name="address_donation",nullable = false,length = 250)
	private String address_donation;
	
	@Column(name="status_donation",nullable = false,length = 100)
	private String status_donation;
	
	@Column(name="show_donation",nullable = false)
	private boolean show_donation;
	
	@Column(name="donation_date",nullable = false)
	private Calendar donation_date;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="taxpayerno",nullable = false)
	private Donator donator;

	public DonationID getDonationPK() {
		return donationPK;
	}

	public void setDonationPK(DonationID donationPK) {
		this.donationPK = donationPK;
	}

	public String getObjective() {
		return objective;
	}

	public void setObjective(String objective) {
		this.objective = objective;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getDonationIMG() {
		return donationIMG;
	}

	public void setDonationIMG(String donationIMG) {
		this.donationIMG = donationIMG;
	}

	public String getDonation_name() {
		return donation_name;
	}

	public void setDonation_name(String donation_name) {
		this.donation_name = donation_name;
	}

	public String getAddress_donation() {
		return address_donation;
	}

	public void setAddress_donation(String address_donation) {
		this.address_donation = address_donation;
	}

	public String getStatus_donation() {
		return status_donation;
	}

	public void setStatus_donation(String status_donation) {
		this.status_donation = status_donation;
	}

	public Calendar getDonation_date() {
		return donation_date;
	}

	public void setDonation_date(Calendar donation_date) {
		this.donation_date = donation_date;
	}

	public Donator getDonator() {
		return donator;
	}

	public void setDonator(Donator donator) {
		this.donator = donator;
	}

	public Donation() {
		super();
	}
	//Key
	public int getDonationID() {
		return donationPK.getDonationid();
	}
	
	public int getProjectDetailID() {
		return donationPK.getProject_detail().getProject_DetailID();
	}
	
	public int getProjectID() {
		return donationPK.getProject_detail().getProjectID();
	}
	
	public String getProjectID_Year() {
		return donationPK.getProject_detail().getProjectYear();
	}
	
	public String getTaxpayerno() {
		return donator.getTaxpayerno();
	}
	
	public boolean isShow_donation() {
		return show_donation;
	}

	public void setShow_donation(boolean show_donation) {
		this.show_donation = show_donation;
	}

	//END
	public boolean isProjectDonation(int projectID,int project_detailID,String year) {
		if(
			getProjectID() == projectID &&
			getProjectDetailID() == project_detailID&&
			getProjectID_Year().equals(year)
		) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public Donation(String objective, double amount, String donationIMG, String donation_name,
			String address_donation, String status_donation, boolean show_donation, Calendar donation_date) {
		super();
		this.objective = objective;
		this.amount = amount;
		this.donationIMG = donationIMG;
		this.donation_name = donation_name;
		this.address_donation = address_donation;
		this.status_donation = status_donation;
		this.show_donation = show_donation;
		this.donation_date = donation_date;
	}

	public Donation(DonationID donationPK, String objective, double amount, String donationIMG, String donation_name,
			String address_donation, String status_donation, boolean show_donation, Calendar donation_date,
			Donator donator) {
		super();
		this.donationPK = donationPK;
		this.objective = objective;
		this.amount = amount;
		this.donationIMG = donationIMG;
		this.donation_name = donation_name;
		this.address_donation = address_donation;
		this.status_donation = status_donation;
		this.show_donation = show_donation;
		this.donation_date = donation_date;
		this.donator = donator;
	}
	
	
}