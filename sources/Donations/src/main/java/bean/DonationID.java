package bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class DonationID implements Serializable {

	@Column(name="donationid",nullable = false)
	private int donationid;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_detail_id",nullable = false, referencedColumnName = "project_detail_id")
	@JoinColumn(name = "projectid",nullable = false, referencedColumnName = "projectid")
	@JoinColumn(name = "year",nullable = false, referencedColumnName = "year")
	private ProjectDetail project_detail;

	public int getDonationid() {
		return donationid;
	}

	public void setDonationid(int donationid) {
		this.donationid = donationid;
	}

	public ProjectDetail getProject_detail() {
		return project_detail;
	}

	public void setProject_detail(ProjectDetail project_detail) {
		this.project_detail = project_detail;
	}

	public DonationID() {
		super();
	}

	public DonationID(int donationid, ProjectDetail project_detail) {
		super();
		this.donationid = donationid;
		this.project_detail = project_detail;
	}
	
	
}
