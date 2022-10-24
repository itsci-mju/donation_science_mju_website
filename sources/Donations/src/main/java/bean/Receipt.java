package bean;

import java.util.Calendar;

import javax.persistence.*;

@Entity
@Table(name="receipt")
public class Receipt{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="receiptid",nullable = false)
	private int receiptid;
	
	@Column(name="file_receipt",nullable = false,length = 100)
	private String file_receipt;
	
	@Column(name="receipt_date",nullable = false)
	private Calendar receipt_date;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="donationid",nullable = false, referencedColumnName = "donationid")
	@JoinColumn(name = "project_detail_id",nullable = false, referencedColumnName = "project_detail_id")
	@JoinColumn(name = "projectid",nullable = false, referencedColumnName = "projectid")
	@JoinColumn(name = "year",nullable = false, referencedColumnName = "year")
	private Donation donation = new Donation();

	public int getReceiptid() {
		return receiptid;
	}

	public void setReceiptid(int receiptid) {
		this.receiptid = receiptid;
	}

	public String getFile_receipt() {
		return file_receipt;
	}

	public void setFile_receipt(String file_receipt) {
		this.file_receipt = file_receipt;
	}

	public Calendar getReceipt_date() {
		return receipt_date;
	}

	public void setReceipt_date(Calendar receipt_date) {
		this.receipt_date = receipt_date;
	}

	public Donation getDonation() {
		return donation;
	}

	public void setDonation(Donation donation) {
		this.donation = donation;
	}
	
	//Key
	public int getDonationID() {
		return donation.getDonationID();
	}
	
	public int getProjectID() {
		return donation.getProjectID();
	}
	
	public String getProjectYear() {
		return donation.getProjectID_Year();
	}
	
	public int getProjectDetailID() {
		return donation.getProjectDetailID();
	}
	//END

	public Receipt(int receiptid, String file_receipt, Calendar receipt_date,Donation donation) {
		super();
		this.receiptid = receiptid;
		this.file_receipt = file_receipt;
		this.receipt_date = receipt_date;
		this.donation = donation;
	}
	
	public Receipt(String file_receipt, Calendar receipt_date,Donation donation) {
		super();
		this.file_receipt = file_receipt;
		this.receipt_date = receipt_date;
		this.donation = donation;
	}

	public Receipt() {
		super();
	}
	
	
}